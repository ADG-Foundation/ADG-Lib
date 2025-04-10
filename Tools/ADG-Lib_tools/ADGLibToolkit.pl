% ------------------------------------- 
% Converts FOL TPTP conjecures into
% into other variants and
% into GCLC
% ------------------------------------- 
% ------------------------------------- 
% Run like this:
% swi-prolog.swipl ADGLibToolkit.pl 
% ------------------------------------- 
% ------------------------------------- 
% For stand alone version do:
% swipl -o ADGLibToolkit -t run -c ADGLibToolkit.pl --stand_alone=true
%
% Run as:
% .\ADGLibToolkit thm.p thm.gcl
% ------------------------------------- 

:- op( 100, xfx, =).
:- op( 500, fy,  ~).    % negation
:- op(1000, xfy, &).    % conjunction
:- op(1100, xfy, '|').  % disjunction
:- op(1110, xfy, =>).   % conditional
:- op(1120, xfy, <=>).  % biconditional
:- op( 500, fy,  !).    % universal quantifier:   ![X]:
:- op( 500, fy,  ?).    % existential quantifier: ?[X]:
:- op( 500, xfy, :).

% -------------------------------------

:- consult('misc.pl').

:- consult('lines2points_module.pl').
:- consult('axioms2premises_module.pl').
:- consult('removeLayout_module.pl').

:- consult('provers_module.pl').
:- consult('gclc_module.pl').

% --------------------------------------
% transformation of list of FOL formulae
% input is a list of items of the form fof(Name, Ax, F) plus comments

run_conversion :- 
    current_prolog_flag(argv, ArgvAll), 
    append([InputFilename, OutputFileName], Argv, ArgvAll),
    write_message(InputFilename, OutputFileName, Argv),
    write_help(Argv),   
    tell(OutputFileName),
    write_message(InputFilename, OutputFileName, Argv),
    translate_file(InputFilename, Argv), 
    told(),
    nl,nl.     

write_message(InputFilename, OutputFileName, Argv) :-
    write('% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------'),nl,   
    write('% Input: '), write(InputFilename), write('; '), 
    write('Output: '), write(OutputFileName), write('; '), 
    write('Arg: '), write(Argv),nl.   

write_help(Argv) :-
    member('-h', Argv),!, 
    nl,
    nl,write('Usage: '),
    nl,write('> fol2gclc InputFile OutputFile option'),
    nl,write('Options: '),
    nl,write('-l : tptp/fof lines -> tptp/fof points-only   '),
    nl,write('-r : remove layout information                 '),
    nl,write('-p : tptp/fof axioms -> tptp/fof premises=>goal'),
    nl,write('-g : tptp/fof -> gclc'),
    nl,write('-h : this help'), nl, nl.
write_help(_Argv).


translate_file(InputFilename, Argv) :-   
    member('-r', Argv),!, 
    % can be used only if the premises are separare axioms, not the form premises=>goal
    translate_tptp_file(folRemoveLayoutAxioms, InputFilename).
translate_file(InputFilename, Argv) :-   
    member('-l', Argv),!, 
    % can be used only if the premises are separare axioms, not the form premises=>goal
    assert(counterVar(1)),
    translate_tptp_file(folLines2Points, InputFilename).
translate_file(InputFilename, Argv) :-   
    member('-p', Argv),!, 
    assert(allpremises([])), 
    translate_tptp_file(folAxioms2Premises, InputFilename).
translate_file(InputFilename, _Argv) :-   
    % default 
    % member('-g', Argv),!, 
    % can be used only for the form premises=>goal
    assert(counterVar(1)),
    translate_tptp_file(fol2gclc, InputFilename).

translate_tptp_file(Conversion_type, InputFile) :- 
    take_leading_comments(InputFile),    
    open(InputFile, read, Stream),
    read_file(Stream, ListOfTerms),
    close(Stream),
    translate_tptp_list_of_terms(Conversion_type, ListOfTerms).

take_leading_comments(InputFile) :-
    open(InputFile, read, Stream),
    read_comments(Stream),
    close(Stream).

read_comments(Stream) :-
    at_end_of_stream(Stream), !.
read_comments(Stream) :-
    read_line_to_string(Stream, Line),
    string_chars(Line, ['%'|_]),
    write(Line),nl,
    read_comments(Stream).
read_comments(_) :- !.

read_file(Stream,[[X,M]|L]) :-
    read_term(Stream,X,[variable_names(M)]),
    not(X == end_of_file), !,
    read_file(Stream,L).
read_file(_Stream,[]).

% --------------------------------------------------------

translate_tptp_list_of_terms(_Conversion_type, []) :- !.
translate_tptp_list_of_terms(Conversion_type, [[F,M]| T]) :- 
    translate_tptp_entry(Conversion_type, F,M),
    newlineifnewpredicate(Conversion_type,[F|T]),
    translate_tptp_list_of_terms(Conversion_type, T).        

translate_tptp_entry(folAxioms2Premises, F, M) :-
    translate_tptp_entry_folAxioms2Premises(F, M).
translate_tptp_entry(folLines2Points, F, M) :-
    translate_tptp_entry_folLines2Points(F, M).
translate_tptp_entry(fol2gclc, F, M) :-
    translate_tptp_entry_fol2gclc(F, M).
translate_tptp_entry(folRemoveLayoutAxioms, F, M) :-
    translate_tptp_entry_folRemoveLayoutAxioms(F, M).

% Group together (without new lines) commands with similar names
newlineifnewpredicate(folAxioms2Premises, _) :- !.
%newlineifnewpredicate(folRemoveLayoutAxioms,_) :- !.
newlineifnewpredicate(_Conversion_type, []) :- !.
newlineifnewpredicate(_Conversion_type, [_]) :- !.
newlineifnewpredicate(_Conversion_type, [ fof(_,_,A) | T]) :- 
    T = [[ fof(_,_,B) , _]|_], 
    functor(A, Name1, Arity),
    string_to_list(Name1, L1),
    functor(B, Name2, Arity),
    string_to_list(Name2, L2),    
    firstFour(L1, L),
    firstFour(L2, L), !.
newlineifnewpredicate(_Conversion_type, [ A | T]) :- 
    T = [ B | _],
    functor(A, Name1, Arity),
    string_to_list(Name1, L1),
    functor(B, Name2, Arity),
    string_to_list(Name2, L2),    
    firstFour(L1, L),
    firstFour(L2, L), !.
newlineifnewpredicate(_Conversion_type, _) :- nl.    

% ------------------------------------- 

:- set_prolog_flag(verbose, silent).
run :- 
   run_conversion.

% ------------------------------------- 


    


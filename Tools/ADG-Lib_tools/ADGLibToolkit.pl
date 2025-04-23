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
:- consult('geocoq_module.pl').
:- consult('geogebra_module.pl').
:- consult('prolog_module.pl').

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
    nl,write('> ADGLibToolkit InputFile OutputFile option'),
    nl,write('Options: '),
    nl,write('-l : tptp/fof lines -> tptp/fof points-only   '),
    nl,write('-r : remove layout information                 '),
    nl,write('-p : tptp/fof axioms -> tptp/fof premises=>goal'),
    nl,write('-gclc : tptp/fof -> gclc'),
    nl,write('-geogebra : tptp/fof -> geogebra'),
    nl,write('-geocoq : tptp/fof -> geocoq'),
    nl,write('-prolog : tptp/fof -> prolog'),
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
translate_file(InputFilename, Argv) :-   
    member('-prolog', Argv),!, 
    translate_tptp_file(fol2prolog, InputFilename).
translate_file(InputFilename, Argv) :-   
    member('-geocoq', Argv),!, 
    translate_tptp_file(fol2geocoq, InputFilename).

translate_file(InputFilename, Argv) :-   
    member('-geogebra', Argv),!, 
    write('<?xml version="1.0" encoding="utf-8"?>'),nl,
    write('<geogebra format="5.0" xsi:noNamespaceSchemaLocation="http://www.geogebra.org/apps/xsd/ggb.xsd" xmlns="" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >'),nl,
    write('<construction>'),nl,
    translate_tptp_file(fol2geogebra, InputFilename),
    write('</construction>'),nl,
    write('</geogebra>'),nl.

translate_file(InputFilename, Argv) :-   
    member('-gclc', Argv),!, 
    % can be used only for the form premises=>goal
    assert(counterVar(1)),
    translate_tptp_file(fol2gclc, InputFilename).

translate_tptp_file(Conversion_type, InputFile) :- 
    take_leading_comments(InputFile,Conversion_type), 
    open(InputFile, read, Stream),
    read_file(Stream, ListOfTerms),
    close(Stream),!,   
    translate_tptp_list_of_terms(Conversion_type, ListOfTerms).

take_leading_comments(InputFile,Conversion_type) :-
    open(InputFile, read, Stream),
    read_comments(Stream,Conversion_type),
    close(Stream).

read_comments(Stream,_Conversion_type) :-
    at_end_of_stream(Stream), !.
read_comments(Stream,Conversion_type) :-
    read_line_to_string(Stream, Line),
    ((string_chars(Line, ['%'|_]), print_comment(Line,Conversion_type)) ;
     (string_chars(Line, ['i','n','c','l','u','d','e'|_]), write('%'),write(Line),nl)),
    read_comments(Stream,Conversion_type).
read_comments(_,_) :- !.

read_file(Stream,[[X,M]|L]) :-
    read_term(Stream,X,[variable_names(M)]),
    not(X == end_of_file), !,
    read_file(Stream,L).
read_file(_Stream,[]).

%print_comment(Line,fol2geogebra) :- !,
%    Do not print comments, they seem to be unsupported in this format in GeoGebra.
%    write('<!---'),
%    write(Line),
%    write('>'), nl.

print_comment(Line,_Conversion_type) :-
    write(Line),nl.


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
translate_tptp_entry(fol2geogebra, F, M) :-
    translate_tptp_entry_fol2geogebra(F, M).
translate_tptp_entry(fol2geocoq, F, M) :-
    translate_tptp_entry_fol2geocoq(F, M).
translate_tptp_entry(fol2prolog, F, M) :-
    translate_tptp_entry_fol2prolog(F, M).
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


    


%**********************************************
% Specific TPTP/FOF to PROLOG translation
%**********************************************

% Expect an input in the form fof(_, conjunction, ![...] ? []...(Premises=>Goal) 

translate_tptp_entry_fol2prolog(include(_Ax),_M) :- !.

translate_tptp_entry_fol2prolog(fof(Ax, axiom, F), M) :- 
    fof2Implication(F, _Univ, _Exi, Premises, Goal),
    conjunction2list(Premises, LP),    
    not(LP == []),!,nl,
    translate_term_fol2prolog(Goal,M), 
    write(' :- '), nl,
    write('    '),
    print(trying_ax(Goal,Ax),M),write(','),nl,
    translate_term_fol2prolog(LP,M), 
    write(','),nl,write('    !,'),print(by(Goal,Ax),M),
    write('.'),nl.
translate_tptp_entry_fol2prolog(fof(Ax, axiom, F), M) :- 
    fof2Implication(F, _Univ, _Exi, [], Goal),nl,
    translate_term_fol2prolog(Goal,M), 
    write(':-'), nl,
    write('    '),    
    print(trying_ax(Goal,Ax),M),write(','),nl,
    write('    !,'),print(by(Goal,Ax),M),
    write('.').

translate_tptp_entry_fol2prolog(fof(_, conjecture, F), M) :-
    fof2Implication(F, _Univ, _Exi, Premises, Goal),
    conjunction2list(Premises, LP),    
    print(Goal,M), 
    write(' :- '), nl,
    pretty_print_list_nl(LP,M),
    write('.'),nl.
    
by(Ax) :-
    write(' By axiom: '), write(Ax),nl.

% ----------------------------------------

%translate_term_fol2prolog(A, M) :- write('ovo'),print(A,M),nl,nl,fail.

translate_term_fol2prolog([], _M) :- !.
translate_term_fol2prolog([H], M) :- !, 
  write('    '),
  translate_term_fol2prolog(H, M).

translate_term_fol2prolog([H|T], M) :- !,
  write('    '),
  translate_term_fol2prolog(H, M),
  write(','),nl,
  translate_term_fol2prolog(T, M).

% ----------------------------------------

translate_term_fol2prolog(A - B,M)      :- !,
   write('nnneq('),print(A,M),write(','),print(B,M),write(')').
translate_term_fol2prolog(A = B,M)      :- !,
   write('eq('),print(A,M),write(','),print(B,M),write(')').
translate_term_fol2prolog(~(F),M)      :- !,
   write('nnn'),translate_term_fol2prolog(F,M).
translate_term_fol2prolog(~F,M)      :- !,
   write('nnn'),translate_term_fol2prolog(F,M).


translate_term_fol2prolog(dimensions(_A,_B),_M)      :- !.
translate_term_fol2prolog(area(_A,_B,_C,_D),_M)        :- !.
translate_term_fol2prolog(drawsegment(_A,_B),_M)     :- !.
translate_term_fol2prolog(drawdashsegment(_A,_B),_M) :- !.
translate_term_fol2prolog(drawline(_L),_M)          :- !.
translate_term_fol2prolog(drawdashline(_L),_M)      :- !.
translate_term_fol2prolog(drawline(_A,_B),_M)        :- !.
translate_term_fol2prolog(drawdashline(_A,_B),_M)    :- !.
translate_term_fol2prolog(drawcircle(_O,_A),_M)      :- !.
translate_term_fol2prolog(drawcircle(_C),_M)        :- !.
translate_term_fol2prolog(drawdashcircle(_C),_M)    :- !.
translate_term_fol2prolog(drawcircle(_A,_B),_M)      :- !.
translate_term_fol2prolog(drawdashcircle(_A,_B),_M)  :- !.
translate_term_fol2prolog(drawarc(_A,_B,_C),_M)       :- !.
translate_term_fol2prolog(drawdasharc(_A,_B,_C),_M)   :- !.

translate_term_fol2prolog(cmark(_A),_M)        :- !.
translate_term_fol2prolog(cmark_b(_A),_M)      :- !.
translate_term_fol2prolog(cmark_t(_A),_M)      :- !.
translate_term_fol2prolog(cmark_l(_A),_M)      :- !.
translate_term_fol2prolog(cmark_r(_A),_M)      :- !.
translate_term_fol2prolog(cmark_lt(_A),_M)     :- !.
translate_term_fol2prolog(cmark_rt(_A),_M)     :- !.
translate_term_fol2prolog(cmark_lb(_A),_M)     :- !.
translate_term_fol2prolog(cmark_rb(_A),_M)     :- !.

translate_term_fol2prolog(printat(_A,_B),_M)    :- !.
translate_term_fol2prolog(printat_b(_A,_B),_M)  :- !.
translate_term_fol2prolog(printat_t(_A,_B),_M)  :- !.
translate_term_fol2prolog(printat_l(_A,_B),_M)  :- !.
translate_term_fol2prolog(printat_r(_A,_B),_M)  :- !.
translate_term_fol2prolog(printat_lt(_A,_B),_M) :- !.
translate_term_fol2prolog(printat_rt(_A,_B),_M) :- !.
translate_term_fol2prolog(printat_lb(_A,_B),_M) :- !.
translate_term_fol2prolog(printat_rb(_A,_B),_M) :- !.

translate_term_fol2prolog(prooflevel(_A),_M)   :- !.

translate_term_fol2prolog(F,M)      :- 
   print(F,M).

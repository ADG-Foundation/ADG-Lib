%**********************************************
% Specific TPTP/FOF to GeoCoq translation
%**********************************************

% Expect an input in the form fof(_, conjunction, ![...] ? []...(Premises=>Goal) 

translate_tptp_entry_fol2geocoq(include(_Ax),_M) :- !.

% ax_angle5 : forall A B C D, between_strict A B C -> C<>D -> congruent_angles A C D B C D;   

translate_tptp_entry_fol2geocoq(include(_Ax),_M) :- !.
translate_tptp_entry_fol2geocoq(fof(Ax, _, F), M) :- 
    fof2Implication(F, Univ, Exi, Premises, Goal),
    conjunction2list(Premises, LP),    
    not(LP == []),!,nl,
    write(Ax), write(' : '), 
    print_univ(Univ,M),
    print_exi(Exi,M),
    translate_tptp_fol2geocoq(LP,M), 
    write(' -> '), 
    translate_term_fol2geocoq(Goal,M), 
    write(';').
translate_tptp_entry_fol2geocoq(fof(Ax, _, F), M) :- 
    fof2Implication(F, Univ, Exi, [], Goal),nl,
    write(Ax), write(' : '),    
    print_univ(Univ,M),
    print_exi(Exi,M),
    translate_term_fol2geocoq(Goal,M), 
    write(';').

translate_tptp_fol2geocoq([],_M) :- !. 
translate_tptp_fol2geocoq([H],M) :- !,
   translate_term_fol2geocoq(H,M).
translate_tptp_fol2geocoq([H|T],M) :- !,
   translate_term_fol2geocoq(H,M),
   write(' -> '),
   translate_tptp_fol2geocoq(T,M).

print_univ([], _M).
print_univ(L, M) :- 
   write('forall '),
   print_args(L, M),
   write(', ').
print_exi([], _M).
print_exi(L, M) :- 
   write('exist '),
   print_args(L,M),
   write(', ').


% ----------------------------------------
% Layout and printing
% ----------------------------------------
translate_term_fol2geocoq(dimensions(_A,_B),_M)      :- !.
translate_term_fol2geocoq(area(_A,_B,_C,_D),_M)      :- !.
translate_term_fol2geocoq(drawsegment(_A,_B),_M)     :- !.
translate_term_fol2geocoq(drawdashsegment(_A,_B),_M) :- !.
translate_term_fol2geocoq(drawline(_L),_M)           :- !.
translate_term_fol2geocoq(drawdashline(_L),_M)       :- !.
translate_term_fol2geocoq(drawline(_A,_B),_M)        :- !.
translate_term_fol2geocoq(drawdashline(_A,_B),_M)    :- !.
translate_term_fol2geocoq(drawcircle(_O,_A),_M)      :- !.
translate_term_fol2geocoq(drawcircle(_C),_M)         :- !.
translate_term_fol2geocoq(drawdashcircle(_C),_M)     :- !.
translate_term_fol2geocoq(drawcircle(_A,_B),_M)      :- !.
translate_term_fol2geocoq(drawdashcircle(_A,_B),_M)  :- !.
translate_term_fol2geocoq(drawarc(_A,_B,_C),_M)      :- !.
translate_term_fol2geocoq(drawdasharc(_A,_B,_C),_M)  :- !.
translate_term_fol2geocoq(cmark(_A),_M)              :- !.
translate_term_fol2geocoq(cmark_b(_A),_M)            :- !.
translate_term_fol2geocoq(cmark_t(_A),_M)            :- !.
translate_term_fol2geocoq(cmark_l(_A),_M)            :- !.
translate_term_fol2geocoq(cmark_r(_A),_M)            :- !.
translate_term_fol2geocoq(cmark_lt(_A),_M)           :- !.
translate_term_fol2geocoq(cmark_rt(_A),_M)           :- !.
translate_term_fol2geocoq(cmark_lb(_A),_M)           :- !.
translate_term_fol2geocoq(cmark_rb(_A),_M)           :- !.
translate_term_fol2geocoq(printat(_A,_B),_M)         :- !.
translate_term_fol2geocoq(printat_b(_A,_B),_M)       :- !.
translate_term_fol2geocoq(printat_t(_A,_B),_M)       :- !.
translate_term_fol2geocoq(printat_l(_A,_B),_M)       :- !.
translate_term_fol2geocoq(printat_r(_A,_B),_M)       :- !.
translate_term_fol2geocoq(printat_lt(_A,_B),_M)      :- !.
translate_term_fol2geocoq(printat_rt(_A,_B),_M)      :- !.
translate_term_fol2geocoq(printat_lb(_A,_B),_M)      :- !.
translate_term_fol2geocoq(printat_rb(_A,_B),_M)      :- !.
translate_term_fol2geocoq(prooflevel(_A),_M)         :- !.

% ----------------------------------------
% Construction steps
% ----------------------------------------

translate_term_fol2geocoq(A-B, M) :- !, 
   print(A, M),
   write('<>'),
   print(B, M).

translate_term_fol2geocoq(~Af, M) :- !, 
   write('~'),
   translate_term_fol2geocoq(Af, M).

translate_term_fol2geocoq(Af, M) :- !, 
   Af =.. [F | Args],
   write(F), write(' '),print_args(Args,M).

print_args([],_M).
print_args([H],M) :-
   print(H,M).
print_args([H|T],M) :-
   print(H,M),write(' '),
   print_args(T,M).
         

% ----------------------------------------
% Goals
% ----------------------------------------

translate_goal_fol2geocoq(Goal,M) :-    
   nl,write('prove { '), 
   translate_fol2geocoq(Goal,M), 
   write(' }').

% ----------------------------------------



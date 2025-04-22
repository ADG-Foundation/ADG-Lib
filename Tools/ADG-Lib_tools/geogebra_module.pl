%**********************************************
% Specific TPTP/FOF to geogebra translation
%**********************************************

% Expect an input in the form fof(_, conjunction, ![...] ? []...(Premises=>Goal) 

translate_tptp_entry_fol2geogebra(include(_Ax),_M) :- !.
translate_tptp_entry_fol2geogebra(fof(_Ax, axiom, F), M) :- !,
    translate_term_fol2geogebra(F, M).
translate_tptp_entry_fol2geogebra(fof(_, conjecture, F), M) :-
   fof2Implication(F, _Univ, _Exi, Premises, Goal),
   conjunction2list(Premises, LP),
   find_free_points(LP,M,FreePoints),
   emit_free_points(FreePoints,M), 
   reorder(FreePoints,LP,M,LP1), !,
   translate_premises_fol2geogebra(LP1, M), nl,
   translate_goal_fol2geogebra(Goal, M),nl.   

translate_premises_fol2geogebra([],_M) :- !.
translate_premises_fol2geogebra([F|T],M) :- 
   translate_term_fol2geogebra(F,M),
   newlineifnewpredicate(fol2geogebra,[F|T]),   
   translate_premises_fol2geogebra(T,M).
   

% ----------------------------------------
% Construction steps
% ----------------------------------------

translate_term_fol2geogebra(freepoint(P, X, Y),M) :- !, 
   nl, write('<expression label="'), print(P,M), write('" exp="('), write(X), write(','), write(Y),write(')" type="point"/>').
   
translate_term_fol2geogebra(coll(X, A, B),M) :- !, 
   nl, write('online '), print(X,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(newline(L,A,B),M)     :- !, 
   nl, write('line '), print(L,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(newcircle(K,C,X),M)   :- !, 
   nl, write('circle '), print(K), write(' '), print(C,M), write(' '), print(X,M).
translate_term_fol2geogebra(online(P,A,B),M)      :- !, 
   nl, write('online '), print(P,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(oncircle(P,A,B),M)    :- !, 
   nl, write('oncircle '), print(P,M), write(' '), print(A,M), write(' '), print(B,M).

translate_term_fol2geogebra(midpoint(P,A,B),M)    :- !, nl,
   write('<command name="Midpoint">'),nl,
   write('  <input a0="'),print(A,M),write('" a1="'),print(B,M),write('"/>'),nl,
   write('  <output a0="'),print(P,M),write('"/>'),nl,
   write('</command>').

translate_term_fol2geogebra(med(L,A,B),M)         :- !, 
   nl, write('med '), print(L,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(foot(X,P,L),M)        :- !, 
   nl, write('foot '), print(X,M), write(' '), print(P,M), write(' '), print(L,M).
translate_term_fol2geogebra(foot(X,A,B,C),M)      :- !,
   getNewVarName('ltmp', Vname), 
   nl, write('line '),write(Vname), write(' '), print(B,M), write(' '), print(C,M),
   nl, write('foot '), print(X,M), write(' '), print(A,M), write(' '), write(Vname).
translate_term_fol2geogebra(translate(X,A,B,P),M)           :- !, 
   nl, write('translate '), print(X,M), write(' '), print(A,M), write(' '), print(B,M), write(' '), print(P,M).
translate_term_fol2geogebra(perpNS(X,P,L),M)      :- !, 
   nl, write('perp '), print(X,M), write(' '), print(P,M), write(' '), print(L,M).
translate_term_fol2geogebra(perpS(X,P,L),M)      :- !, 
   nl, write('perp '), print(X,M), write(' '), print(P,M), write(' '), print(L,M).
translate_term_fol2geogebra(perpNS(P,A,B,C),M)    :- not(A=B), not(A=C), !, 
   getNewVarName('ltmp', Vnamel), 
   nl, write('line '), write(Vnamel), write(' '), print(B,M), write(' '), print(C,M),
   getNewVarName('Ptmp', VnameP), 
   nl, write('foot '), write(VnameP), write(' '), print(A,M), write(' '), write(Vnamel),
   nl, write('online '),print(P,M),write(' '), write(VnameP), write(' '), print(A,M).
translate_term_fol2geogebra(perpS(P,A,B,C),M)    :- not(A=B), not(A=C), !, 
   getNewVarName('ltmp', Vnamel), 
   nl, write('line '), write(Vnamel), write(' '), print(B,M), write(' '), print(C,M),
   getNewVarName('Ptmp', VnameP), 
   nl, write('foot '), write(VnameP), write(' '), print(A,M), write(' '), write(Vnamel),
   nl, write('online '),print(P,M),write(' '), write(VnameP), write(' '), print(A,M).
translate_term_fol2geogebra(paraNS(L,A,L1),M)   :- !, 
   nl, write('parallel '), print(L,M), write(' '), print(A,M), write(' '), print(L1).
translate_term_fol2geogebra(paraS(L,A,L1),M)   :- !, 
   nl, write('parallel '), print(L,M), write(' '), print(A,M), write(' '), print(L1).
translate_term_fol2geogebra(paraNS(P,A,B,C),M)    :- !, 
   getNewVarName('Ptmp', VnameP), 
   nl, write('translate '), write(VnameP), write(' '), print(B,M), write(' '), print(C,M), write(' '), print(A,M),  
   nl, write('online '),print(P,M), write(' '), write(VnameP), write(' '),print(A,M).
translate_term_fol2geogebra(paraS(P,A,B,C),M)    :- !, 
   getNewVarName('Ptmp', VnameP), 
   nl, write('translate '), write(VnameP), write(' '), print(B,M), write(' '), print(C,M), write(' '), print(A,M),  
   nl, write('online '),print(P,M), write(' '), write(VnameP), write(' '),print(A,M).
translate_term_fol2geogebra(towards(X,A,B,R),M)   :- !, 
   nl, write('towards '), print(X,M), 
   write(' '), print(A,M), write(' '), print(B,M), write(' '), print(R).
translate_term_fol2geogebra(rotate(X,C,Angle,P),M):- !, 
   nl, write('rotate '), print(X,M), write(' '), print(C,M), write(' '), 
   print(Angle), write(' '), print(P,M).
translate_term_fol2geogebra(half_turn(X,C,P),M)   :- !, 
   nl, write('sim '), print(X,M), write(' '), print(C,M), write(' '), print(P,M).
translate_term_fol2geogebra(line_reflection(X,L,P),M) :- !, 
   nl, write('sim '), print(X,M), write(' '), print(L,M), write(' '), print(P,M).
translate_term_fol2geogebra(inversion(X,C,P),M)       :- !, 
   nl, write('sim '), print(X,M), write(' '), print(C,M), write(' '), print(P,M).

translate_term_fol2geogebra(inter(A1,B1,A2,B2,X),M)  :- !, 
   getNewVarName('ltmp', Vname1), 
   getNewVarName('ltmp', Vname2), 
   nl, write('line '), write(Vname1), write(' '), print(A1,M), write(' '), print(B1,M),
   nl, write('line '), write(Vname2), write(' '), print(A2,M), write(' '), print(B2,M),         
   nl, write('intersec '), print(X,M), write(' '), write(Vname1), write(' '), write(Vname2).    
translate_term_fol2geogebra(inter(X,L1,L2),M)  :- !, 
   nl, write('intersec '), print(X,M), write(' '), print(L1,M), write(' '), print(L2,M).

translate_term_fol2geogebra(intersec_ll(X,L1,L2),M)   :- !, 
   nl, write('intersec '), print(X,M), write(' '), print(L1,M), write(' '), print(L2,M).

translate_term_fol2geogebra(intersec_cl(X1,X2,O1,A1,A,B),M) :- !, 
   getNewVarName('ctmp', Vname1), 
   getNewVarName('ltmp', Vname2), 
   nl, write('circle '), write(Vname1), write(' '), print(O1,M), write(' '), print(A1,M),
   nl, write('line '), write(Vname2), write(' '), print(A,M), write(' '), print(B,M),         
   nl, write('intersec2 '), print(X1,M), write(' '), print(X2,M), write(' '), 
   print(Vname1,M), write(' '), print(Vname2,M).

translate_term_fol2geogebra(intersec_cc(X,C1,C2),M)   :- !, 
   nl, write('intersec '), print(X,M), write(' '), print(C1), write(' '), print(C2).
   
translate_term_fol2geogebra(segment_bisector(X,A,B),M):- !, 
   nl, write('med '), print(X,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(angle_bisector(X,A,B,C),M):- !, 
   nl, write('bis '), print(X,M), write(' '), print(A,M), write(' '), 
   print(B,M), write(' '), print(C,M).

translate_term_fol2geogebra((A-B), M)                  :- !, 
   nl, write('% not equal '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(~coll(A,B,C), M)           :- !, 
   nl, write('% not coll '), print(A,M), write(' '), print(B,M), 
   write(' '), print(C,M).

% ----------------------------------------
% Layout and printing
% ----------------------------------------
translate_term_fol2geogebra(dimensions(_A,_B),_M)   :- !. 
translate_term_fol2geogebra(area(_A,_B,_C,_D),_M)   :- !.

translate_term_fol2geogebra(drawsegment(A,B),M)     :- !, nl,
   write('<command name="Segment">'),nl,
   write('   <input a0="'),print(A,M),write('" a1="'),print(B,M),write('"/>'),nl,
   write('   <output a0="'),write('s'),print(A,M),print(B,M),write('"/>'),nl,
   write('</command>'),nl,
   write('<element type="segment" label="'), write('s'),print(A,M),print(B,M),write('">'),nl,
   write('   <show object="true" label="true"/>'),nl,
   write('</element>'),nl.
   
   
translate_term_fol2geogebra(drawdashsegment(A,B),M) :- !, 
   nl, write('drawdashsegment '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(drawline(L),M)          :- !, 
   nl, write('drawline '), print(L,M).
translate_term_fol2geogebra(drawdashline(L),M)      :- !, 
   nl, write('drawdashline '), print(L,M).
translate_term_fol2geogebra(drawline(A,B),M)        :- !, 
   nl, write('drawline '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(drawdashline(A,B),M)    :- !, 
   nl, write('drawdashline '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(drawcircle(O,A),M)        :- !, 
   nl, write('drawcircle '), write(' '), print(O,M), write(' '), print(A,M).
translate_term_fol2geogebra(drawcircle(C),M)        :- !, 
   nl, write('drawcircle '), print(C,M).
translate_term_fol2geogebra(drawdashcircle(C),M)    :- !, 
   nl, write('drawcircle '), print(C,M).
translate_term_fol2geogebra(drawcircle(A,B),M)      :- !, 
   nl, write('drawcircle '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(drawdashcircle(A,B),M)  :- !, 
   nl, write('drawcircle '), print(A,M), write(' '), print(B,M).
translate_term_fol2geogebra(drawarc(A,B,C),M)       :- !, 
   nl, write('drawarc '), print(A,M), write(' '), print(B,M), write(' '), print(C,M).
translate_term_fol2geogebra(drawdasharc(A,B,C),M)   :- !, 
   nl, write('drawdasharc '), print(A,M), write(' '), print(B,M), write(' '), print(C,M).

translate_term_fol2geogebra(cmark(A),M)        :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_b(A),M)      :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_t(A),M)      :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_l(A),M)      :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_r(A),M)      :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_lt(A),M)     :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_rt(A),M)     :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_lb(A),M)     :- !, translate_term_fol2geogebra(label(A),M).
translate_term_fol2geogebra(cmark_rb(A),M)     :- !, translate_term_fol2geogebra(label(A),M).

translate_term_fol2geogebra(label(A),M)     :- !, 
   nl,write('<element type="point" label="'), print(A,M), write('">'),nl,
   write('   <show object="true" label="true"/>'),nl,
   write('</element>').

translate_term_fol2geogebra(printat(A,B),M)    :- !, nl, write('printat '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_b(A,B),M)  :- !, nl, write('printat_b '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_t(A,B),M)  :- !, nl, write('printat_t '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_l(A,B),M)  :- !, nl, write('printat_l '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_r(A,B),M)  :- !, nl, write('printat_r '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_lt(A,B),M) :- !, nl, write('printat_lt '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_rt(A,B),M) :- !, nl, write('printat_rt '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_lb(A,B),M) :- !, nl, write('printat_lb '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2geogebra(printat_rb(A,B),M) :- !, nl, write('printat_rb '), print(A,M), write(' { '), write(B), write(' } ').

translate_term_fol2geogebra(prooflevel(A),M)   :- !, nl, write('prooflevel '), print(A,M), write(' ').

% ----------------------------------------
% Goals
% ----------------------------------------

translate_goal_fol2geogebra(Goal,M) :-    
   write('<command name="Prove">'),nl,
   write('  <input a0="'),translate_fol2geogebra_g(Goal,M), write('"/>'),nl,
   write('<output a0="a"/>'),nl,
   write('</command>'),nl,
   write('<element type="boolean" label="a">'),nl,
   write('  <value val="true"/>'),nl,
   write('  <show object="false" label="true"/>'),nl,
   write('</element>'),nl.
   

translate_fol2geogebra_g(N,_M)  :- number(N), !, 
   write(N).
translate_fol2geogebra_g(A,M)  :- var(A), !, 
   print(A,M).
translate_fol2geogebra_g(A,M)  :- atomic(A), !, 
   print(A,M).
translate_fol2geogebra_g((A=B),M)                :- !, 
   write('equal '), translate_fol2geogebra_g(A,M), write(' '), translate_fol2geogebra_g(B,M).

translate_fol2geogebra_g( parallel(A,B,C,D),M)  :- !, 
   write('AreParallel['),
   write('Segment['), print(A,M), write(', '), print(B,M),write('],'),
   write('Segment['), print(C,M), write(', '), print(D,M),write(']').
   
translate_fol2geogebra_g( perpNS(A,B,C,D),M)    :- !, 
   write('perpendicular '), print(A,M), write(' '), 
   print(B,M), write(' '), print(C,M), write(' '), print(D,M).
translate_fol2geogebra_g( perpNS(A,B,C,D),M)    :- !, 
   write('perpendicular '), print(A,M), write(' '), 
   print(B,M), write(' '), print(C,M), write(' '), print(D,M).
translate_fol2geogebra_g( collinear(A,B,C),M)   :- !, 
   write('collinear '), print(A,M), write(' '), print(B,M), write(' '), print(C,M).
translate_fol2geogebra_g( harmonic(A,B,C,D),M)  :- !, 
   write('harmonic '), print(A,M), write(' '), print(B,M), write(' '), 
   print(C,M), write(' '),print(D,M).
translate_fol2geogebra_g( same_length(A,B,C,D),M) :- !, 
   write('same_length '), print(A,M), write(' '), print(B,M), write(' '), 
   print(C,M),write(' '),print(D,M).
translate_fol2geogebra_g(mult(A,B),M)            :- !, 
   write('{ mult '), translate_fol2geogebra_g(A,M), write(' '), translate_fol2geogebra_g(B,M), write(' }').
translate_fol2geogebra_g(sum(A,B),M)             :- !, 
   write('{ sum '), translate_fol2geogebra_g(A,M), write(' '), translate_fol2geogebra_g(B,M), write(' }').
translate_fol2geogebra_g(length(A,B),M)             :- !, 
   write('{ segment '), translate_fol2geogebra_g(A,M), write(' '), translate_fol2geogebra_g(B,M), write(' }').
translate_fol2geogebra_g(sratio(A,B,C,D),M)      :- !, 
   write('{ sratio '), translate_fol2geogebra_g(A,M), write(' '), translate_fol2geogebra_g(B,M), write(' '), 
   translate_fol2geogebra_g(C,M), write(' '), translate_fol2geogebra_g(D,M), write(' }').
translate_fol2geogebra_g(signed_area3(A,B,C),M)  :- !, 
   write('{ signed_area3 '), translate_fol2geogebra_g(A,M), write(' '), 
   translate_fol2geogebra_g(B,M), write(' '), translate_fol2geogebra_g(C,M), write(' }').
translate_fol2geogebra_g( signed_area4(A,B,C,D),M):- !, 
   write('{ signed_area4 '), translate_fol2geogebra_g(A,M), write(' '), translate_fol2geogebra_g(B,M), write(' '),
   translate_fol2geogebra_g(C,M), write(' '), translate_fol2geogebra_g(D,M), write(' }').
translate_fol2geogebra_g( alg_sum_zero3(A,B,C,D,E,F),M)   :- !, 
   write('alg_sum_zero3 '), 
   write(' { segment '), translate_fol2geogebra_g(A,M), write(' '), translate_fol2geogebra_g(B,M), write(' } '),
   write(' { segment '), translate_fol2geogebra_g(C,M), write(' '), translate_fol2geogebra_g(D,M), write(' } '),
   write(' { segment '), translate_fol2geogebra_g(E,M), write(' '), translate_fol2geogebra_g(F,M), write(' } '). 


% ----------------------------------------



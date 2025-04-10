%**********************************************
% Specific TPTP/FOF to GCLC translation
%**********************************************

% Expect an input in the form fof(_, conjunction, ![...] ? []...(Premises=>Goal) 

translate_tptp_entry_fol2gclc(include(_Ax),_M) :- !.
translate_tptp_entry_fol2gclc(fof(_Ax, axiom, F), M) :- !,
    translate_term_fol2gclc(F, M).
translate_tptp_entry_fol2gclc(fof(_, conjecture, F), M) :-
   fof2Implication(F, Premises, Goal),
   conjunction2list(Premises, LP),
   find_free_points(LP,M,FreePoints),
   emit_free_points(FreePoints,M), 
   reorder(FreePoints,LP,M,LP1), !,
   translate_premises_fol2gclc(LP1, M), nl,
   translate_goal_fol2gclc(Goal, M),nl.   

% ----------------------------------------
% Construction steps
% ----------------------------------------

translate_term_fol2gclc(freepoint(P, X, Y),M) :- !, 
   nl, write('point '), print(P,M), write(' '), print(X,M), write(' '), print(Y).
translate_term_fol2gclc(coll(X, A, B),M) :- !, 
   nl, write('online '), print(X,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(newline(L,A,B),M)     :- !, 
   nl, write('line '), print(L,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(newcircle(K,C,X),M)   :- !, 
   nl, write('circle '), print(K), write(' '), print(C,M), write(' '), print(X,M).
translate_term_fol2gclc(online(P,A,B),M)      :- !, 
   nl, write('online '), print(P,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(oncircle(P,A,B),M)    :- !, 
   nl, write('oncircle '), print(P,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(midp(P,A,B),M)        :- !, 
   nl, write('midpoint '), print(P,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(med(L,A,B),M)         :- !, 
   nl, write('med '), print(L,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(foot(X,P,L),M)        :- !, 
   nl, write('foot '), print(X,M), write(' '), print(P,M), write(' '), print(L,M).
translate_term_fol2gclc(foot(X,A,B,C),M)      :- !,
   getNewVarName('ltmp', Vname), 
   nl, write('line '),write(Vname), write(' '), print(B,M), write(' '), print(C,M),
   nl, write('foot '), print(X,M), write(' '), print(A,M), write(' '), write(Vname).
translate_term_fol2gclc(translate(X,A,B,P),M)           :- !, 
   nl, write('translate '), print(X,M), write(' '), print(A,M), write(' '), print(B,M), write(' '), print(P,M).
translate_term_fol2gclc(perpNS(X,P,L),M)      :- !, 
   nl, write('perp '), print(X,M), write(' '), print(P,M), write(' '), print(L,M).
translate_term_fol2gclc(perpS(X,P,L),M)      :- !, 
   nl, write('perp '), print(X,M), write(' '), print(P,M), write(' '), print(L,M).
translate_term_fol2gclc(perpNS(P,A,B,C),M)    :- not(A=B), not(A=C), !, 
   getNewVarName('ltmp', Vnamel), 
   nl, write('line '), write(Vnamel), write(' '), print(B,M), write(' '), print(C,M),
   getNewVarName('Ptmp', VnameP), 
   nl, write('foot '), write(VnameP), write(' '), print(A,M), write(' '), write(Vnamel),
   nl, write('online '),print(P,M),write(' '), write(VnameP), write(' '), print(A,M).
translate_term_fol2gclc(perpS(P,A,B,C),M)    :- not(A=B), not(A=C), !, 
   getNewVarName('ltmp', Vnamel), 
   nl, write('line '), write(Vnamel), write(' '), print(B,M), write(' '), print(C,M),
   getNewVarName('Ptmp', VnameP), 
   nl, write('foot '), write(VnameP), write(' '), print(A,M), write(' '), write(Vnamel),
   nl, write('online '),print(P,M),write(' '), write(VnameP), write(' '), print(A,M).
translate_term_fol2gclc(paraNS(L,A,L1),M)   :- !, 
   nl, write('parallel '), print(L,M), write(' '), print(A,M), write(' '), print(L1).
translate_term_fol2gclc(paraS(L,A,L1),M)   :- !, 
   nl, write('parallel '), print(L,M), write(' '), print(A,M), write(' '), print(L1).
translate_term_fol2gclc(paraNS(P,A,B,C),M)    :- !, 
   getNewVarName('Ptmp', VnameP), 
   nl, write('translate '), write(VnameP), write(' '), print(B,M), write(' '), print(C,M), write(' '), print(A,M),  
   nl, write('online '),print(P,M), write(' '), write(VnameP), write(' '),print(A,M).
translate_term_fol2gclc(paraS(P,A,B,C),M)    :- !, 
   getNewVarName('Ptmp', VnameP), 
   nl, write('translate '), write(VnameP), write(' '), print(B,M), write(' '), print(C,M), write(' '), print(A,M),  
   nl, write('online '),print(P,M), write(' '), write(VnameP), write(' '),print(A,M).
translate_term_fol2gclc(towards(X,A,B,R),M)   :- !, 
   nl, write('towards '), print(X,M), 
   write(' '), print(A,M), write(' '), print(B,M), write(' '), print(R).
translate_term_fol2gclc(rotate(X,C,Angle,P),M):- !, 
   nl, write('rotate '), print(X,M), write(' '), print(C,M), write(' '), 
   print(Angle), write(' '), print(P,M).
translate_term_fol2gclc(half_turn(X,C,P),M)   :- !, 
   nl, write('sim '), print(X,M), write(' '), print(C,M), write(' '), print(P,M).
translate_term_fol2gclc(line_reflection(X,L,P),M) :- !, 
   nl, write('sim '), print(X,M), write(' '), print(L,M), write(' '), print(P,M).
translate_term_fol2gclc(inversion(X,C,P),M)       :- !, 
   nl, write('sim '), print(X,M), write(' '), print(C,M), write(' '), print(P,M).

translate_term_fol2gclc(inter(A1,B1,A2,B2,X),M)  :- !, 
   getNewVarName('ltmp', Vname1), 
   getNewVarName('ltmp', Vname2), 
   nl, write('line '), write(Vname1), write(' '), print(A1,M), write(' '), print(B1,M),
   nl, write('line '), write(Vname2), write(' '), print(A2,M), write(' '), print(B2,M),         
   nl, write('intersec '), print(X,M), write(' '), write(Vname1), write(' '), write(Vname2).    
translate_term_fol2gclc(inter(X,L1,L2),M)  :- !, 
   nl, write('intersec '), print(X,M), write(' '), print(L1,M), write(' '), print(L2,M).

translate_term_fol2gclc(intersec_ll(X,L1,L2),M)   :- !, 
   nl, write('intersec '), print(X,M), write(' '), print(L1,M), write(' '), print(L2,M).

translate_term_fol2gclc(intersec_cl(X1,X2,O1,A1,A,B),M) :- !, 
   getNewVarName('ctmp', Vname1), 
   getNewVarName('ltmp', Vname2), 
   nl, write('circle '), write(Vname1), write(' '), print(O1,M), write(' '), print(A1,M),
   nl, write('line '), write(Vname2), write(' '), print(A,M), write(' '), print(B,M),         
   nl, write('intersec2 '), print(X1,M), write(' '), print(X2,M), write(' '), 
   print(Vname1,M), write(' '), print(Vname2,M).

translate_term_fol2gclc(intersec_cc(X,C1,C2),M)   :- !, 
   nl, write('intersec '), print(X,M), write(' '), print(C1), write(' '), print(C2).
   
translate_term_fol2gclc(segment_bisector(X,A,B),M):- !, 
   nl, write('med '), print(X,M), write(' '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(angle_bisector(X,A,B,C),M):- !, 
   nl, write('bis '), print(X,M), write(' '), print(A,M), write(' '), 
   print(B,M), write(' '), print(C,M).

translate_term_fol2gclc((A-B), M)                  :- !, 
   nl, write('% not equal '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(~coll(A,B,C), M)           :- !, 
   nl, write('% not coll '), print(A,M), write(' '), print(B,M), 
   write(' '), print(C,M).

% ----------------------------------------
% Layout and printing
% ----------------------------------------
translate_term_fol2gclc(dimensions(A,B),M)      :- !, 
   nl, write('dim '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(area(A,B,C,D),M)        :- !, 
   nl, write('area '), print(A,M), write(' '), print(B,M), write(' '), 
   print(C,M), write(' '), print(D,M).

translate_term_fol2gclc(drawsegment(A,B),M)     :- !, 
   nl, write('drawsegment '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(drawdashsegment(A,B),M) :- !, 
   nl, write('drawdashsegment '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(drawline(L),M)          :- !, 
   nl, write('drawline '), print(L,M).
translate_term_fol2gclc(drawdashline(L),M)      :- !, 
   nl, write('drawdashline '), print(L,M).
translate_term_fol2gclc(drawline(A,B),M)        :- !, 
   nl, write('drawline '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(drawdashline(A,B),M)    :- !, 
   nl, write('drawdashline '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(drawcircle(O,A),M)        :- !, 
   nl, write('drawcircle '), write(' '), print(O,M), write(' '), print(A,M).
translate_term_fol2gclc(drawcircle(C),M)        :- !, 
   nl, write('drawcircle '), print(C,M).
translate_term_fol2gclc(drawdashcircle(C),M)    :- !, 
   nl, write('drawcircle '), print(C,M).
translate_term_fol2gclc(drawcircle(A,B),M)      :- !, 
   nl, write('drawcircle '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(drawdashcircle(A,B),M)  :- !, 
   nl, write('drawcircle '), print(A,M), write(' '), print(B,M).
translate_term_fol2gclc(drawarc(A,B,C),M)       :- !, 
   nl, write('drawarc '), print(A,M), write(' '), print(B,M), write(' '), print(C,M).
translate_term_fol2gclc(drawdasharc(A,B,C),M)   :- !, 
   nl, write('drawdasharc '), print(A,M), write(' '), print(B,M), write(' '), print(C,M).

translate_term_fol2gclc(cmark(A),M)        :- !, nl, write('cmark '), print(A,M).
translate_term_fol2gclc(cmark_b(A),M)      :- !, nl, write('cmark_b '), print(A,M).
translate_term_fol2gclc(cmark_t(A),M)      :- !, nl, write('cmark_t '), print(A,M).
translate_term_fol2gclc(cmark_l(A),M)      :- !, nl, write('cmark_l '), print(A,M).
translate_term_fol2gclc(cmark_r(A),M)      :- !, nl, write('cmark_r '), print(A,M).
translate_term_fol2gclc(cmark_lt(A),M)     :- !, nl, write('cmark_lt '), print(A,M).
translate_term_fol2gclc(cmark_rt(A),M)     :- !, nl, write('cmark_rt '), print(A,M).
translate_term_fol2gclc(cmark_lb(A),M)     :- !, nl, write('cmark_lb '), print(A,M).
translate_term_fol2gclc(cmark_rb(A),M)     :- !, nl, write('cmark_rb '), print(A,M).

translate_term_fol2gclc(printat(A,B),M)    :- !, nl, write('printat '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_b(A,B),M)  :- !, nl, write('printat_b '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_t(A,B),M)  :- !, nl, write('printat_t '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_l(A,B),M)  :- !, nl, write('printat_l '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_r(A,B),M)  :- !, nl, write('printat_r '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_lt(A,B),M) :- !, nl, write('printat_lt '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_rt(A,B),M) :- !, nl, write('printat_rt '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_lb(A,B),M) :- !, nl, write('printat_lb '), print(A,M), write(' { '), write(B), write(' } ').
translate_term_fol2gclc(printat_rb(A,B),M) :- !, nl, write('printat_rb '), print(A,M), write(' { '), write(B), write(' } ').

translate_term_fol2gclc(prooflevel(A),M)   :- !, nl, write('prooflevel '), print(A,M), write(' ').

% ----------------------------------------
% Goals
% ----------------------------------------

translate_goal_fol2gclc(Goal,M) :-    
   nl,write('prove { '), 
   translate_fol2gclc_g(Goal,M), 
   write(' }'),nl.

translate_fol2gclc_g(N,_M)  :- number(N), !, 
   write(N).
translate_fol2gclc_g(A,M)  :- var(A), !, 
   print(A,M).
translate_fol2gclc_g(A,M)  :- atomic(A), !, 
   print(A,M).
translate_fol2gclc_g((A=B),M)                :- !, 
   write('equal '), translate_fol2gclc_g(A,M), write(' '), translate_fol2gclc_g(B,M).
translate_fol2gclc_g( paraNS(A,B,C,D),M)  :- !, 
   write('parallel '), print(A,M), write(' '), 
   print(B,M), write(' '), print(C,M), write(' '), print(D,M).
translate_fol2gclc_g( perpNS(A,B,C,D),M)    :- !, 
   write('perpendicular '), print(A,M), write(' '), 
   print(B,M), write(' '), print(C,M), write(' '), print(D,M).
translate_fol2gclc_g( perpNS(A,B,C,D),M)    :- !, 
   write('perpendicular '), print(A,M), write(' '), 
   print(B,M), write(' '), print(C,M), write(' '), print(D,M).
translate_fol2gclc_g( collinear(A,B,C),M)   :- !, 
   write('collinear '), print(A,M), write(' '), print(B,M), write(' '), print(C,M).
translate_fol2gclc_g( harmonic(A,B,C,D),M)  :- !, 
   write('harmonic '), print(A,M), write(' '), print(B,M), write(' '), 
   print(C,M), write(' '),print(D,M).
translate_fol2gclc_g( same_length(A,B,C,D),M) :- !, 
   write('same_length '), print(A,M), write(' '), print(B,M), write(' '), 
   print(C,M),write(' '),print(D,M).
translate_fol2gclc_g(mult(A,B),M)            :- !, 
   write('{ mult '), translate_fol2gclc_g(A,M), write(' '), translate_fol2gclc_g(B,M), write(' }').
translate_fol2gclc_g(sum(A,B),M)             :- !, 
   write('{ sum '), translate_fol2gclc_g(A,M), write(' '), translate_fol2gclc_g(B,M), write(' }').
translate_fol2gclc_g(length(A,B),M)             :- !, 
   write('{ segment '), translate_fol2gclc_g(A,M), write(' '), translate_fol2gclc_g(B,M), write(' }').
translate_fol2gclc_g(sratio(A,B,C,D),M)      :- !, 
   write('{ sratio '), translate_fol2gclc_g(A,M), write(' '), translate_fol2gclc_g(B,M), write(' '), 
   translate_fol2gclc_g(C,M), write(' '), translate_fol2gclc_g(D,M), write(' }').
translate_fol2gclc_g(signed_area3(A,B,C),M)  :- !, 
   write('{ signed_area3 '), translate_fol2gclc_g(A,M), write(' '), 
   translate_fol2gclc_g(B,M), write(' '), translate_fol2gclc_g(C,M), write(' }').
translate_fol2gclc_g( signed_area4(A,B,C,D),M):- !, 
   write('{ signed_area4 '), translate_fol2gclc_g(A,M), write(' '), translate_fol2gclc_g(B,M), write(' '),
   translate_fol2gclc_g(C,M), write(' '), translate_fol2gclc_g(D,M), write(' }').
translate_fol2gclc_g( alg_sum_zero3(A,B,C,D,E,F),M)   :- !, 
   write('alg_sum_zero3 '), 
   write(' { segment '), translate_fol2gclc_g(A,M), write(' '), translate_fol2gclc_g(B,M), write(' } '),
   write(' { segment '), translate_fol2gclc_g(C,M), write(' '), translate_fol2gclc_g(D,M), write(' } '),
   write(' { segment '), translate_fol2gclc_g(E,M), write(' '), translate_fol2gclc_g(F,M), write(' } '). 


% ----------------------------------------



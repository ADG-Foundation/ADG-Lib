%**********************************************
% Support for TPTP/FOF to provers (like GCLC)
%**********************************************

fof2Implication(! U : (A => B), U, [], A, B)     :- !.
fof2Implication(! U : ? E : (A => B), U, E, A,B) :- !.
fof2Implication(! U : (A => ? E : B), U, E, A,B) :- !.
fof2Implication(! U : ? E : (B), U, E, [], B)    :- !.
fof2Implication(! U : (B), U, [], [],B)          :- !.
fof2Implication(? E : (B), [], E, [],B)          :- !.
fof2Implication((B),[], [], [],B)                :- !.

conjunction2list([], []) :- !.
conjunction2list(A & B, L) :- !,   
   conjunction2list(A, L1),
   conjunction2list(B, L2),
   append(L1,L2,L).
conjunction2list(A, [A]).

find_free_points(ListPremises,M,FreePoints) :-
  collect_all_points(ListPremises,M,AllPoints,ConstructedPoints),
  list_diff(AllPoints,ConstructedPoints,FreePoints).

collect_all_points([], _M, [], []).
collect_all_points([H|T], M, AllPoints, Constructed) :-
   geo_predicate(H, M, AllPoints1, _, Constructed1),
   collect_all_points(T, M, AllPoints2, Constructed2),
   append(AllPoints1, AllPoints2, AllPoints),
   append(Constructed1, Constructed2, Constructed).

geo_predicate(newline(X,A,B), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(newcircle(X,A,B), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(collinear(X,A,B), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(on_line(X,A,B), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(on_circle(X,A,B), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(on_segment_bisector(X,A,B), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(on_angle_bisector(X,A,B,C), _M, [A,B,X], [A,B,C], [X]) :- !.
geo_predicate(perpendicular(A,B,C,D), _M, [A,B,C,D], [B,C,D], [A]) :- !.
geo_predicate(perpendicular(L,A,La), _M, [L,A,La], [A,La], [L]) :- !.
geo_predicate(perpendicular_non_strict(A,B,C,D), _M, [A,B,C,D], [B,C,D], [A]) :- !.
geo_predicate(parallel(A,B,C,D), _M, [A,B,C,D], [B,C,D], [A]) :- !.
geo_predicate(parallel_non_strict(A,B,C,D), _M, [A,B,C,D], [B,C,D], [A]) :- !.
geo_predicate(intersection(X,A,B,C,D), _M, [A,B,C,D,X], [A,B,C,D], [X]) :- !.
geo_predicate(intersection_cl(X1,X2,O,A1,A,B), _M, [X1,X2,O,A1,A,B], [O,A1,A,B], [X1,X2]) :- !.
geo_predicate(intersection_cl(X1,X2,C,L), _M, [X1,X2,C,L], [C,L], [X1,X2]) :- !.
geo_predicate(intersection_ll(X,L1,L2), _M, [X,L1,L2], [L1,L2], [X]) :- !.
geo_predicate(foot(X,A,B,C), _M, [A,B,C,X], [A,B,C], [X]) :- !.
geo_predicate(translate(X,A,B,C), _M, [A,B,C,X], [A,B,C], [X]) :- !.
geo_predicate(towards(X,A,B,_), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(midpoint(X,A,B), _M, [A,B,X], [A,B], [X]) :- !.
geo_predicate(reflection(X,A,B), _M, [A,B,X], [A,B],[X]) :- !.
geo_predicate(orthocenter(X,A,B,C), _M, [A,B,C,X], [A,B,C],[X]) :- !.
geo_predicate(circle(X,A,B,C), _M, [A,B,C,X], [A,B,C],[X]) :- !.
geo_predicate(~colllinear(A,B,C), _M, [A,B,C], [A,B,C],[]) :- !.
geo_predicate(A-B, _M, [A,B], [A,B],[]) :- !.
geo_predicate(freepoint(A,_,_), _M, [A], [],[A]) :- !.
geo_predicate(_, _M, [], [],[]) :- !.


emit_free_points(F, M) :-
  delete_duplicates(F, FF),
  emit_free_points_(FF, M, _),nl.

emit_free_points_([], _M, []).
emit_free_points_([H|T], M, E) :-
   nl, write('point '), print(H,M), write(' '),
   random(0, 100, X), write(X), write(' '),
   random(0, 100, Y), write(Y), write(' '),   
   emit_free_points_(T, M, E).

reorder(_Known, [],_M,[]).
reorder(Known, [Step|T], M, [Step|TT]) :-
   geo_predicate(Step, M, _All, Starting, Constructed),
   var_sublist(Starting, Known),
   append(Known, Constructed, NewKnown),
   reorder(NewKnown, T, M, TT).
reorder(Known, [Step|T], M, TTT) :-
   reorder(Known, T, M, TT),
   append(TT,[Step],TTT).

var_sublist([], _).
var_sublist([H|T], Known) :-
  var_member(H, Known),
  var_sublist(T, Known). 

var_member(A,[B|_]) :- not(not(A==B)),!.
var_member(A,[_|T]) :- var_member(A,T).


% ----------------------------------------


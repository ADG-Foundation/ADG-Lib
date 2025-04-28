%**************************************************
% TPTP/FOF-PointsOnly to TPTP/FOF-Lines translation
%**************************************************

translate_tptp_entry_folPoints2Lines(include(Ax),_M) :- !,
    nl,write("include('"),write(Ax),write("')."),nl.

translate_tptp_entry_folPoints2Lines(fof(Ax,axiom,foot(X,A,B,C)), M) :-
   find_line(L,B,C),
   translate_tptp_entry_folPoints2Lines(fof(Ax, axiom, foot(X,A,L)),M),nl.

translate_tptp_entry_folPoints2Lines(fof(Ax,axiom,perpendicular(X,A,B,C)), M) :-
   find_line(L,B,C),
   translate_tptp_entry_folPoints2Lines(fof(Ax, axiom, perpendicular_p(X,A,L)),M), nl.


translate_tptp_entry_folPoints2Lines(fof(Ax,axiom,intersection(X,A1,B1,A2,B2))	, M) :-
   find_line(L1,A1,B1),
   find_line(L2,A2,B2),!,
   write('fof('),write(Ax),write(', axiom, '),
   translate_term_Points2Lines('intersection_ll(', M),
   print(X,M), write(', '), print(L1,M), write(', '),    
   print(L2,M), write(')).'),nl. 

translate_tptp_entry_folPoints2Lines(fof(Ax,axiom,intersection_cl(X,Y,O,C,A,B)), M) :-
   find_circle(K,O,C),
   find_line(L,A,B),!,
   write('fof('),write(Ax),write(', axiom, '),
   translate_term_Points2Lines('intersection_cl(', M),
   print(X,M), write(', '), print(Y,M), write(', '), print(K,M), write(', '),    
   print(L,M), write(')).'),nl. 

translate_tptp_entry_folPoints2Lines(fof(Ax,axiom, F),  M) :- !,
    write('fof('),write(Ax),write(', axiom, '),
    translate_term_Points2Lines(F, M),
    write(').'),nl. 

translate_tptp_entry_folPoints2Lines(fof(Ax,conjecture, F),  M) :- !,
    write('fof('),write(Ax),write(', conjecture, '),
    translate_goal_folPoints2Lines(F, M),
    write(').'),nl. 

% ----------------------------------------
% Relevant construction steps
% ----------------------------------------

translate_term_Points2Lines(newcircle(C,O,A),M) :- !, 
   asserta(newcircle(C,O,A)),
%   write('$true'). % empty axiom in the export, the circle is stored
   print(newcircle(C,O,A),M). % empty axiom in the export, the circle is stored

translate_term_Points2Lines(newline(L,A,B),M) :- !, 
   asserta(newline(L,A,B)),
%   write('$true'). % empty axiom in the export, the line is stored
   print(newline(L,A,B),M). % empty axiom in the export, the circle is stored


translate_term_Points2Lines(drawcircle(O, A), M) :- !, 
   write('drawcircle('),
   print(O,M), write(', '),
   print(A,M), write(')').

translate_term_Points2Lines(drawcircle(K), M) :- !, 
   newcircle(K,O,A), %  take the first such
   write('drawcircle('),
   print(O,M), write(', '),
   print(A,M), write(')').

translate_term_Points2Lines(newcircle(L,A,B), _M) :-  
   asserta(newcircle(L,A,B)), fail. % will be handled later also in the standard way

translate_term_Points2Lines(newline(L,A,B), _M) :-  
   asserta(newline(L,A,B)), fail. % will be handled later also in the standard way

translate_term_Points2Lines(midpoint(P,A,B), _M) :-  
   asserta(midpoint(P,A,B)), fail. % will be handled later also in the standard way
translate_term_Points2Lines(on_segment_bisector(P,A,B), _M) :-  
   asserta(on_segment_bisector(P,A,B)), fail. % will be handled later also in the standard way
translate_term_Points2Lines(perpendicular(P,A,B,C), _M) :-  
   asserta(perpendicular(P,A,B,C)), fail. % will be handled later also in the standard way

translate_term_Points2Lines(perpendicular_p(P,A,L), _M) :-  
   asserta(perpendicular_p(P,A,L)), fail. % will be handled later also in the standard way
translate_term_Points2Lines(on_angle_bisector(P,A,B,C), _M) :-  
   asserta(on_angle_bisector(P,A,B,C)), fail. % will be handled later also in the standard way


translate_term_Points2Lines(F, M) :- !, 
   pretty_print(F,M).

find_circle(L,O,A) :-
   newcircle(L,O,A),!.
find_circle(Koa,O,A) :-
   getNewVarName('objK', Koa),
   asserta(newcircle(Koa,O,A)),
   write('fof('),write('newl'),print(Koa,M),write(', axiom, '),
   print(newcircle(Koa,O,A),M),
   write(').'),nl. 


find_line(L,A,B) :-
   newline_(L,A,B),!.
find_line(L,A,B) :-
   midpoint_(A,X,Y),
   on_segment_bisector_(B,X,Y),
   segment_bisector(L,X,Y),!.
find_line(L,A,B) :-
   midpoint_(A,X,Y),
   on_segment_bisector_(B,X,Y),!,
   getNewVarName('objL', L),
   asserta(segment_bisector(L,X,Y)),
   write('fof('),write('segbis'),print(L,M),write(', axiom, '),
   print(segment_bisector(L,X,Y),M),
   write(').'),nl. 

find_line(L,A,B) :-
   perpendicular_(B,A,X,Y),
   newline_(Lxy,X,Y),
   perpendicular(L,A,Lxy),!.
   
find_line(L,P,A) :-
   perpendicular_p_(P,A,Lxy),!,
   getNewVarName('objL', L),
   asserta(perpendicular(L,A,Lxy)),
   write('fof(perp'),print(L,M),write(', axiom, '),
   print(perpendicular(L,A,Lxy),M),
   write(').'),
   nl. 

find_line(L,P,A) :-
   perpendicular_p(P,A,Lxy),!,
   getNewVarName('objL', L),
   asserta(perpendicular(L,A,Lxy)),
   write('fof(perp'),print(L,M),write(', axiom, '),
   print(perpendicular(L,A,Lxy),M),
   write(').'),
   nl. 

   
find_line(L,P,B) :-
   on_angle_bisector(P,A,B,C),!,
   getNewVarName('objL', L),
   asserta(angle_bisector(L,A,B,C)),
   write('fof('),write('newab'),print(L,M),write(', axiom, '),
   print(angle_bisector(L,A,B,C),M),
   write(').'),nl.
find_line(Lab,A,B) :-
   getNewVarName('objL', Lab),
   asserta(newline(Lab,A,B)),
   write('fof('),write('newl'),print(Lab,M),write(', axiom, '),
   print(newline(Lab,A,B),M),
   write(').'),nl. 


newline_(L,A,B) :-
  (newline(L,A,B) ; newline(L,B,A)).
midpoint_(A,X,Y) :-
  (midpoint(A,X,Y) ; midpoint(A,Y,X)).
on_segment_bisector_(B,X,Y) :-
  (on_segment_bisector(B,X,Y) ; on_segment_bisector(B,X,Y)).
perpendicular_(A,B,X,Y) :-
  (perpendicular(A,B,X,Y) ; perpendicular(B,A,X,Y)).

perpendicular_p_(A,B,L) :-
  (perpendicular_p(A,B,L) ; perpendicular_p(B,A,L)).



% ----------------------------------------
% properties
% ----------------------------------------

translate_goal_folPoints2Lines(Goal,M) :-    
   translate_folPoints2Lines_g(Goal,M).   

translate_folPoints2Lines_g(F, M)  :- !, 
   print(F,M).




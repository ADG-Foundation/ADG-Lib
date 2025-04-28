%**********************************************
% TPTP/FOF-Lines to TPTP/FOF-Points translation
%**********************************************

translate_tptp_entry_folLines2Points(include(Ax),_M) :- !,
    nl,write("include('"),write(Ax),write("')."),nl.

% This is treated as a special case, since it requires auxilary commands
translate_tptp_entry_folLines2Points(fof(Ax,axiom,segment_bisector(Lp,A,B)), M) :- !, 
   write('fof('),write(Ax),write(', axiom, '),
   getNewVarName('objP1', Vname1),
   write('midpoint('), write(Vname1), write(', '), print(A,M), write(', '),print(B,M), write(')).'),nl,
   write('fof('),write(Ax),write(', axiom, '),
   getNewVarName('objP2', Vname2),
   write('on_segment_bisector('), write(Vname2), write(', '), print(A,M), write(', '),print(B,M), write(')).'), nl,   
   asserta(newline(Lp,Vname1,Vname2)).

translate_tptp_entry_folLines2Points(fof(Ax,axiom, F),  M) :- !,
    write('fof('),write(Ax),write(', axiom, '),
    translate_term_lines2points(F, M),
    write(').'),nl. 

translate_tptp_entry_folLines2Points(fof(Ax,conjecture, F),  M) :- !,
    write('fof('),write(Ax),write(', conjecture, '),
    translate_goal_folLines2Points(F, M),
    write(').'),nl. 

% ----------------------------------------
% Relevant construction steps
% ----------------------------------------

translate_term_lines2points(newcircle(C,O,A),M) :- !, 
   asserta(newcircle(C,O,A)),
%   write('$true'). % empty axiom in the export, the circle is stored
   print(newcircle(C,O,A),M). % empty axiom in the export, the circle is stored

translate_term_lines2points(newline(L,A,B),M) :- !, 
   asserta(newline(L,A,B)),
%   write('$true'). % empty axiom in the export, the line is stored
   print(newline(L,A,B),M). % empty axiom in the export, the circle is stored

translate_term_lines2points(drawline(L), M) :- !, 
   newline(L,A,B), %  take the first such
   write('drawline('),
   print(A,M), write(', '),
   print(B,M), write(')').

translate_term_lines2points(drawcircle(O, A), M) :- !, 
   write('drawcircle('),
   print(O,M), write(', '),
   print(A,M), write(')').

translate_term_lines2points(drawcircle(K), M) :- !, 
   newcircle(K,O,A), %  take the first such
   write('drawcircle('),
   print(O,M), write(', '),
   print(A,M), write(')').

translate_term_lines2points(drawdashcircle(K), M) :- !, 
   newcircle(K,O,A), %  take the first such
   write('drawdashcircle('),
   print(O,M), write(', '),
   print(A,M), write(')').


translate_term_lines2points(drawdashline(L), M) :- !, 
   newline(L,A,B), %  take the first such
   write('drawdashline('),
   print(A,M), write(', '),
   print(B,M), write(')').

translate_term_lines2points(parallel(Lp,P,L), M) :- !, 
   getNewVarName('objP', Vname),
   write('parallel('), write(Vname), write(', '), print(P,M), write(', '), 
   newline(L,A,B), %  take the first such
   print(A,M), write(', '),
   print(B,M), write(')'),
   asserta(newline(Lp,Vname,P)).

translate_term_lines2points(perpendicular(Lp,P,L), M) :- !, 
   getNewVarName('objP', Vname),
   write('perpendicular('), write(Vname), write(', '), print(P,M), write(', '), 
   newline(L,A,B), %  take the first such
   print(A,M), write(', '),
   print(B,M), write(')'),
   asserta(newline(Lp,Vname,P)).

translate_term_lines2points(angle_bisector(Lp,A,B,C), M) :- !, 
   getNewVarName('objP', Vname),
   write('on_angle_bisector('), write(Vname), write(', '), 
   print(A,M), write(', '),
   print(B,M), write(', '),
   print(C,M), write(')'),
   asserta(newline(Lp,Vname,B)).

translate_term_lines2points(foot(X,P,L), M) :- !, 
   write('foot('), print(X,M), write(', '), print(P,M), write(', '), 
%  take the first such
   newline(L,A,B),
   print(A,M), write(', '),
   print(B,M), write(')').

translate_term_lines2points(intersection_ll(X,L1,L2), M) :- !, 
   write('intersection('), 
   print(X,M),write(', '),
   newline(L1,A1,B1),
   newline(L2,A2,B2),
   print(A1,M), write(', '), print(B1,M), write(', '),    
   print(A2,M), write(', '), print(B2,M), write(')').


translate_term_lines2points(intersection_cl(X1,X2,C,L), M) :- !, 
   write('intersection_cl('), 
   print(X1,M), write(', '),
   print(X2,M), write(', '),
   newcircle(C,O1,A1),
   print(O1,M), write(', '), print(A1,M), write(', '),    
   newline(L,A,B),
   print(A,M), write(', '), print(B,M), write(')').

   
translate_term_lines2points(midpoint(X,P,L), M) :- !, 
   print(midpoint(X,P,L), M). 

translate_term_lines2points(F, M) :- !, 
   pretty_print(F,M).

% ----------------------------------------
% properties
% ----------------------------------------

translate_goal_folLines2Points(Goal,M) :-    
   translate_folLines2Points_g(Goal,M).   


translate_folLines2Points_g(F, M)  :- !, 
   print(F,M).



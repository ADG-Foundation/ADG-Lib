%include('../axioms/axiomsGelernter.p').
include('../axioms/geo.ax').

% --------------------------------------------------------------------------------

fof(thm_gelertner_5a, conjecture, ![A,B,C,D,E,F,M,K]: (
  ( 
  quadrilateral(A,B,C,D) &  
   
  parallel(A,D,B,C) &
   midpoint(E,A,C) &
    midpoint(F,B,D) &
     between_strict(M,E,F) &
      between_strict(A,M,B) &
       between_strict(C,F,K) &
        collinear(A,K,D) 
)
  => 
cong(M,B,M,A)

% between_strict(A,M,B)
% parallel(F,M,D,A)
% parallel(F,M,B,C)
% collinear(M,E,F)
% between_strict(M,E,F)
% parallel(E,F,B,C)
% parallel(E,F,K,D)
% parallel(E,F,A,K)
% between_strict(C,E,A)
% cong(C,E,E,A)
% cong(K,F,C,F)
% congruent_triangles(F,D,K,F,B,C)
% congruent(D,F,F,B)
% congruent_angles(K,F,D,C,F,B)
% congruent_angles(K,D,B,C,B,D)
% opposite_sides(K,C,D,B)
% parallel(K,D,B,C)

  )).
	
% --------------------------------------------------------------------------------

  

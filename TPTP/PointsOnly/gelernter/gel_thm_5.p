include('gelernter.ax').

% --------------------------------------------------------------------------------

fof(ax_inter, axiom, ![A,B,C,D]:  ((~parallel(A,B,C,D)) => ?[E]: (collinear(A,B,E) & collinear(C,D,E)))).

fof(thm_B, conjecture, ![A,B,C,D,E,F,M]: (
  ( 
  ~collinear(F,B,C) &
  
  A!=D & 
  parallel(A,D,B,C) &
   is_midpoint(E,A,C) &
    is_midpoint(F,B,D) &
     between_strict(M,E,F) &
      between_strict(A,M,B) 
%       & between_strict(C,F,K) 
%       & collinear(A,K,D) 
      )
  => 
  cong(M,B,M,A)

% between_strict(A,M,B)
% parallel_strict(F,M,D,A)
% parallel_strict(F,M,B,C)
% collinear(M,E,F)
% between_strict(M,E,F)
% parallel_strict(E,F,B,C)
% parallel_strict(E,F,K,D)
% parallel_strict(E,F,A,K)
% between_strict(C,E,A)
% cong(C,E,E,A)
% cong(K,F,C,F)
% congruent_triangles(F,D,K,F,B,C)
% congruent(D,F,F,B)
% congruent_angles(K,F,D,C,F,B)
% congruent_angles(K,D,B,C,B,D)
% opposite_sides(K,C,D,B)
% parallel_strict(K,D,B,C)

  )).
	
% --------------------------------------------------------------------------------

  

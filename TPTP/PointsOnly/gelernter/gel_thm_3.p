include('../Axioms/gelernter.ax').

% Example taken from Gelertner seminal paper:  
% REALIZATION OF A GEOMETRY THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------
 
fof(thm_C, conjecture, ![A,B,C,D,M,E]: (
  ( 
  ~collinear(C,E,M) &
  ~collinear(B,D,M) &
  between_strict(B,M,C) & 
  cong(B,M,M,C) &
  between_strict(A,D,M) & 
  between_strict(D,M,E) &
  perpendicular(B,D,A,M) &
  perpendicular(C,E,M,E))
  => 
  cong(B,D,E,C)

% congruent_triangles(B,D,M,C,E,M)
% congruent_angles(D,M,B,E,M,C) 	
% congruent_angles(M,B,D,M,C,E) 	
% congruent_angles(D,B,M,B,C,E) 	
% collinear(C,M,B) 
% same_side(M,B,E,C) 
% same_side(C,M,B,D) 
% congruent_angles(E,C,M,D,B,C) 	
% congruent_angles(E,C,M,B,C,E) 	
% congruent_angles(B,C,E,D,B,C) 	
% opposite_sides(E,D,C,B)
% parallel_strict(E,C,B,D)
% opposite_sides(C,B,E,D)
% congruent_angles(C,E,D,E,D,B) 
% congruent_angles(B,D,E,M,E,C) 
% congruent_angles(C,E,M,A,E,C) 
% between_strict(E,M,A)
% congruent_angles(B,D,E,A,E,C) 
% collinear(E,D,A)
% same_side(D,A,C,E) 
% same_side(M,E,D,B) 
% congruent_angles(C,E,D,B,D,M) 
% congruent_angles(B,D,M,C,E,M)
% right_angle(B,D,A)
% congruent_angles(C,E,D,M,E,C)
% congruent_angles(E,C,M,B,C,E)
% cong(B,D,E,C) 

  )).
	
% --------------------------------------------------------------------------------

  

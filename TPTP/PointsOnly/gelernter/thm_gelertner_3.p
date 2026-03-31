%include('../axioms/axiomsGelernter.p').
include('../axioms/geo.ax').

% Example taken from Gelertner seminal paper:  
% REALIZATION OF A GEOMETRY THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------
 
fof(thm_gelertner_3, conjecture, ![A,B,C,D,E,M]: (
  ( 
  triangle(A,B,C) &
  between_strict(B,M,C) & 
  cong(B,M,M,C) &
  between_strict(A,D,M) & 
  between_strict(D,M,E) &
  right_angle(M,E,C) &
  right_angle(B,D,M)  
  )
=> 
 cong(B,D,E,C)

% ~collinear(C,E,M)
% ~collinear(B,D,M)
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
% parallel(B,D,C,E)
% opposite_sides(B,C,D,E)
% congruent_angles(D,B,C,E,C,B)
%~collinear(C,D,E)
% congruent_angles(C,E,D,E,D,B) 
% congruent_angles(B,D,E,M,E,C) 
% congruent_angles(C,E,M,A,E,C) 
% between_strict(E,M,A)
% congruent_angles(B,D,E,A,E,C) 
% collinear(E,D,A)
% same_side(C,E,D,A) 
% same_side(D,B,M,E) 
% congruent_angles(C,E,D,B,D,M) 
% congruent_angles(B,D,M,C,E,M)

% right_angle(B,D,A)
% congruent_angles(C,E,D,M,E,C)
% congruent_angles(E,C,M,B,C,E)
% cong(B,D,E,C) 

  )).
	
% --------------------------------------------------------------------------------

% larus thm_gelertner_3.p -h  -t  -l100 -noexcludedmiddle -m8
% Elapsed time: 4.05s

  
  

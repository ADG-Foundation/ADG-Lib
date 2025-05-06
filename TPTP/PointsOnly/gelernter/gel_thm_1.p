include('../Axioms/gelernter.ax').
include('../Axioms/gelernter-euclidean.ax').

% Example taken from Gelertner seminal paper:  
% REALIZATION OF A GEOMETRY THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------

 fof(thm_A, conjecture, ![A,B,C,D]: 
 (( 
   ~collinear(B,A,D) &
   ~collinear(B,C,D) &
   congruent_angles(A,B,D,D,B,C) & 
   perpendicular(A,D,A,B) &
   perpendicular(D,C,B,C) )
  => 
  cong(A,D,C,D)

%  perpendicular(A,D,A,B)
%  right_angle(D,A,B)
%  right_angle(D,C,B)    
%  congruent_angles(D,A,B,D,C,B)
%  congruent_angles(B,D,A,B,D,C)
%  congruent_angles(A,D,B,C,D,B)
%  congruent_triangles(A,B,D,C,B,D)
 )).

% --------------------------------------------------------------------------------

% larus TPTP/PointsOnly/gelernter/gel_thm_1.p  -t -m7 -l2000 -h -noexcludedmiddle (2s)


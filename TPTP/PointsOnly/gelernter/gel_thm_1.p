include('gelernter.ax').

% --------------------------------------------------------------------------------

 fof(thm_A, conjecture, ![A,B,C,D]: 
 (( 
   ~collinear(B,A,D) & ~collinear(B,C,D) & congruent_angles(A,B,D,D,B,C) & 
   perpendicular(A,D,A,B) & perpendicular(D,C,B,C) )
  => 
  cong(A,D,C,D)

% perpendicular_strict(A,D,A,B)
% right_angle(D,A,B)
%  right_angle(D,C,B)    
%  congruent_angles(D,A,B,D,C,B)
%  congruent_angles(B,D,A,B,D,C)
%  congruent_angles(A,D,B,C,D,B)
%  congruent_triangles(A,B,D,C,B,D)
 )).

% --------------------------------------------------------------------------------

% larus theorems/gel_thm_1.p -h -l100 -m21 -n0 -i -t (95s)


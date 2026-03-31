%include('../axioms/axiomsGelernter.p').
include('../axioms/geo.ax').

% Example taken from Gelertner seminal paper:  
% REALIZATION OF A GEOMETRY THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------

 fof(thm_gelertner_1, conjecture, ![A,B,C,D]: 
 (( 
   ~collinear(B,A,D) &
   congruent_angles(A,B,D,D,B,C) & 
   perpendicular(A,D,A,B) &
   perpendicular(D,C,B,C) 
   )
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

% larus thm_gelertner_1.p -h  -t  -l100 -noexcludedmiddle -m8
% Elapsed time: 4.85s


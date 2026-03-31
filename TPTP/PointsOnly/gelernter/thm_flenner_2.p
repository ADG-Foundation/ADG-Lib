%include('../axioms/axiomsPatriciaFlenner1983-ADG-lib.p').
include('../axioms/geo.ax').

% Example taken from
% Masters of Science thesis by Patricia O'Neil Flenner
% CALIFORNIA STATE UNIVERSITY, NORTHRIDGE, 1983

% --------------------------------------------------------------------------------

fof(thm_flenner_2, conjecture, ![A,B,C,D] : ((

~collinear(B,A,D) &
congruent_angles(C,B,D,D,B,A) & 
perpendicular(A,D,A,B) & 
perpendicular(D,C,B,C)
) =>  
cong(A,D,C,D)

%congruent_angles(A,B,D,C,B,D)
%right_angle(B,A,D)
%right_angle(B,C,D)
%congruent_angles(B,A,D,B,C,D)
%congruent_angles(A,D,B,B,D,C)
%congruent_angles(D,A,B,D,C,B)
%congruent_angles(D,B,A,D,B,C)
%congruent_angles(A,B,D,C,B,D)
%congruent_angles(C,B,D,D,B,C)
% cong(B,D,B,D)
%congruent_triangles(D,A,B,D,C,B)
%perpendicular(A,D,A,B)
%cong(A,D,C,D)
)).

% larus pat_thm_2.p -h  -t  -l1000 -m7 
% 1s

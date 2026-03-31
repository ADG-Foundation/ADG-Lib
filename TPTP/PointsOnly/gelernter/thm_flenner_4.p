%include('../axioms/axiomsPatriciaFlenner1983-ADG-lib.p').
include('../axioms/geo.ax').

% Example taken from
% Masters of Science thesis by Patricia O'Neil Flenner
% CALIFORNIA STATE UNIVERSITY, NORTHRIDGE, 1983

% --------------------------------------------------------------------------------

fof(thm_flenner_4, conjecture, ![A,B,C,D,E,F,G] : ((
~collinear(A,B,C) &
between_strict4(B,G,C,D) & 
between_strict(E,F,G) & 
between_strict(A,F,C) &   
congruent_angles(D,E,F,B,A,C) & 
cong(F,G,C,F) & 
cong(D,G,B,C) 
) 
 =>  
congruent_triangles(A,B,C,E,D,G)

% congruent_angles(A,B,C,E,D,G)
% congruent_angles(A,C,B,D,G,E)
)).

% larus pat_thm_4.p -h  -t  -l1000 -m9    -n0 -noexcludedmiddle 
% 105s

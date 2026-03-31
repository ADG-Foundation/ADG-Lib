%include('../axioms/axiomsPatriciaFlenner1983-ADG-lib.p').
include('../axioms/geo.ax').

% Example taken from
% Masters of Science thesis by Patricia O'Neil Flenner
% CALIFORNIA STATE UNIVERSITY, NORTHRIDGE, 1983

% --------------------------------------------------------------------------------

fof(thm_flenner_1, conjecture, ![A,B,C,D,E] : (
((
~collinear(A,B,C) & 
isosceles(A,C,B) & 
midpoint(D,A,C) & 
midpoint(E,B,C) 
)
=> 
congruent_angles(C,E,D,C,A,B)
))).


% larus pat_thm_1.p -h -m9 -t  -noexcludedmiddle

%include('../axioms/axiomsIraGoldstein1973-ADG-lib.p').
include('../axioms/geo.ax').

% Example from 
% MIT Artificial Intelligence Memo 280, 1973
% Elementary Geometry Theorem Proving 
% by Ira Goldstein
% in ADG-Lib 
% with neccesary fixes

% --------------------------------------------------------------------------------

fof(thm_goldstein_1, conjecture, ![A,B,C,D,E] : ((
~collinear(A,B,C) &
between_strict(A,C,E) &
cong(A,B,A,D) &
cong(C,B,C,D) 
) =>  
cong(B,E,D,E)

%cong(A,E,A,E)
%cong(A,B,A,D)
%congruent_angles(B,A,E,D,A,E)
%congruent_angles(B,A,C,D,A,C)
%congruent_triangles(A,B,C,A,D,C)
)).

% larus goldstein_thm_1.p  -h -l100 -m6 -noexcludedmiddle -t

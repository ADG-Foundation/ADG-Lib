%include('../axioms/axiomsIraGoldstein1973-ADG-lib.p').
include('../axioms/geo.ax').

% Example from 
% MIT Artificial Intelligence Memo 280, 1973
% Elementary Geometry Theorem Proving 
% by Ira Goldstein
% in ADG-Lib 
% with neccesary fixes

% --------------------------------------------------------------------------------

fof(thm_goldstein_3, conjecture, ![T,U,R,S] : ((
quadrilateral(T,U,R,S) &
cong(U,R,T,S) &
congruent_angles(T,S,R,S,R,U)
) =>  
congruent_angles(S,T,U,T,U,R)

%congruent_triangles(R,U,T,S,T,U)
%cong(R,T,U,S)
%congruent_angles(U,S,R,T,R,S)

)).

% larus goldstein_thm_3.p  -h -l100 -m4  -t -noexcludedmiddle


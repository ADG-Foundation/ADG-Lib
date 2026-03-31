%include('../axioms/axiomsIraGoldstein1973-ADG-lib.p').
include('../axioms/geo.ax').

% Example from 
% MIT Artificial Intelligence Memo 280, 1973
% Elementary Geometry Theorem Proving 
% by Ira Goldstein
% in ADG-Lib 
% with neccesary fixes

% --------------------------------------------------------------------------------

fof(thm_goldstein_2, conjecture, ![M,N,P,Q,K] : ((
between_strict4(M,P,Q,N) &
cong(M,P,Q,N) &
congruent_angles(K,P,Q,P,Q,K) &
~collinear(K,P,Q) 
) =>  
cong(K,M,K,N)

%congruent_triangles(K,M,Q,K,N,P)
%congruent_angles(K,P,N,K,Q,M)
%cong(M,Q,P,N)
%cong(K,Q,K,P)
%congruent_triangles(K,Q,P,K,P,Q)

)).

% larus goldstein_thm_2.p  -h -l100 -m8  -t -noexcludedmiddle

%include('../axioms/axiomsIraGoldstein1973-ADG-lib.p').
include('../axioms/geo.ax').

% Example from 
% MIT Artificial Intelligence Memo 280, 1973
% Elementary Geometry Theorem Proving 
% by Ira Goldstein
% in ADG-Lib 
% with neccesary fixes

% --------------------------------------------------------------------------------

fof(thm_goldstein_4, conjecture, ![A,B,C,D,E,F] : ((
  parallelogram(A,B,C,D) 
  & midpoint(E,A,B)
  & midpoint(F,C,D)
) =>  

  parallelogram(D,E,B,F)

%parallelogram(B,E,D,F)
%~collinear(B,E,D)
% opposite_sides(B,D,E,F)
% cong(B,E,D,F)
% parallel(B,E,D,F)
% ~collinear(B,D,E)
%cong(D,E,F,B)
%cong(A,D,B,C)
%cong(A,E,F,C)
%congruent_angles(D,A,E,B,C,F)
%congruent_angles(D,A,E,B,C,F)
%congruent_triangles(E,D,A,F,B,C)
%congruent_triangles(D,A,E,B,C,F)
)).

% semanticGuidance thm_goldstein_4.p -l60


% larus goldstein_thm_3.p  -h -l100 -m4  -t -noexcludedmiddle


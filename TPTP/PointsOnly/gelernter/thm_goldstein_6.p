%include('../axioms/axiomsIraGoldstein1973-ADG-lib.p').
include('../axioms/geo.ax').


% Example from 
% MIT Artificial Intelligence Memo 280, 1973
% Elementary Geometry Theorem Proving 
% by Ira Goldstein
% in ADG-Lib 
% with neccesary fixes

% --------------------------------------------------------------------------------

fof(thm_goldstein_6, conjecture, ![A,B,C,D,E,F,G,H] : ((
square(A,B,C,D) 
& midpoint(E,A,B)
& midpoint(F,B,C)
& midpoint(G,D,C)
& midpoint(H,D,A)
) =>  

congruent_triangles(E,F,G,E,H,G)

%midpoint(H,D,A)
%midpoint(F,B,C)
%cong(D,A,B,C)
%cong(D,H,C,F)
%cong(D,G,C,G)
%congruent_triangles(H,D,G,F,C,G)
%cong(H,G,G,F)
%right_angle(A,D,C)
%congruent_angles(A,D,C,B,C,D)
%cong(H,G,G,F)



)).



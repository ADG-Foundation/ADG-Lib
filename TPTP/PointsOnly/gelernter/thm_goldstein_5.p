%include('../axioms/axiomsIraGoldstein1973-ADG-lib.p').
include('../axioms/geo.ax').

% Example from 
% MIT Artificial Intelligence Memo 280, 1973
% Elementary Geometry Theorem Proving 
% by Ira Goldstein
% in ADG-Lib 
% with neccesary fixes

% --------------------------------------------------------------------------------


% needs axioms for addition/substration of angles!!

fof(thm_goldstein_5, conjecture, ![A,B,C,D,E] : ((
rectangle(A,E,D,C) 
& cong(B,A,B,C)
& E!=D
& D!=A
& E!=A

& D!=B
& A!=B
& C!=B


) =>  
congruent_angles(B,E,D,B,D,E)

%congruent_angles(B,A,C,B,C,A)


%congruent_angles(E,A,B,D,C,B)

)).



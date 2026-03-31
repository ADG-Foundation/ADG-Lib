%include('../axioms/axiomsPatriciaFlenner1983-ADG-lib.p').
include('../axioms/geo.ax').

% Example taken from
% Masters of Science thesis by Patricia O'Neil Flenner
% CALIFORNIA STATE UNIVERSITY, NORTHRIDGE, 1983

fof(lemma2, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((cong(B,D,C,D)))))).
fof(lemma3, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((congruent_angles(B,A,D,B,A,E)))))).
fof(lemma4, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((congruent_angles(B,A,D,B,A,F)))))).
fof(lemma5, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((congruent_angles(B,A,E,B,A,D)))))).
fof(lemma6, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((congruent_angles(B,A,E,B,A,F)))))).
fof(lemma7, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((congruent_angles(B,A,F,B,A,D)))))).
fof(lemma8, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((congruent_angles(B,A,F,B,A,E)))))).
fof(lemma9, axiom, (! [A,B,C,D,E,F] : ((premises(A,B,C,D,E,F)) => ((congruent_angles(C,A,D,C,A,E)))))).


% --------------------------------------------------------------------------------

fof(thm_flenner_3, conjecture, ![A,B,C,D,E,F] : ((
triangle(A,B,C) &
midpoint(D,B,C) &
perpendicular(A,D,C,E) &
perpendicular(A,D,B,F) &
between_strict4(A,F,D,E) 
) =>  

 cong(B,F,C,E)

% right_angle(A,E,C)
% right_angle(B,F,D)
% congruent_angles(A,E,C,B,F,D)
% between_strict(F,D,E)
% between_strict(B,D,C)
% congruent_angles(F,D,B,E,D,C)
% congruent_angles(F,B,D,E,C,D)
% opposite_sides(B,C,F,E)
% parallel(B,F,C,E)
% congruent_angles(C,B,F,E,C,B)
% congruent_angles(D,B,F,E,C,D)
% congruent_angles(F,D,B,E,D,C)
% congruent_triangles(F,B,D,E,C,D)


)).


% larus  pat_thm_3.p -h -t -l100 -m9  -noexcludedmiddle




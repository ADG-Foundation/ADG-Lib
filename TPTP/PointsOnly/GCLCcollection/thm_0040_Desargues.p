% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0040_Desargues.p; Output: thm_0040_Desargues.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ S,A_2,A_1,A_3] : ((
   dimensions(110, 90)
   & freepoint(S, 20, 30)
   & freepoint(A_2, 36.6, 30)
   & collinear(B_2, S, A_2)
   & freepoint(A_1, 27.2, 24.7)
   & collinear(B_1, S, A_1)
   & freepoint(A_3, 42.2, 41.1)
   & collinear(B_3, S, A_3)
   & intersection(A_1, A_2, B_1, B_2, P)
   & intersection(A_1, A_3, B_1, B_3, Q)
   & intersection(A_2, A_3, B_2, B_3, R)
   & drawdashline(P, Q)
   & drawline(A_1, A_2)
   & drawline(A_1, A_3)
   & drawline(A_2, A_3)
   & drawline(B_1, B_2)
   & drawline(B_1, B_3)
   & drawline(B_2, B_3)
   & cmark_t(P)
   & cmark_l(Q)
   & cmark_l(R)
   & cmark_b(A_1)
   & cmark_rb(A_2)
   & cmark_rb(A_3)
   & cmark_b(B_1)
   & cmark_rb(B_2)
   & cmark_rb(B_3)
   & cmark_b(S)
   & drawline(S, A_1)
   & drawline(S, A_2)
   & drawline(S, A_3)
   & prooflevel(1)) 
 => 
   collinear(P, Q, R))).

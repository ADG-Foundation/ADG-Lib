% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0150_PappusHexagon.p; Output: thm_0150_PappusHexagon.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,A_1,B_1] : ((
   dimensions(110, 90)
   & freepoint(A, 40, 10)
   & freepoint(B, 90, 10)
   & collinear(C, A, B)
   & freepoint(A_1, 35.2, 38.2)
   & freepoint(B_1, 76.8, 64.6)
   & collinear(C_1, A_1, B_1)
   & intersection(A, B_1, B, A_1, P)
   & intersection(A, C_1, C, A_1, Q)
   & intersection(B, C_1, C, B_1, S)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_lt(A_1)
   & cmark_rb(B_1)
   & cmark_l(C_1)
   & cmark_rb(P)
   & cmark_r(Q)
   & cmark_r(S)
   & drawdashline(P, S)
   & drawsegment(A, B_1)
   & drawsegment(A, Q)
   & drawsegment(B, A_1)
   & drawsegment(B, C_1)
   & drawsegment(C, Q)
   & drawsegment(C, B_1)
   & drawline(A_1, C_1)
   & drawline(A, C)
   & prooflevel(1)) 
 => 
   collinear(P, Q, S))).

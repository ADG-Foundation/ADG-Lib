% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0130_Pappus.p; Output: thm_0130_Pappus.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,A_1,A_2] : ((
   dimensions(100, 80)
   & freepoint(A, 20, 10)
   & freepoint(B, 90, 10)
   & collinear(C, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & freepoint(A_1, 55, 50)
   & freepoint(A_2, 45, 43)
   & parallel(P1, A, A_1, B)
   & intersection(A_1, A_2, P1, A, B_1)
   & parallel(P2, B, C, B_1)
   & intersection(A_1, A_2, P2, B, C_1)
   & cmark_lt(A_1)
   & cmark_lt(B_1)
   & cmark_lt(C_1)
   & drawline(A, C)
   & drawline(A_1, C_1)
   & drawsegment(A, B_1)
   & drawsegment(B, A_1)
   & drawsegment(B, C_1)
   & drawsegment(C, B_1)
   & drawsegment(A, C_1)
   & drawsegment(C, A_1)
   & prooflevel(1)) 
 => 
   parallel(A_1, C, A, C_1))).

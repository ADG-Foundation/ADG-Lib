% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0140_PappusDual.p; Output: thm_0140_PappusDual.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ O,A,B,C,O_1] : ((
   dimensions(130, 130)
   & freepoint(O, 25.8, 48.3)
   & freepoint(A, 95.2, 55)
   & freepoint(B, 120.1, 91.6)
   & freepoint(C, 44.5, 112.7)
   & freepoint(O_1, 62.4, 56.8)
   & intersection(O_1, B, O, C, A_1)
   & intersection(O, A, O_1, C, B_1)
   & intersection(O, B, O_1, A, C_1)
   & intersection(B, B_1, A, A_1, I)
   & drawdashline(C, I)
   & cmark_b(A_1)
   & cmark_rb(B_1)
   & cmark_lt(C_1)
   & cmark_rb(I)
   & cmark_l(O)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_l(C)
   & cmark_lt(O_1)
   & drawsegment(A_1, C)
   & drawsegment(O, B)
   & drawsegment(O, A)
   & drawsegment(A, C_1)
   & drawsegment(A_1, B)
   & drawsegment(C, B_1)
   & drawdashsegment(A_1, A)
   & drawdashsegment(I, B)
   & prooflevel(1)) 
 => 
   collinear(C, C_1, I))).

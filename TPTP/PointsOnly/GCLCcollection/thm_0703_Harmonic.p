% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0703_Harmonic.p; Output: thm_0703_Harmonic.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,C,O] : ((
   dimensions(130, 85)
   & freepoint(A, 20, 20)
   & freepoint(C, 40, 20)
   & collinear(D, A, C)
   & collinear(B, A, C)
   & freepoint(O, 80, 70)
   & collinear(A_1, A, O)
   & collinear(B_1, B, O)
   & intersection(A_1, B_1, C, O, C_1)
   & intersection(A_1, B_1, D, O, D_1)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_b(D)
   & cmark_r(O)
   & cmark_rb(A_1)
   & cmark_rb(C_1)
   & cmark_rb(D_1)
   & cmark_rb(B_1)
   & drawsegment(A, B)
   & drawsegment(A, O)
   & drawsegment(B, O)
   & drawsegment(C, O)
   & drawsegment(D, O)
   & drawdashline(A_1, B_1)
   & prooflevel(1)) 
 => 
   mult(sratio(C, A, C, B), sratio(D, B, D, A)) = mult(sratio(C_1, A_1, C_1, B_1), sratio(D_1, B_1, D_1, A_1)))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0050_Menelaus.p; Output: thm_0050_Menelaus.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C] : ((
   dimensions(100, 80)
   & freepoint(A, 30, 20)
   & freepoint(B, 60, 20)
   & freepoint(C, 40, 50)
   & collinear(D, B, C)
   & collinear(E, A, C)
   & intersection(A, B, D, E, F)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(B, C)
   & drawline(D, E)
   & drawline(A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_rt(D)
   & cmark_lt(E)
   & cmark_rt(F)
   & prooflevel(1)) 
 => 
   mult(mult(sratio(A, F, F, B), sratio(B, D, D, C)), sratio(C, E, E, A)) = -1)).

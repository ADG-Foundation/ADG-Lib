% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0100_Parallelogram.p; Output: thm_0100_Parallelogram.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D] : ((
   dimensions(130, 70)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 103.4, 55.1)
   & translate(D, B, A, C)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, D)
   & drawsegment(C, D)
   & prooflevel(1)) 
 => 
   sratio(A, B, D, C) = 1)).

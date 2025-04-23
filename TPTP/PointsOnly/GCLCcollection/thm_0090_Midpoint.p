% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0090_Midpoint.p; Output: thm_0090_Midpoint.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C] : ((
   dimensions(80, 50)
   & freepoint(A, 20, 10)
   & freepoint(B, 70, 10)
   & freepoint(C, 35, 40)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(B, C)
   & midpoint(B_1, B, C)
   & midpoint(A_1, A, C)
   & drawsegment(A_1, B_1)
   & midpoint(M, A, B)
   & cmark_b(M)
   & drawdashsegment(A_1, M)
   & drawdashsegment(B_1, M)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_lt(A_1)
   & cmark_rt(B_1)
   & prooflevel(1)) 
 => 
   parallel(A_1, B_1, A, B))).

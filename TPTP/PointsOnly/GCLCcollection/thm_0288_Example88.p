% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0288_Example88.p; Output: thm_0288_Example88.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,E,D,F,C,H] : ((
   dimensions(110, 80)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & on_circle(C, B, A)
   & collinear(D, A, C)
   & foot(E, D, A, B)
   & foot(F, D, B, C)
   & foot(H, C, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_l(D)
   & cmark_b(H)
   & cmark_b(E)
   & cmark_rt(F)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, H)
   & drawsegment(D, E)
   & drawsegment(D, F)
   & prooflevel(1)) 
 => 
   alg_sum_zero3(D, E, D, F, C, H))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0321_Example121.p; Output: thm_0321_Example121.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 35)
   & freepoint(B, 90, 35)
   & freepoint(C, 70, 90)
   & freepoint(D, 50, 20)
   & parallel(P1, A, B, D)
   & intersection(P1, A, C, D, E)
   & parallel(P2, E, B, C)
   & intersection(A, B, P2, E, F)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(D)
   & cmark_r(E)
   & cmark_rb(F)
   & drawsegment(A, B)
   & drawsegment(C, D)
   & drawsegment(C, B)
   & drawsegment(A, E)
   & drawsegment(E, F)
   & drawdashsegment(A, C)
   & drawdashsegment(D, F)
   & prooflevel(1)) 
 => 
   parallel(A, C, D, F))).

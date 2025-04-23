% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0284_Example84.p; Output: thm_0284_Example84.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C] : ((
   dimensions(130, 110)
   & freepoint(A, 30, 30)
   & freepoint(B, 110, 30)
   & freepoint(C, 90, 80)
   & parallel(P1, C, A, B)
   & parallel(P2, A, B, C)
   & intersection(P1, C, P2, A, D)
   & collinear(H, B, C)
   & intersection(A, C, B, D, O)
   & intersection(O, H, P1, C, F)
   & intersection(O, H, A, B, G)
   & intersection(O, H, P2, A, E)
   & cmark_lb(A)
   & cmark_b(B)
   & cmark_r(C)
   & cmark_t(D)
   & cmark_lt(F)
   & cmark_b(O)
   & cmark_l(H)
   & cmark_r(E)
   & drawsegment(A, B)
   & drawsegment(H, B)
   & drawsegment(C, D)
   & drawsegment(E, D)
   & drawsegment(E, H)
   & drawsegment(A, C)
   & drawsegment(B, D)
   & prooflevel(1)) 
 => 
   sratio(E, F, G, H) = 1)).

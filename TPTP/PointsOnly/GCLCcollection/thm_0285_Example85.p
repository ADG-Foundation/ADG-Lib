% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0285_Example85.p; Output: thm_0285_Example85.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 110, 70)
   & parallel(P1, A, B, C)
   & parallel(P2, C, A, B)
   & intersection(P1, A, P2, C, D)
   & collinear(P, B, C)
   & parallel(P3, P, A, B)
   & intersection(P3, P, P1, A, Q)
   & intersection(P, D, Q, C, N)
   & intersection(P, A, Q, B, M)
   & cmark_b(M)
   & cmark_b(A)
   & cmark_t(N)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & cmark_r(P)
   & cmark_l(Q)
   & drawsegment(P, D)
   & drawsegment(P, A)
   & drawsegment(Q, C)
   & drawsegment(B, Q)
   & drawsegment(P, Q)
   & drawsegment(A, B)
   & drawsegment(A, D)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawdashsegment(M, N)
   & prooflevel(1)) 
 => 
   sratio(A, D, M, N) = 2)).

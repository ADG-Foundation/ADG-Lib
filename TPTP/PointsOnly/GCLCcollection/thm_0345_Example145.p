% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0345_Example145.p; Output: thm_0345_Example145.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,K,N,J] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 40, 88)
   & midpoint(F, A, B)
   & collinear(N, C, F)
   & foot(K, N, A, C)
   & foot(J, N, B, C)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_b(F)
   & cmark_lt(K)
   & cmark_rt(J)
   & cmark_lb(N)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, F)
   & drawsegment(N, K)
   & drawsegment(N, J)
   & prooflevel(1)) 
 => 
   mult(length(N, K), length(A, C)) = mult(length(N, J), length(B, C)))).

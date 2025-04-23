% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0256_Example56.p; Output: thm_0256_Example56.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ M,N,P,Pp] : ((
   dimensions(130, 60)
   & freepoint(M, 20, 20)
   & freepoint(N, 70, 20)
   & freepoint(P, 85, 45)
   & parallel(P1, P, M, N)
   & parallel(P2, M, N, P)
   & intersection(P1, P, P2, M, Q)
   & translate(Pp, M, N, P)
   & collinear(S, P, Pp)
   & intersection(M, S, N, Q, T)
   & intersection(N, P, M, S, R)
   & cmark_b(M)
   & cmark_b(N)
   & cmark_b(S)
   & cmark_b(Q)
   & cmark_b(T)
   & cmark_b(R)
   & cmark_b(P)
   & drawsegment(M, N)
   & drawsegment(Q, S)
   & drawsegment(M, Q)
   & drawsegment(N, P)
   & drawsegment(M, S)
   & drawsegment(M, Q)
   & drawsegment(N, Q)
   & prooflevel(1)) 
 => 
   sum(sratio(M, T, M, R), sratio(M, T, M, S)) = 1)).

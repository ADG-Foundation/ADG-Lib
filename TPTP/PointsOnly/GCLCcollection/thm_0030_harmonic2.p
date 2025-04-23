% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0030_harmonic2.p; Output: thm_0030_harmonic2.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D] : ((
   dimensions(130, 50)
   & freepoint(A, 30, 32)
   & freepoint(B, 40, 40)
   & freepoint(C, 48, 28)
   & freepoint(D, 40, 25)
   & cmark_lt(A)
   & cmark_t(B)
   & cmark_rt(C)
   & cmark_lb(D)
   & intersection(A, B, C, D, L)
   & cmark_b(L)
   & intersection(A, D, B, C, K)
   & cmark_b(K)
   & intersection(B, D, K, L, F)
   & cmark_b(F)
   & intersection(A, C, K, L, G)
   & cmark_b(G)
   & drawsegment(B, L)
   & drawsegment(C, L)
   & drawsegment(A, K)
   & drawsegment(B, K)
   & drawsegment(B, F)
   & drawsegment(A, G)
   & drawdashline(L, K)
   & prooflevel(1)) 
 => 
   harmonic(L, K, F, G))).

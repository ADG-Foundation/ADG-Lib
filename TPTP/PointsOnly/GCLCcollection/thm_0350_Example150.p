% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0350_Example150.p; Output: thm_0350_Example150.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,M] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 40, 88)
   & freepoint(M, 93, 90)
   & midpoint(F, A, B)
   & midpoint(E, A, C)
   & midpoint(D, B, C)
   & intersection(A, D, C, F, G)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_t(M)
   & cmark_lt(G)
   & cmark_b(F)
   & cmark_lt(E)
   & cmark_rt(D)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(M, B)
   & drawsegment(C, M)
   & drawsegment(C, F)
   & drawsegment(A, D)
   & drawsegment(B, E)
   & drawsegment(G, M)
   & prooflevel(1)) 
 => 
   sum(mult(length(M, G), 3), sum(length(A, G), sum(length(C, G), length(B, G)))) = sum(length(A, M), sum(length(B, M), length(C, M))))).

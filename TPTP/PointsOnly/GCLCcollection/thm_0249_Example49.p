% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0249_Example49.p; Output: thm_0249_Example49.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,Cp] : ((
   dimensions(130, 80)
   & freepoint(A, 20, 20)
   & freepoint(B, 110, 20)
   & freepoint(C, 90, 50)
   & parallel(P1, C, A, B)
   & translate(Cp, A, B, C)
   & collinear(D, C, Cp)
   & intersection(A, D, B, C, F)
   & intersection(A, C, B, D, E)
   & intersection(A, B, E, F, G)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_rt(C)
   & cmark_lt(D)
   & cmark_rb(E)
   & cmark_rt(F)
   & cmark_b(G)
   & drawsegment(A, F)
   & drawsegment(B, F)
   & drawsegment(G, F)
   & drawsegment(A, B)
   & drawsegment(C, D)
   & drawsegment(A, C)
   & drawsegment(B, D)
   & prooflevel(1)) 
 => 
   sratio(A, G, G, B) = 1)).

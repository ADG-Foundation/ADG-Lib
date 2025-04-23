% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0320_Example120.p; Output: thm_0320_Example120.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C] : ((
   dimensions(110, 100)
   & freepoint(A, 50, 50)
   & freepoint(B, 90, 50)
   & freepoint(C, 75, 80)
   & collinear(X, B, C)
   & parallel(P1, C, A, X)
   & parallel(P2, B, A, X)
   & intersection(P2, B, A, C, Y)
   & intersection(P1, C, A, B, Z)
   & cmark_t(Z)
   & cmark_b(Y)
   & cmark_rt(X)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & drawsegment(Z, B)
   & drawsegment(Y, C)
   & drawsegment(Z, X)
   & drawsegment(A, X)
   & drawsegment(Y, Z)
   & drawsegment(B, C)
   & drawsegment(C, Z)
   & drawsegment(Y, B)
   & drawsegment(X, Y)
   & prooflevel(1)) 
 => 
   mult(2, signed_area3(B, A, C)) = signed_area3(X, Y, Z))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0242_Example42.p; Output: thm_0242_Example42.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D] : ((
   dimensions(110, 90)
   & freepoint(A, 20, 20)
   & freepoint(B, 60, 20)
   & freepoint(C, 50, 50)
   & freepoint(D, 35, 65)
   & intersection(A, B, C, D, W)
   & midpoint(X, A, C)
   & midpoint(Y, B, D)
   & cmark_b(X)
   & cmark_b(Y)
   & cmark_b(W)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, W)
   & drawsegment(C, B)
   & drawsegment(D, W)
   & drawsegment(A, D)
   & drawdashsegment(B, D)
   & drawdashsegment(C, A)
   & drawsegment(X, Y)
   & drawsegment(X, W)
   & drawsegment(Y, W)
   & prooflevel(1)) 
 => 
   mult(4, signed_area3(X, W, Y)) = signed_area4(A, B, C, D))).

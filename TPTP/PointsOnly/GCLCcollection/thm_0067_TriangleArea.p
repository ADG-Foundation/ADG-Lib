% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0067_TriangleArea.p; Output: thm_0067_TriangleArea.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C] : ((
   dimensions(100, 70)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 65, 45)
   & midpoint(M, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(M)
   & drawsegment(A, B)
   & drawsegment(B, C)
   & drawsegment(A, C)
   & drawsegment(C, M)
   & prooflevel(1)) 
 => 
   signed_area3(A, M, C) = signed_area3(M, B, C))).

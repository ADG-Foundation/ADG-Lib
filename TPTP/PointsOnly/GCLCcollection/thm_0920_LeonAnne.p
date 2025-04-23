% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0920_LeonAnne.p; Output: thm_0920_LeonAnne.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 75, 85)
   & freepoint(D, 40, 65)
   & midpoint(M_1, A, C)
   & midpoint(M_2, B, D)
   & collinear(O, M_1, M_2)
   & drawline(A, C)
   & drawline(B, D)
   & drawdashline(M_1, M_2)
   & cmark_b(M_1)
   & cmark_b(M_2)
   & cmark_t(O)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawsegment(A, D)
   & prooflevel(1)) 
 => 
   mult(2, sum(signed_area3(A, B, O), signed_area3(C, D, O))) = signed_area4(A, B, C, D))).

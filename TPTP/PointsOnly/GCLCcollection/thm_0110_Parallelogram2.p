% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0110_Parallelogram2.p; Output: thm_0110_Parallelogram2.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C] : ((
   dimensions(130, 70)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 97.6, 51.5)
   & parallel(P1, A, B, C)
   & parallel(P2, C, A, B)
   & intersection(P1, A, P2, C, D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, D)
   & drawsegment(C, D)
   & intersection(A, C, B, D, E)
   & cmark_t(E)
   & drawdashsegment(A, C)
   & drawdashsegment(B, D)
   & prooflevel(1)) 
 => 
   same_length(A, E, E, C))).

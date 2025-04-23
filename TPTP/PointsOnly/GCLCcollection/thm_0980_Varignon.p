% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0980_Varignon.p; Output: thm_0980_Varignon.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D] : ((
   dimensions(100, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 70, 70)
   & freepoint(D, 30, 50)
   & midpoint(P, A, B)
   & midpoint(Q, B, C)
   & midpoint(R, C, D)
   & midpoint(S, D, A)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & cmark_b(P)
   & cmark_r(Q)
   & cmark_t(R)
   & cmark_l(S)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawsegment(A, D)
   & drawdashsegment(P, Q)
   & drawdashsegment(R, Q)
   & drawdashsegment(R, S)
   & drawdashsegment(P, S)
   & prooflevel(1)) 
 => 
   parallel(P, Q, R, S))).

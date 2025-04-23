% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0015_Thales.p; Output: thm_0015_Thales.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ O,A,C] : ((
   dimensions(80, 80)
   & freepoint(O, 20, 30)
   & freepoint(A, 60, 30)
   & freepoint(C, 40, 50)
   & collinear(B, O, A)
   & parallel(P1, B, A, C)
   & intersection(O, C, P1, B, D)
   & drawline(O, A)
   & drawline(O, C)
   & drawline(A, C)
   & drawline(B, D)
   & cmark_t(O)
   & cmark_t(A)
   & cmark_t(B)
   & cmark_t(C)
   & cmark_t(D)
   & prooflevel(1)) 
 => 
   sratio(O, A, O, B) = sratio(O, C, O, D))).

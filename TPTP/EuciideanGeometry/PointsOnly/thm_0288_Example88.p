% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0288_Example88.p; Output: thm_0288_Example88.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0288_Example88.p; Output: tmp_2_thm_0288_Example88.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0288_Example88
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,E,F,H] : ((
   dimensions(110,80)
   & freepoint(A,20,20)
   & freepoint(B,90,20)
   & oncircle(C,B,A)
   & coll(D,A,C)
   & foot(E,D,A,B)
   & foot(F,D,B,C)
   & foot(H,C,A,B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_l(D)
   & cmark_b(H)
   & cmark_b(E)
   & cmark_rt(F)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(C,B)
   & drawsegment(C,H)
   & drawsegment(D,E)
   & drawsegment(D,F)
   & prooflevel(1)) 
 => 
   alg_sum_zero3(D,E,D,F,C,H))).

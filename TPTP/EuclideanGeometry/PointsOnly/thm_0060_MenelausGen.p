% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0060_MenelausGen.p; Output: thm_0060_MenelausGen.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0060_MenelausGen.p; Output: tmp_2_thm_0060_MenelausGen.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0060_MenelausGen
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,A_1,B_1,C_1,D_1] : ((
   dimensions(100,100)
   & freepoint(A,20,20)
   & freepoint(B,80,20)
   & freepoint(C,70,60)
   & freepoint(D,37,74)
   & coll(A_1,A,B)
   & coll(B_1,B,C)
   & inter(A_1,B_1,C,D,C_1)
   & inter(A_1,B_1,D,A,D_1)
   & cmark_rb(A)
   & cmark_b(B)
   & cmark_r(C)
   & cmark_l(D)
   & cmark_rt(A_1)
   & cmark_r(B_1)
   & cmark_rt(C_1)
   & cmark_r(D_1)
   & drawsegment(A,B)
   & drawsegment(C,B)
   & drawsegment(C,D)
   & drawsegment(A,D)
   & drawdashline(A_1,B_1)
   & drawline(D,A)
   & drawline(A,B)
   & prooflevel(1)) 
 => 
   mult(mult(mult(sratio(A,A_1,A_1,B),sratio(B,B_1,B_1,C)),sratio(C,C_1,C_1,D)),sratio(D,D_1,D_1,A)) = 1)).

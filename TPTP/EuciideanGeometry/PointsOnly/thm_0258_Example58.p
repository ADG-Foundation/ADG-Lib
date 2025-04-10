% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0258_Example58.p; Output: thm_0258_Example58.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0258_Example58.p; Output: tmp_2_thm_0258_Example58.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0258_Example58
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C_1,C,A_1,B_1,A_2,B_2,C_2] : ((
   dimensions(130,100)
   & freepoint(A,20,20)
   & freepoint(B,90,20)
   & towards(C_1,A,B,0.333333)
   & freepoint(C,70,80)
   & towards(A_1,B,C,0.333333)
   & towards(B_1,C,A,0.333333)
   & inter(B,B_1,C,C_1,A_2)
   & inter(A,A_1,C,C_1,B_2)
   & inter(A,A_1,B,B_1,C_2)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C_1)
   & cmark_r(C)
   & cmark_r(A_1)
   & cmark_lt(B_1)
   & cmark_b(C_2)
   & cmark_rb(B_2)
   & cmark_r(A_2)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(C,B)
   & drawsegment(C,C_1)
   & drawsegment(A,A_1)
   & drawsegment(B,B_1)
   & prooflevel(1)) 
 => 
   signed_area3(A,B,C) = mult(7,signed_area3(A_2,B_2,C_2)))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0257_Example57.p; Output: thm_0257_Example57.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0257_Example57.p; Output: tmp_2_thm_0257_Example57.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0257_Example57
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,D,C_1,D_1,A_1,B_1,A_2,B_2,C_2,D_2] : ((
   dimensions(130,100)
   & freepoint(A,20,20)
   & freepoint(B,90,20)
   & freepoint(C,110,80)
   & paraS(P1,A,B,C)
   & paraS(P2,C,A,B)
   & inter(P1,A,P2,C,D)
   & towards(C_1,A,B,0.333333)
   & towards(D_1,B,C,0.333333)
   & towards(A_1,C,D,0.333333)
   & towards(B_1,D,A,0.333333)
   & inter(A,A_1,B,B_1,A_2)
   & inter(B,B_1,C,C_1,B_2)
   & inter(D,D_1,C,C_1,C_2)
   & inter(A,A_1,D,D_1,D_2)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C_1)
   & cmark_t(C)
   & cmark_t(A_1)
   & cmark_lt(B_1)
   & cmark_b(C_2)
   & cmark_b(B_2)
   & cmark_b(A_2)
   & cmark_t(D)
   & cmark_b(D_2)
   & cmark_r(D_1)
   & drawsegment(A,B)
   & drawsegment(B,C)
   & drawsegment(C,D)
   & drawsegment(A,D)
   & drawsegment(C,C_1)
   & drawsegment(A,A_1)
   & drawsegment(B,B_1)
   & drawsegment(D,D_1)
   & prooflevel(1)) 
 => 
   signed_area4(A,B,C,D) = mult(13,signed_area4(A_2,B_2,C_2,D_2)))).

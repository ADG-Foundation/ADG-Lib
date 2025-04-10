% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0150_PappusHexagon.p; Output: thm_0150_PappusHexagon.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0150_PappusHexagon.p; Output: tmp_2_thm_0150_PappusHexagon.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0150_PappusHexagon
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,A_1,B_1,C_1,P,Q,S] : ((
   dimensions(110,90)
   & freepoint(A,40,10)
   & freepoint(B,90,10)
   & coll(C,A,B)
   & freepoint(A_1,35.2,38.2)
   & freepoint(B_1,76.8,64.6)
   & coll(C_1,A_1,B_1)
   & inter(A,B_1,B,A_1,P)
   & inter(A,C_1,C,A_1,Q)
   & inter(B,C_1,C,B_1,S)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_lt(A_1)
   & cmark_rb(B_1)
   & cmark_l(C_1)
   & cmark_rb(P)
   & cmark_r(Q)
   & cmark_r(S)
   & drawdashline(P,S)
   & drawsegment(A,B_1)
   & drawsegment(A,Q)
   & drawsegment(B,A_1)
   & drawsegment(B,C_1)
   & drawsegment(C,Q)
   & drawsegment(C,B_1)
   & drawline(A_1,C_1)
   & drawline(A,C)
   & prooflevel(1)) 
 => 
   collinear(P,Q,S))).

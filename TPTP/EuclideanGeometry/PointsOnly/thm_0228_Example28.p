% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0228_Example28.p; Output: thm_0228_Example28.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0228_Example28.p; Output: tmp_2_thm_0228_Example28.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0228_Example28
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,C_1,B,A_1,C,O,H,B_1,I] : ((
   dimensions(110,90)
   & freepoint(A,30,20)
   & freepoint(C_1,58,20)
   & freepoint(B,20,37)
   & freepoint(A_1,37,50)
   & freepoint(C,60,35)
   & inter(A,C_1,A_1,C,O)
   & inter(B,A_1,C,C_1,H)
   & inter(B,O,A,H,B_1)
   & inter(C,B_1,B,C_1,I)
   & cmark_rb(B_1)
   & cmark_t(H)
   & cmark_rb(A)
   & cmark_b(C_1)
   & cmark_lb(B)
   & cmark_lt(A_1)
   & cmark_rt(C)
   & cmark_b(O)
   & drawsegment(B,H)
   & drawsegment(A,H)
   & drawsegment(C_1,H)
   & drawsegment(A,O)
   & drawsegment(B,O)
   & drawsegment(A_1,O)
   & drawsegment(A,B)
   & drawsegment(B,C)
   & drawdashline(C,B_1)
   & drawdashline(B,C_1)
   & drawdashline(A,A_1)
   & prooflevel(1)) 
 => 
   collinear(A,A_1,I))).

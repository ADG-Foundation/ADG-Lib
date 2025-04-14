% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0259_Example59.p; Output: thm_0259_Example59.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0259_Example59.p; Output: tmp_2_thm_0259_Example59.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0259_Example59
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ O,A,B,C,O_1,A_1,B_1,C_1,O_2] : ((
   dimensions(130,100)
   & freepoint(O,20,20)
   & freepoint(A,70,20)
   & freepoint(B,40.4,60.7)
   & freepoint(C,73.2,52.5)
   & freepoint(O_1,57.1,64)
   & inter(C,O_1,A,O,A_1)
   & inter(A,O_1,B,O,B_1)
   & inter(B,O_1,C,O,C_1)
   & inter(B,A_1,A,C_1,O_2)
   & cmark_b(O)
   & cmark_b(A)
   & cmark_l(B)
   & cmark_r(B_1)
   & cmark_lt(O_1)
   & cmark_b(C)
   & cmark_l(O_2)
   & cmark_rb(C_1)
   & cmark_b(A_1)
   & drawsegment(O,B_1)
   & drawsegment(O,A_1)
   & drawsegment(O,C_1)
   & drawsegment(A,B_1)
   & drawsegment(B,C_1)
   & drawsegment(A,C_1)
   & drawsegment(B,A_1)
   & drawsegment(O_1,A_1)
   & drawdashline(B_1,C)
   & prooflevel(1)) 
 => 
   collinear(C,B_1,O_2))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0090_Midpoint.p; Output: thm_0090_Midpoint.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0090_Midpoint.p; Output: tmp_2_thm_0090_Midpoint.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0090_Midpoint
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,B_1,A_1,M] : ((
   dimensions(80,50)
   & freepoint(A,20,10)
   & freepoint(B,70,10)
   & freepoint(C,35,40)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(B,C)
   & midp(B_1,B,C)
   & midp(A_1,A,C)
   & drawsegment(A_1,B_1)
   & midp(M,A,B)
   & cmark_b(M)
   & drawdashsegment(A_1,M)
   & drawdashsegment(B_1,M)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_lt(A_1)
   & cmark_rt(B_1)
   & prooflevel(1)) 
 => 
   paraNS(A_1,B_1,A,B))).

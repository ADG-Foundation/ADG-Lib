% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0070_Altitude.p; Output: thm_0070_Altitude.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0070_Altitude.p; Output: tmp_2_thm_0070_Altitude.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0070_Altitude
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,A_1,B_1,C_1,H] : ((
   dimensions(100,85)
   & freepoint(A,20,20)
   & freepoint(B,80,20)
   & freepoint(C,60,70)
   & foot(A_1,A,B,C)
   & foot(B_1,B,A,C)
   & foot(C_1,C,A,B)
   & inter(C,C_1,B,B_1,H)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_rt(A_1)
   & cmark_l(B_1)
   & cmark_b(C_1)
   & cmark_lb(H)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(B,C)
   & drawdashsegment(B,B_1)
   & drawdashsegment(A,A_1)
   & drawdashsegment(C,C_1)
   & prooflevel(1)) 
 => 
   collinear(A,H,A_1))).

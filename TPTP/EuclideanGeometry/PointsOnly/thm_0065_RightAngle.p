% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0065_RightAngle.p; Output: thm_0065_RightAngle.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0065_RightAngle.p; Output: tmp_2_thm_0065_RightAngle.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0065_RightAngle
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,O,C] : ((
   dimensions(110,110)
   & freepoint(A,20,55)
   & freepoint(B,90,55)
   & midp(O,A,B)
   & oncircle(C,O,A)
   & cmark_t(C)
   & drawsegment(A,C)
   & drawsegment(B,C)
   & drawcircle(O,A)
   & cmark_l(A)
   & cmark_r(B)
   & drawsegment(A,B)
   & prooflevel(1)) 
 => 
   perpNS(A,C,C,B))).

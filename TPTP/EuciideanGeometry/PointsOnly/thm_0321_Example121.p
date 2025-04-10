% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0321_Example121.p; Output: thm_0321_Example121.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0321_Example121.p; Output: tmp_2_thm_0321_Example121.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0321_Example121
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,P1,E,P2,F] : ((
   dimensions(110,110)
   & freepoint(A,20,35)
   & freepoint(B,90,35)
   & freepoint(C,70,90)
   & freepoint(D,50,20)
   & paraS(P1,A,B,D)
   & inter(P1,A,C,D,E)
   & paraS(P2,E,B,C)
   & inter(A,B,P2,E,F)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(D)
   & cmark_r(E)
   & cmark_rb(F)
   & drawsegment(A,B)
   & drawsegment(C,D)
   & drawsegment(C,B)
   & drawsegment(A,E)
   & drawsegment(E,F)
   & drawdashsegment(A,C)
   & drawdashsegment(D,F)
   & prooflevel(1)) 
 => 
   paraNS(A,C,D,F))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0310_Example110.p; Output: thm_0310_Example110.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0310_Example110.p; Output: tmp_2_thm_0310_Example110.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0310_Example110
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,P1,P2,D1,E,E1,F] : ((
   dimensions(120,110)
   & freepoint(A,20,40)
   & freepoint(B,85,40)
   & freepoint(C,70,90)
   & coll(D,A,C)
   & paraS(P1,B,A,C)
   & paraS(P2,D,A,B)
   & inter(P1,B,P2,D,D1)
   & intersec_cl(E1,E,B,D1,B,C)
   & inter(D,E,A,B,F)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_lt(D)
   & cmark_b(E)
   & cmark_lb(F)
   & drawsegment(A,B)
   & drawsegment(C,E)
   & drawsegment(A,C)
   & drawdashsegment(B,D1)
   & drawdashsegment(D,D1)
   & drawsegment(D,E)
   & prooflevel(1)) 
 => 
   mult(length(F,D),length(A,C)) = mult(length(E,F),length(B,C)))).

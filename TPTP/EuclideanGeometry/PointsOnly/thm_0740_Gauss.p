% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0740_Gauss.p; Output: thm_0740_Gauss.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0740_Gauss.p; Output: tmp_2_thm_0740_Gauss.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0740_Gauss
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A_0,A_1,A_2,A_3,X,Y,M_1,M_2,M_3] : ((
   dimensions(90,80)
   & freepoint(A_0,30,10)
   & freepoint(A_1,70,10)
   & freepoint(A_2,55,40)
   & freepoint(A_3,35,25)
   & inter(A_1,A_2,A_0,A_3,X)
   & inter(A_0,A_1,A_2,A_3,Y)
   & midp(M_1,A_1,A_3)
   & midp(M_2,A_0,A_2)
   & midp(M_3,X,Y)
   & cmark_b(A_0)
   & cmark_b(A_1)
   & cmark_rt(A_2)
   & cmark_l(A_3)
   & cmark_t(X)
   & cmark_b(Y)
   & cmark_b(M_1)
   & cmark_r(M_2)
   & cmark_rt(M_3)
   & drawsegment(A_0,A_1)
   & drawsegment(A_0,A_2)
   & drawsegment(A_0,A_3)
   & drawsegment(A_1,A_2)
   & drawsegment(A_1,A_3)
   & drawsegment(A_2,A_3)
   & drawdashsegment(A_1,X)
   & drawdashsegment(A_3,X)
   & drawdashsegment(A_0,Y)
   & drawdashsegment(A_2,Y)
   & drawline(M_1,M_2)
   & prooflevel(1)) 
 => 
   collinear(M_1,M_2,M_3))).

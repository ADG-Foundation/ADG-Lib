% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0320_Example120.p; Output: thm_0320_Example120.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0320_Example120.p; Output: tmp_2_thm_0320_Example120.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0320_Example120
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,X,P1,P2,Y,Z] : ((
   dimensions(110,100)
   & freepoint(A,50,50)
   & freepoint(B,90,50)
   & freepoint(C,75,80)
   & coll(X,B,C)
   & paraS(P1,C,A,X)
   & paraS(P2,B,A,X)
   & inter(P2,B,A,C,Y)
   & inter(P1,C,A,B,Z)
   & cmark_t(Z)
   & cmark_b(Y)
   & cmark_rt(X)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & drawsegment(Z,B)
   & drawsegment(Y,C)
   & drawsegment(Z,X)
   & drawsegment(A,X)
   & drawsegment(Y,Z)
   & drawsegment(B,C)
   & drawsegment(C,Z)
   & drawsegment(Y,B)
   & drawsegment(X,Y)
   & prooflevel(1)) 
 => 
   mult(2,signed_area3(B,A,C)) = signed_area3(X,Y,Z))).

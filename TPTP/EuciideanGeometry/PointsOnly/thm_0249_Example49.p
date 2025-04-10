% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0249_Example49.p; Output: thm_0249_Example49.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0249_Example49.p; Output: tmp_2_thm_0249_Example49.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0249_Example49
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,Cp,D,F,E,G] : ((
   dimensions(130,80)
   & freepoint(A,20,20)
   & freepoint(B,110,20)
   & freepoint(C,90,50)
   & paraS(P1,C,A,B)
   & translate(Cp,A,B,C)
   & coll(D,C,Cp)
   & inter(A,D,B,C,F)
   & inter(A,C,B,D,E)
   & inter(A,B,E,F,G)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_rt(C)
   & cmark_lt(D)
   & cmark_rb(E)
   & cmark_rt(F)
   & cmark_b(G)
   & drawsegment(A,F)
   & drawsegment(B,F)
   & drawsegment(G,F)
   & drawsegment(A,B)
   & drawsegment(C,D)
   & drawsegment(A,C)
   & drawsegment(B,D)
   & prooflevel(1)) 
 => 
   sratio(A,G,G,B) = 1)).

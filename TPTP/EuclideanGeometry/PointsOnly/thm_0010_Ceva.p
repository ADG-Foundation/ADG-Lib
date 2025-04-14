% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0010_Ceva.p; Output: thm_0010_Ceva.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0010_Ceva.p; Output: tmp_2_thm_0010_Ceva.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0010_Ceva
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P,D,E,F] : ((
   dimensions(100,100)
   & freepoint(A,60,10)
   & freepoint(B,30,90)
   & freepoint(C,80,90)
   & freepoint(P,55,75)
   & inter(B,C,P,A,D)
   & inter(A,C,P,B,E)
   & inter(A,B,P,C,F)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(B,C)
   & drawsegment(A,D)
   & drawsegment(B,E)
   & drawsegment(C,F)
   & cmark_b(A)
   & cmark_t(B)
   & cmark_t(C)
   & cmark_t(D)
   & cmark_l(F)
   & cmark_r(E)
   & cmark_rt(P)
   & prooflevel(1)) 
 => 
   mult(mult(sratio(A,F,F,B),sratio(B,D,D,C)),sratio(C,E,E,A)) = 1)).

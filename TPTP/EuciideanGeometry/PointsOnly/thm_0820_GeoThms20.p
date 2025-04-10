% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0820_GeoThms20.p; Output: thm_0820_GeoThms20.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0820_GeoThms20.p; Output: tmp_2_thm_0820_GeoThms20.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0820_GeoThms20
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,C,T,A_1,C_1,B,X,D,E,F] : ((
   dimensions(110,100)
   & freepoint(A,20,20)
   & freepoint(C,65,80)
   & freepoint(T,55,45)
   & towards(A_1,A,T,1.5)
   & towards(C_1,C,T,1.5)
   & inter(A,C_1,C,A_1,B)
   & freepoint(X,95,45)
   & foot(D,A,T,X)
   & foot(E,B,T,X)
   & foot(F,C,T,X)
   & cmark_t(D)
   & cmark_t(E)
   & cmark_b(F)
   & cmark_lt(T)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(X)
   & drawline(T,X)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(C,B)
   & drawsegment(A,A_1)
   & drawsegment(C,C_1)
   & drawdashsegment(A,D)
   & drawdashsegment(B,E)
   & drawdashsegment(C,F)
   & prooflevel(1)) 
 => 
   sum(sum(sratio(A,D,A,D),sratio(B,E,A,D)),sratio(C,F,A,D)) = 0)).

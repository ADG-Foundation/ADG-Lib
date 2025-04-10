% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0015_Thales.p; Output: thm_0015_Thales.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0015_Thales.p; Output: tmp_2_thm_0015_Thales.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0015_Thales
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ O,A,C,B,P1,D] : ((
   dimensions(80,80)
   & freepoint(O,20,30)
   & freepoint(A,60,30)
   & freepoint(C,40,50)
   & coll(B,O,A)
   & paraS(P1,B,A,C)
   & inter(O,C,P1,B,D)
   & drawline(O,A)
   & drawline(O,C)
   & drawline(A,C)
   & drawline(B,D)
   & cmark_t(O)
   & cmark_t(A)
   & cmark_t(B)
   & cmark_t(C)
   & cmark_t(D)
   & prooflevel(1)) 
 => 
   sratio(O,A,O,B) = sratio(O,C,O,D))).

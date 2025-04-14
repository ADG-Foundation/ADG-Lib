% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0040_Desargues.p; Output: thm_0040_Desargues.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0040_Desargues.p; Output: tmp_2_thm_0040_Desargues.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0040_Desargues
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ S,A_2,B_2,A_1,B_1,A_3,B_3,P,Q,R] : ((
   dimensions(110,90)
   & freepoint(S,20,30)
   & freepoint(A_2,36.6,30)
   & coll(B_2,S,A_2)
   & freepoint(A_1,27.2,24.7)
   & coll(B_1,S,A_1)
   & freepoint(A_3,42.2,41.1)
   & coll(B_3,S,A_3)
   & inter(A_1,A_2,B_1,B_2,P)
   & inter(A_1,A_3,B_1,B_3,Q)
   & inter(A_2,A_3,B_2,B_3,R)
   & drawdashline(P,Q)
   & drawline(A_1,A_2)
   & drawline(A_1,A_3)
   & drawline(A_2,A_3)
   & drawline(B_1,B_2)
   & drawline(B_1,B_3)
   & drawline(B_2,B_3)
   & cmark_t(P)
   & cmark_l(Q)
   & cmark_l(R)
   & cmark_b(A_1)
   & cmark_rb(A_2)
   & cmark_rb(A_3)
   & cmark_b(B_1)
   & cmark_rb(B_2)
   & cmark_rb(B_3)
   & cmark_b(S)
   & drawline(S,A_1)
   & drawline(S,A_2)
   & drawline(S,A_3)
   & prooflevel(1)) 
 => 
   collinear(P,Q,R))).

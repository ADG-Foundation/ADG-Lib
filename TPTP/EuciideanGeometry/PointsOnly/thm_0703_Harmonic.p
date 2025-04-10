% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0703_Harmonic.p; Output: thm_0703_Harmonic.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0703_Harmonic.p; Output: tmp_2_thm_0703_Harmonic.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0703_Harmonic
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,C,D,B,O,A_1,B_1,C_1,D_1] : ((
   dimensions(130,85)
   & freepoint(A,20,20)
   & freepoint(C,40,20)
   & coll(D,A,C)
   & coll(B,A,C)
   & freepoint(O,80,70)
   & coll(A_1,A,O)
   & coll(B_1,B,O)
   & inter(A_1,B_1,C,O,C_1)
   & inter(A_1,B_1,D,O,D_1)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_b(D)
   & cmark_r(O)
   & cmark_rb(A_1)
   & cmark_rb(C_1)
   & cmark_rb(D_1)
   & cmark_rb(B_1)
   & drawsegment(A,B)
   & drawsegment(A,O)
   & drawsegment(B,O)
   & drawsegment(C,O)
   & drawsegment(D,O)
   & drawdashline(A_1,B_1)
   & prooflevel(1)) 
 => 
   mult(sratio(C,A,C,B),sratio(D,B,D,A)) = mult(sratio(C_1,A_1,C_1,B_1),sratio(D_1,B_1,D_1,A_1)))).

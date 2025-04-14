% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0132_Pappus2.p; Output: thm_0132_Pappus2.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0132_Pappus2.p; Output: tmp_2_thm_0132_Pappus2.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0132_Pappus2
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,A_1,B_1,C_1,P,Q,S] : ((
   dimensions(100,100)
   & freepoint(A,20,20)
   & freepoint(B,50,20)
   & coll(C,A,B)
   & freepoint(A_1,25,50)
   & freepoint(B_1,52,60)
   & coll(C_1,A_1,B_1)
   & inter(A,B_1,B,A_1,P)
   & inter(A,C_1,C,A_1,Q)
   & inter(B,C_1,C,B_1,S)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_t(A_1)
   & cmark_t(B_1)
   & cmark_t(C_1)
   & cmark_b(P)
   & cmark_b(Q)
   & cmark_r(S)
   & drawline(A,B)
   & drawline(A_1,B_1)
   & drawdashline(P,Q)
   & drawsegment(A,B_1)
   & drawsegment(A_1,B)
   & drawsegment(A,C_1)
   & drawsegment(A_1,C)
   & drawsegment(C,B_1)
   & drawsegment(C_1,B)
   & prooflevel(1)) 
 => 
   collinear(P,Q,S))).

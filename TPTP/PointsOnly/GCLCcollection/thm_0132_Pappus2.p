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
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Paposova teorema (druga verzija) 
%  thmnamee Pappus' Theorem (second version) 
%  thmtext Neka su $ABC$ i $A_1B_1C_1$ dve prave i neka je 
%  thmtext $P = AB_1 \cap A_1B$, $Q = AC_1 \cap A_1C$ i 
%  thmtext $S = BC_1 \cap B_1C$. 
%  thmtext Dokazati da su $P$, $Q$ i $S$ kolinearne. 
%  thmtexte Let $ABC$ and $A_1B_1C_1$ be two lines and 
%  thmtexte $P = AB_1 \cap A_1B$, $Q = AC_1 \cap A_1C$, 
%  thmtexte $S = BC_1 \cap B_1C$. Then $P$, $Q$ and $S$ 
%  thmtexte are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,A_1,B_1,C_1,P,Q,S] : ((
   dimensions(100, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 50, 20)
   & collinear(C, A, B)
   & freepoint(A_1, 25, 50)
   & freepoint(B_1, 52, 60)
   & collinear(C_1, A_1, B_1)
   & intersection(A, B_1, B, A_1, P)
   & intersection(A, C_1, C, A_1, Q)
   & intersection(B, C_1, C, B_1, S)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_t(A_1)
   & cmark_t(B_1)
   & cmark_t(C_1)
   & cmark_b(P)
   & cmark_b(Q)
   & cmark_r(S)
   & drawline(A, B)
   & drawline(A_1, B_1)
   & drawdashline(P, Q)
   & drawsegment(A, B_1)
   & drawsegment(A_1, B)
   & drawsegment(A, C_1)
   & drawsegment(A_1, C)
   & drawsegment(C, B_1)
   & drawsegment(C_1, B)
   & prooflevel(1)) 
 => 
   collinear(P, Q, S))).

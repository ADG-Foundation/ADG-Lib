% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0258_Example58.p; Output: thm_0258_Example58.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0258_Example58.p; Output: tmp_2_thm_0258_Example58.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0258_Example58
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 58 iz \cite{chou} 
%  thmnamee Example 58 from \cite{chou} 
%  thmtext Dat je trougao $ABC$. Neka je $C_1$ ta\ch ka 
%  thmtext na stranici $AB$ koja deli tu stranicu u 
%  thmtext odnosu $1:2$. Na sli\ch an na\ch in konstruisane 
%  thmtext su i ta\ch ke $A_1$ i $B_1$ na stranicama $BC$ 
%  thmtext i $CA$. Neka su dalje $A_2 = BB_1 \cap CC_1$, 
%  thmtext $B_2 = AA_1 \cap CC_1$ i $C_2 = AA_1 \cap BB_1$. 
%  thmtext Dokazati da je povr\sh ina trougla $ABC$ sedam 
%  thmtext puta ve\cj a od povr\sh ine trougla $A_2B_2C_2$. 
%  thmtexte Let $A_1$, $B_1$, $C_1$ be points on the sides 
%  thmtexte $BC$, $CA$, $AB$ of a triangle $ABC$ such that 
%  thmtexte $BA_1/BC = CB_1/CA_1 = AC_1/AB = 1/3$. Show 
%  thmtexte that the area of the triangle determined by lines 
%  thmtexte $AA_1$, $BB_1$ and $CC_1$ is one seventh of the area 
%  thmtexte of triangle $ABC$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C_1,C,A_1,B_1,A_2,B_2,C_2] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & towards(C_1, A, B, 0.333333)
   & freepoint(C, 70, 80)
   & towards(A_1, B, C, 0.333333)
   & towards(B_1, C, A, 0.333333)
   & intersection(B, B_1, C, C_1, A_2)
   & intersection(A, A_1, C, C_1, B_2)
   & intersection(A, A_1, B, B_1, C_2)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C_1)
   & cmark_r(C)
   & cmark_r(A_1)
   & cmark_lt(B_1)
   & cmark_b(C_2)
   & cmark_rb(B_2)
   & cmark_r(A_2)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, C_1)
   & drawsegment(A, A_1)
   & drawsegment(B, B_1)
   & prooflevel(1)) 
 => 
   signed_area3(A, B, C) = mult(7, signed_area3(A_2, B_2, C_2)))).

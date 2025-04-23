% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0257_Example57.p; Output: thm_0257_Example57.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0257_Example57.p; Output: tmp_2_thm_0257_Example57.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0257_Example57
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 57 iz \cite{chou} 
%  thmnamee Example 57 from \cite{chou} 
%  thmtext Dat je paralelogram $ABCD$. Neka je $C_1$ ta\ch ka 
%  thmtext na stranici $AB$ koja deli tu stranicu u 
%  thmtext odnosu $1:2$. Na sli\ch an na\ch in konstruisane 
%  thmtext su i ta\ch ke $D_1$, $A_1$ i $B_1$ na stranicama $BC$,  
%  thmtext $CD$ i $DA$. Neka su dalje $A_2 = AA_1 \cap DD_1$, 
%  thmtext $B_2 = BB_1 \cap CC_1$, $C_2 = CC_1 \cap DD_1$ i 
%  thmtext $D_2 = DD_1 \cap AA_1$. 
%  thmtext Dokazati da je povr\sh ina \ch etvorougla $ABCD$ trinaest 
%  thmtext puta ve\cj a od povr\sh ine \ch etvorougla $A_2B_2C_2D_2$. 
%  thmtexte Let $A_1$, $B_1$, $C_1$, $D_1$ be points on the sides $CD$, 
%  thmtexte $DA$, $AB$, $BC$ of a parallelogram $ABCD$ such that $CA_1/CD = DB_1/DA = AC_1/AB = BD_1/BC = 1/3$. 
%  thmtexte Show that the area of the quadrilateral formed by the lines 
%  thmtexte $AA_1$, $BB_1$, $CC_1$, $DD_1$ is one thirteenth of the area of 
%  thmtexte parallelogram $ABCD$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,D,C_1,D_1,A_1,B_1,A_2,B_2,C_2,D_2] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 110, 80)
   & parallel(P1, A, B, C)
   & parallel(P2, C, A, B)
   & intersection(P1, A, P2, C, D)
   & towards(C_1, A, B, 0.333333)
   & towards(D_1, B, C, 0.333333)
   & towards(A_1, C, D, 0.333333)
   & towards(B_1, D, A, 0.333333)
   & intersection(A, A_1, B, B_1, A_2)
   & intersection(B, B_1, C, C_1, B_2)
   & intersection(D, D_1, C, C_1, C_2)
   & intersection(A, A_1, D, D_1, D_2)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C_1)
   & cmark_t(C)
   & cmark_t(A_1)
   & cmark_lt(B_1)
   & cmark_b(C_2)
   & cmark_b(B_2)
   & cmark_b(A_2)
   & cmark_t(D)
   & cmark_b(D_2)
   & cmark_r(D_1)
   & drawsegment(A, B)
   & drawsegment(B, C)
   & drawsegment(C, D)
   & drawsegment(A, D)
   & drawsegment(C, C_1)
   & drawsegment(A, A_1)
   & drawsegment(B, B_1)
   & drawsegment(D, D_1)
   & prooflevel(1)) 
 => 
   signed_area4(A, B, C, D) = mult(13, signed_area4(A_2, B_2, C_2, D_2)))).

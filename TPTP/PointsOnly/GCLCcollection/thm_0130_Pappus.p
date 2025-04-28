% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0130_Pappus.p; Output: thm_0130_Pappus.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0130_Pappus.p; Output: tmp_2_thm_0130_Pappus.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0130_Pappus
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Paposova teorema 
%  thmnamee Pappus' Theorem 
%  thmtext Data je prava $p$ sa ta\ch kama 
%  thmtext $A$, $B$ i $C$, i ta\ch ke $A_1$ i $A_2$ van 
%  thmtext prave $p$. Neka je $B_1$ presek prave 
%  thmtext $A_1A_2$ sa pravom koja sadr\zh i $A$ 
%  thmtext i paralelna je sa $A_1B$. Neka je $C_1$ 
%  thmtext presek prave $A_1A_2$ sa pravom koja 
%  thmtext sard\zh i $B$ i paralelna je sa $CB_1$. 
%  thmtext Dokazati da je $AC_1$ paralelna sa $CA_1$. 
%  thmtexte Let $ABC$ and $A_1B_1C_1$ be two lines such that 
%  thmtexte $AB_1 \parallel BA_1$ and $BC_1 \parallel CB_1$. 
%  thmtexte Show that $AC_1 \parallel CA_1$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,A_1,A_2,A_1A_2,A_1B,P1,B_1,CB_1,P2,C_1] : ((
   dimensions(100, 80)
   & freepoint(A, 20, 10)
   & freepoint(B, 90, 10)
   & collinear(C, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & freepoint(A_1, 55, 50)
   & freepoint(A_2, 45, 43)
   & newline(A_1A_2, A_1, A_2)
   & newline(A_1B, A_1, B)
   & parallel(P1, A, A_1, B)
   & intersection(B_1, A_1, A_2, P1, A)
   & newline(CB_1, C, B_1)
   & parallel(P2, B, C, B_1)
   & intersection(C_1, A_1, A_2, P2, B)
   & cmark_lt(A_1)
   & cmark_lt(B_1)
   & cmark_lt(C_1)
   & drawline(A, C)
   & drawline(A_1, C_1)
   & drawsegment(A, B_1)
   & drawsegment(B, A_1)
   & drawsegment(B, C_1)
   & drawsegment(C, B_1)
   & drawsegment(A, C_1)
   & drawsegment(C, A_1)
   & prooflevel(1)) 
 => 
   parallel(A_1, C, A, C_1))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0140_PappusDual.p; Output: thm_0140_PappusDual.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0140_PappusDual.p; Output: tmp_2_thm_0140_PappusDual.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0140_PappusDual
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Dualna Paposova teorema 
%  thmnamee Pappus' Dual Theorem 
%  thmtext U ravni su date ta\ch ke $O$, $A$, 
%  thmtext $B$, $C$ i $O_1$. Ta\ch ke $A_1$, 
%  thmtext $B_1$, $C_1$ i $I$ su konstruisane 
%  thmtext kao preseci parova pravih: $O_1B$ i 
%  thmtext $OC$, $OA$ i $O_1C$, $OB$ i $O_1A$, 
%  thmtext $BB_1$ i $AA_1$. Dokazati da su 
%  thmtext ta\ch ke $C$, $C_1$ i $I$ kolinearne. 
%  thmtexte Given points $O$, $A$, $B$, $C$ and $O_1$ 
%  thmtexte new points are constructed as: 
%  thmtexte $A_1 = O_1B \cap OC$, $B_1 = OA \cap O_1C$, 
%  thmtexte $C_1 = OB \cap O_1A$, $I = BB_1 \cap AA_1$. 
%  thmtexte Show that points $C$, $C_1$ and $I$ are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ O,A,B,C,O_1,A_1,B_1,C_1,I] : ((
   dimensions(130, 130)
   & freepoint(O, 25.8, 48.3)
   & freepoint(A, 95.2, 55)
   & freepoint(B, 120.1, 91.6)
   & freepoint(C, 44.5, 112.7)
   & freepoint(O_1, 62.4, 56.8)
   & intersection(O_1, B, O, C, A_1)
   & intersection(O, A, O_1, C, B_1)
   & intersection(O, B, O_1, A, C_1)
   & intersection(B, B_1, A, A_1, I)
   & drawdashline(C, I)
   & cmark_b(A_1)
   & cmark_rb(B_1)
   & cmark_lt(C_1)
   & cmark_rb(I)
   & cmark_l(O)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_l(C)
   & cmark_lt(O_1)
   & drawsegment(A_1, C)
   & drawsegment(O, B)
   & drawsegment(O, A)
   & drawsegment(A, C_1)
   & drawsegment(A_1, B)
   & drawsegment(C, B_1)
   & drawdashsegment(A_1, A)
   & drawdashsegment(I, B)
   & prooflevel(1)) 
 => 
   collinear(C, C_1, I))).

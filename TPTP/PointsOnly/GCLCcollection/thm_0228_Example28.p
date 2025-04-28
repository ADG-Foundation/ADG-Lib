% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0228_Example28.p; Output: thm_0228_Example28.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0228_Example28.p; Output: tmp_2_thm_0228_Example28.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0228_Example28
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 28 iz \cite{chou} 
%  thmnamee Example 28 from \cite{chou} 
%  thmtext Kod \sh estougla $AC_1BA_1CB_1$ trojka pravih 
%  thmtext $BB_1$, $C_1A$ i $A_1C$ je konkurentna, kao i 
%  thmtext trojka pravih $CC_1$, $A_1B$ i $B_1A$. Dokazati 
%  thmtext da je i trojka pravih $AA_1$, $B_1C$ i $C_1B$ 
%  thmtext tako\dj e konkurentna. 
%  thmnote Po\sh to dokazujemo teoreme konstruktivnog tipa, 
%  thmnote a ne opisnog, ova opisna teorema mora biti iskazana 
%  thmnote u konstruktivnom tipu. Prvo \cj e biti konstruisan 
%  thmnote \sh estougao koji zadovoljava svojstva iz zadatka, 
%  thmnote i potom \cj e na njemu biti dokazana teorema. 
%  thmtexte In a hexagon $AC_1BA_1CB_1$, $BB_1$, $C_1A$, 
%  thmtexte $A_1C$ are concurrent and $CC_1$, $A_1B$, $B_1A$ 
%  thmtexte are concurrent. Prove that $AA_1$, $B_1C$, $C_1B$ 
%  thmtexte are also concurrent. 

include('geo.ax').
fof(thm, conjecture, ! [ A,C_1,B,A_1,C,ac1,a1c,O,ba1,cc1,H,ah,bo,B_1,cb1,bc1,I] : ((
   dimensions(110, 90)
   & freepoint(A, 30, 20)
   & freepoint(C_1, 58, 20)
   & freepoint(B, 20, 37)
   & freepoint(A_1, 37, 50)
   & freepoint(C, 60, 35)
   & newline(ac1, A, C_1)
   & newline(a1c, A_1, C)
   & intersection(O, A, C_1, A_1, C)
   & newline(ba1, B, A_1)
   & newline(cc1, C, C_1)
   & intersection(H, B, A_1, C, C_1)
   & newline(ah, A, H)
   & newline(bo, B, O)
   & intersection(B_1, B, O, A, H)
   & newline(cb1, C, B_1)
   & newline(bc1, B, C_1)
   & intersection(I, C, B_1, B, C_1)
   & cmark_rb(B_1)
   & cmark_t(H)
   & cmark_rb(A)
   & cmark_b(C_1)
   & cmark_lb(B)
   & cmark_lt(A_1)
   & cmark_rt(C)
   & cmark_b(O)
   & drawsegment(B, H)
   & drawsegment(A, H)
   & drawsegment(C_1, H)
   & drawsegment(A, O)
   & drawsegment(B, O)
   & drawsegment(A_1, O)
   & drawsegment(A, B)
   & drawsegment(B, C)
   & drawdashline(C, B_1)
   & drawdashline(B, C_1)
   & drawdashline(A, A_1)
   & prooflevel(1)) 
 => 
   collinear(A, A_1, I))).

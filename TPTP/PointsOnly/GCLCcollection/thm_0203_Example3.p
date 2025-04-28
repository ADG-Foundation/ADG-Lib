% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0203_Example3.p; Output: thm_0203_Example3.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0203_Example3.p; Output: tmp_2_thm_0203_Example3.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0203_Example3
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 3 iz \cite{chou} 
%  thmnamee Example 3 from \cite{chou} 
%  thmtext Date su tri kolinearne ta\ch ke $A$, $B$ i $C$ 
%  thmtext i ta\ch ke $D$ i $E$ van prave $AB$. Ta\ch ke 
%  thmtext $J$, $G$, $K$, $I$, $L$, $H$ i $F$ su konstruisane 
%  thmtext kao redom preseci parova pravih: $AE$ i $CD$, 
%  thmtext $AD$ i $BE$, $BD$ i $EC$, $AE$ i $BD$, $CD$ i $BE$, 
%  thmtext $EC$ i $AD$ i na kraju $DE$ i $AB$. Neka je dalje 
%  thmtext $O$ presek pravih $JH$ i $IG$. Dokazati da su 
%  thmtext ta\ch ke $O$, $E$ i $D$ kolinearne, kao i da 
%  thmtext su ta\ch ke $O$, $L$ i $K$ tako\dj e kolinearne. 
%  thmtexte Starting from five points $A$, $B$, $C$, $D$ and $E$ 
%  thmtexte with $A$, $B$, $C$ collinear, new lines and points 
%  thmtexte of intersection are formed. $ED$, $IG$, $LK$ and $JH$ 
%  thmtexte are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,ab,C,D,E,ae,cd,ad,be,bd,ec,de,J,G,K,I,L,H,F,jh,ig,O,oed,olk] : ((
   dimensions(100, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 55, 20)
   & newline(ab, A, B)
   & collinear(C, A, B)
   & freepoint(D, 40.2, 47.2)
   & freepoint(E, 53.3, 37.5)
   & newline(ae, A, E)
   & newline(cd, C, D)
   & newline(ad, A, D)
   & newline(be, B, E)
   & newline(bd, B, D)
   & newline(ec, E, C)
   & newline(de, D, E)
   & intersection(J, A, E, C, D)
   & intersection(G, A, D, B, E)
   & intersection(K, B, D, E, C)
   & intersection(I, A, E, B, D)
   & intersection(L, C, D, B, E)
   & intersection(H, E, C, A, D)
   & intersection(F, D, E, A, B)
   & newline(jh, J, H)
   & newline(ig, I, G)
   & intersection(O, J, H, I, G)
   & cmark_rb(A)
   & cmark_b(B)
   & cmark_lb(C)
   & cmark_t(D)
   & cmark_rb(E)
   & cmark_lb(J)
   & cmark_lt(G)
   & cmark_r(K)
   & cmark_b(I)
   & cmark_r(L)
   & cmark_rb(H)
   & cmark_b(F)
   & cmark_r(O)
   & newline(oed, O, E)
   & newline(olk, O, L)
   & drawline(O, E)
   & drawline(O, L)
   & drawdashline(A, B)
   & drawdashline(A, E)
   & drawdashline(C, D)
   & drawdashline(A, D)
   & drawdashline(E, C)
   & drawdashsegment(I, G)
   & drawdashsegment(J, H)
   & prooflevel(1)) 
 => 
   collinear(O, E, D))).

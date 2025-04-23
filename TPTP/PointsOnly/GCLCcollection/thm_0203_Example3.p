% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0203_Example3.p; Output: thm_0203_Example3.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0203_Example3.p; Output: tmp_2_thm_0203_Example3.p; Arg: [-l]
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
fof(thm, conjecture, ! [ A,B,C,D,E,J,G,K,I,L,H,F,O] : ((
   dimensions(100, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 55, 20)
   & collinear(C, A, B)
   & freepoint(D, 40.2, 47.2)
   & freepoint(E, 53.3, 37.5)
   & intersection(A, E, C, D, J)
   & intersection(A, D, B, E, G)
   & intersection(B, D, E, C, K)
   & intersection(A, E, B, D, I)
   & intersection(C, D, B, E, L)
   & intersection(E, C, A, D, H)
   & intersection(D, E, A, B, F)
   & intersection(J, H, I, G, O)
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

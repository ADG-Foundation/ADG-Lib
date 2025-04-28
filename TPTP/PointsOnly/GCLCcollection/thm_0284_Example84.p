% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0284_Example84.p; Output: thm_0284_Example84.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0284_Example84.p; Output: tmp_2_thm_0284_Example84.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0284_Example84
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 84 iz \cite{chou} 
%  thmnamee Example 84 from \cite{chou} 
%  thmtext Prava koja prolazi kroz presek dijagonala paralelograma 
%  thmtext $ABCD$ se\ch e prave odre\dj ene stranicama paralelograma 
%  thmtext u ta\ch kama $E$, $F$, $G$ i $H$. Dokazati da je 
%  thmtext $EF \cong GH$. 
%  thmtexte A line passing through the intersection $O$ of the 
%  thmtexte diagonals of parallelogram $ABCD$ meets the four sides 
%  thmtexte at $E$, $F$, $G$, $H$. Show that $EF \cong GH$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,ab,bc,P1,P2,D,H,bd,ac,O,oh,F,G,E] : ((
   dimensions(130, 110)
   & freepoint(A, 30, 30)
   & freepoint(B, 110, 30)
   & freepoint(C, 90, 80)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & parallel(P1, C, A, B)
   & parallel(P2, A, B, C)
   & intersection(D, P1, C, P2, A)
   & collinear(H, B, C)
   & newline(bd, B, D)
   & newline(ac, A, C)
   & intersection(O, A, C, B, D)
   & newline(oh, O, H)
   & intersection(F, O, H, P1, C)
   & intersection(G, O, H, A, B)
   & intersection(E, O, H, P2, A)
   & cmark_lb(A)
   & cmark_b(B)
   & cmark_r(C)
   & cmark_t(D)
   & cmark_lt(F)
   & cmark_b(O)
   & cmark_l(H)
   & cmark_r(E)
   & drawsegment(A, B)
   & drawsegment(H, B)
   & drawsegment(C, D)
   & drawsegment(E, D)
   & drawsegment(E, H)
   & drawsegment(A, C)
   & drawsegment(B, D)
   & prooflevel(1)) 
 => 
   sratio(E, F, G, H) = 1)).

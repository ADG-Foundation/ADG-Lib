% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0304_Example104.p; Output: thm_0304_Example104.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0304_Example104.p; Output: tmp_2_thm_0304_Example104.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0304_Example104
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 104 iz \cite{chou} 
%  thmnamee Example 104 from \cite{chou} 
%  thmtext Neka je $E$ ta\ch ka na krugu opisanom oko 
%  thmtext jednakostrani\ch nog trougla $ABC$. Ako je $D$ 
%  thmtext presek pravih $BC$ i $AE$, dokazati da je 
%  thmtext $BE \cdot CE = ED \cdot EA$. 
%  thmtexte Let $E$ be a point on the circumcircle of 
%  thmtexte equilateral triangle $ABC$. $D = BC \cap AE$. 
%  thmtexte Show that $BE \cdot CE = ED \cdot EA$. 

include('geo.ax').
fof(thm, conjecture, ! [ B,C,kb,P11,P22,A1,A,P13,P24,O,k,E,Ep,ae,bc,D] : ((
   dimensions(110, 110)
   & freepoint(B, 20, 30)
   & freepoint(C, 90, 30)
   & newcircle(kb, B, C)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & intersection_cl(A, A1, B, C, P11, P22)
   & midpoint(P13, B, A)
   & on_segment_bisector(P24, B, A)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, B)
   & freepoint(E, 79.44, 18.02)
   & on_circle(Ep, O, B)
   & newline(ae, A, E)
   & newline(bc, B, C)
   & intersection(D, B, C, A, E)
   & cmark_lb(D)
   & cmark_b(E)
   & cmark_b(O)
   & cmark_lb(B)
   & cmark_rb(C)
   & cmark_t(A)
   & drawsegment(A, E)
   & drawsegment(B, E)
   & drawsegment(C, E)
   & drawcircle(O, B)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & prooflevel(1)) 
 => 
   mult(length(B, E), length(C, E)) = mult(length(E, D), length(E, A)))).

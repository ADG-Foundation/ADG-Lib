% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0229_Example29.p; Output: thm_0229_Example29.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0229_Example29.p; Output: tmp_2_thm_0229_Example29.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0229_Example29
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 29 iz \cite{chou} 
%  thmnamee Example 29 from \cite{chou} 
%  thmtext U ravni je dat trougao $ABC$. Krugovi $k_1$ i $k_2$ 
%  thmtext sadr\zh e teme $A$ i dodiruju pravu $BC$ u temenima 
%  thmtext $B$ i $C$ redom. Ako su $p$ i $q$ polupre\ch nici 
%  thmtext krugova $k_1$ i $k_2$, dokazati da je $pq = R^2$,  
%  thmtext gde je $R$ polupre\ch nik opisanog kruga trougla $ABC$. 
%  thmnote Prvo su konstruisani krugovi $k_1$ i $k_2$ sa centrima 
%  thmnote $P$ i $Q$. 
%  thmtexte In a triangle $ABC$, let $p$ and $q$ be the radii of two 
%  thmtexte circles through $A$, touching side $BC$ at $B$ and $C$, 
%  thmtexte respectively. Then $pq = R^2$. 

include('geo.ax').
fof(thm, conjecture, ! [ B,C,A,P11,P22,P13,P24,O,bc,P5,P16,P27,P,P8,Q,k1,k2] : ((
   dimensions(90, 90)
   & freepoint(B, 20, 20)
   & freepoint(C, 70, 20)
   & freepoint(A, 55, 60)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & midpoint(P13, A, C)
   & on_segment_bisector(P24, A, C)
   & intersection(O, P11, P22, P13, P24)
   & newline(bc, B, C)
   & perpendicular(P5, B, B, C)
   & midpoint(P16, A, B)
   & on_segment_bisector(P27, A, B)
   & intersection(P, P5, B, P16, P27)
   & perpendicular(P8, C, B, C)
   & intersection(Q, P13, P24, P8, C)
   & newcircle(k1, Q, A)
   & newcircle(k2, P, A)
   & drawcircle(Q, A)
   & drawcircle(P, A)
   & cmark_t(P)
   & cmark_t(Q)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_t(A)
   & cmark_t(O)
   & drawsegment(P, B)
   & drawsegment(P, A)
   & drawsegment(Q, C)
   & drawsegment(Q, A)
   & drawdashsegment(O, B)
   & drawdashsegment(O, C)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, C)
   & prooflevel(1)) 
 => 
   mult(length(Q, C), length(P, B)) = mult(length(O, B), length(O, B)))).

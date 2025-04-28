% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0235_Example35.p; Output: thm_0235_Example35.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0235_Example35.p; Output: tmp_2_thm_0235_Example35.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0235_Example35
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 35 iz \cite{chou} 
%  thmnamee Example 35 from \cite{chou} 
%  thmtext Neka je $ABC$ jednakostrani\ch ni trougao upisan 
%  thmtext u krug sa centrom $O$, i neka je $P$ proizvoljna ta\ch ka na krugu. Dokazati 
%  thmtext da Simsonova linija iz ta\ch ke $P$ polovi polupre\ch nik $PO$. 
%  thmtexte Let $ABC$ be an equilateral triangle inscribed in a circle 
%  thmtexte with center $O$, and let $P$ be any point on the circle. 
%  thmtexte Then the Simson line of $P$ bisects the radius $OP$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,k1,P11,P22,C1,C,P13,P24,O,k,Pp,P,cb,ac,D,E,de,po,I] : ((
   dimensions(130, 110)
   & freepoint(A, 30, 30)
   & freepoint(B, 100, 30)
   & newcircle(k1, A, B)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & intersection_cl(C, C1, A, B, P11, P22)
   & midpoint(P13, A, C)
   & on_segment_bisector(P24, A, C)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, A)
   & on_circle(Pp, O, A)
   & freepoint(P, 105.25, 53.81)
   & newline(cb, C, B)
   & newline(ac, A, C)
   & foot(D, P, C, B)
   & foot(E, P, A, C)
   & newline(de, D, E)
   & newline(po, P, O)
   & intersection(I, P, O, D, E)
   & cmark_b(I)
   & drawline(D, E)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(O)
   & cmark_r(P)
   & cmark_rt(D)
   & cmark_l(E)
   & drawdashsegment(P, O)
   & drawcircle(O, A)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & prooflevel(1)) 
 => 
   sratio(O, I, I, P) = 1)).

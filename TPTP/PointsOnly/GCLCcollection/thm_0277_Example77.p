% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0277_Example77.p; Output: thm_0277_Example77.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0277_Example77.p; Output: tmp_2_thm_0277_Example77.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0277_Example77
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 77 iz \cite{chou} 
%  thmnamee Example 77 from \cite{chou} 
%  thmtext Harmonijska spregnutost \ch etiri ta\ch ake 
%  thmtext na krugu je jednaka u odnosu na svaku ta\ch ku kruga. 
%  thmtexte The cross ratio of four points on a circles 
%  thmtexte with respect to any points on the circle 
%  thmtexte is constant. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P11,P22,P13,P24,O,k,Dp,Pp,Qp,D,P,Q,pdp,pcp,qdp,qcp,ab,Fp,Gp,F_1p,G_1p,pd,pc,qd,qc,F,G,F_1,G_1] : ((
   dimensions(130, 100)
   & freepoint(A, 30, 30)
   & freepoint(B, 100, 30)
   & freepoint(C, 90, 80)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & midpoint(P13, B, C)
   & on_segment_bisector(P24, B, C)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, A)
   & on_circle(Dp, O, A)
   & on_circle(Pp, O, A)
   & on_circle(Qp, O, A)
   & freepoint(D, 41.6, 81.2)
   & freepoint(P, 46.1, 14.2)
   & freepoint(Q, 84.9, 14.7)
   & newline(pdp, Pp, Dp)
   & newline(pcp, Pp, C)
   & newline(qdp, Qp, Dp)
   & newline(qcp, Qp, C)
   & newline(ab, A, B)
   & intersection(Fp, Pp, Dp, A, B)
   & intersection(Gp, Pp, C, A, B)
   & intersection(F_1p, Qp, Dp, A, B)
   & intersection(G_1p, Qp, C, A, B)
   & newline(pd, P, D)
   & newline(pc, P, C)
   & newline(qd, Q, D)
   & newline(qc, Q, C)
   & intersection(F, P, D, A, B)
   & intersection(G, P, C, A, B)
   & intersection(F_1, Q, D, A, B)
   & intersection(G_1, Q, C, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_rt(C)
   & cmark_lt(D)
   & cmark_lb(P)
   & cmark_rb(Q)
   & cmark_r(O)
   & cmark_lb(F)
   & cmark_rb(G)
   & cmark_lb(F_1)
   & cmark_rb(G_1)
   & drawsegment(A, B)
   & drawsegment(A, D)
   & drawsegment(A, C)
   & drawsegment(B, D)
   & drawsegment(B, C)
   & drawsegment(P, D)
   & drawsegment(P, C)
   & drawsegment(Q, D)
   & drawsegment(Q, C)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   mult(sratio(G, A, G, B), sratio(F, B, F, A)) = mult(sratio(G_1, A, G_1, B), sratio(F_1, B, F_1, A)))).

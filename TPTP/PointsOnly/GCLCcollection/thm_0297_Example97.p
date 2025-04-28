% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0297_Example97.p; Output: thm_0297_Example97.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0297_Example97.p; Output: tmp_2_thm_0297_Example97.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0297_Example97
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 97 iz \cite{chou} 
%  thmnamee Example 97 from \cite{chou} 
%  thmtext Neka je $G$ ta\ch ka na krugu $k$ sa centrom 
%  thmtext $O$ i pre\ch nikom $BC$ i neka je $A$ 
%  thmtext sredina luka $BG$ istoga kruga. Ta\ch ka $D$ 
%  thmtext je podno\zh je normale spu\sh tene iz $A$ 
%  thmtext na pre\ch nik $BC$. Neka su dalje 
%  thmtext $E = AD \cap BG$ i 
%  thmtext $F = AC \cap BG$. Dokazati da je 
%  thmtext $AE \cong BE \cong EF$. 
%  thmtexte Let $G$ be a point on the circle $(O)$ with 
%  thmtexte diameter $BC$, $A$ be the midpoint of the arc 
%  thmtexte $BG$. $AD \perp BC$. $E = AD \cap BG$ and 
%  thmtexte $F = AC \cap BG$. Show that 
%  thmtexte $AE \cong BE \cong EF$. 

include('geo.ax').
fof(thm, conjecture, ! [ B,C,O,k,Gp,G,P11,P22,A_1,A,b,P3,g,o,c,E,D,M,F] : ((
   dimensions(100, 100)
   & freepoint(B, 10, 50)
   & freepoint(C, 90, 50)
   & midpoint(O, B, C)
   & newcircle(k, O, B)
   & on_circle(Gp, O, B)
   & freepoint(G, 55.3, 89.65)
   & midpoint(P11, B, G)
   & on_segment_bisector(P22, B, G)
   & intersection_cl(A, A_1, O, B, P11, P22)
   & newline(b, B, C)
   & perpendicular(P3, A, B, C)
   & newline(g, B, G)
   & newline(o, A, O)
   & newline(c, A, C)
   & intersection(E, P3, A, B, G)
   & intersection(D, P3, A, B, C)
   & intersection(M, B, G, A, O)
   & intersection(F, B, G, A, C)
   & cmark_rb(E)
   & cmark_l(B)
   & cmark_r(C)
   & cmark_b(O)
   & cmark_b(D)
   & cmark_b(M)
   & cmark_lt(A)
   & cmark_rt(G)
   & cmark_t(F)
   & drawcircle(O, B)
   & drawsegment(B, C)
   & drawsegment(B, G)
   & drawsegment(A, D)
   & drawsegment(A, O)
   & drawsegment(A, C)
   & prooflevel(1)) 
 => 
   length(A, E) = length(B, E))).
fof(thm, conjecture, ! [ B,C,O,k,Gp,G,P11,P22,A_1,A,b,P3,g,o,c,E,D,M,F] : ((
   dimensions(100, 100)
   & freepoint(B, 10, 50)
   & freepoint(C, 90, 50)
   & midpoint(O, B, C)
   & newcircle(k, O, B)
   & on_circle(Gp, O, B)
   & freepoint(G, 55.3, 89.65)
   & midpoint(P11, B, G)
   & on_segment_bisector(P22, B, G)
   & intersection_cl(A, A_1, O, B, P11, P22)
   & newline(b, B, C)
   & perpendicular(P3, A, B, C)
   & newline(g, B, G)
   & newline(o, A, O)
   & newline(c, A, C)
   & intersection(E, P3, A, B, G)
   & intersection(D, P3, A, B, C)
   & intersection(M, B, G, A, O)
   & intersection(F, B, G, A, C)
   & cmark_rb(E)
   & cmark_l(B)
   & cmark_r(C)
   & cmark_b(O)
   & cmark_b(D)
   & cmark_b(M)
   & cmark_lt(A)
   & cmark_rt(G)
   & cmark_t(F)
   & drawcircle(O, B)
   & drawsegment(B, C)
   & drawsegment(B, G)
   & drawsegment(A, D)
   & drawsegment(A, O)
   & drawsegment(A, C)
   & prooflevel(1)
   & prooflevel(1)) 
 => 
   sratio(B, E, E, F) = 1)).

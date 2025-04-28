% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0308_Example108.p; Output: thm_0308_Example108.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0308_Example108.p; Output: tmp_2_thm_0308_Example108.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0308_Example108
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 108 iz \cite{chou} 
%  thmnamee Example 108 from \cite{chou} 
%  thmtext Oko jednakokrakog trougla $ABC$ ($AC \cong BC$) 
%  thmtext je opisan krug sa centrom $O$. Neka je $D$ ta\ch ka 
%  thmtext na krugu i neka je $E = AB \cap CD$. Dokazati da je: 
%  thmtext $CA^2 = CE \cdot CD$. 
%  thmtexte Let $C$ be the midpoint of the arc $AB$ 
%  thmtexte of circle $(O)$. $D$ is a point on the circle. 
%  thmtexte $E = AB \cap CD$. Show that: 
%  thmtexte $CA^2 = CE \cdot CD$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,X,ab,ax,P11,P22,O,M,k,C1,C,D,Dp,cd,E] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(X, 25, 34)
   & newline(ab, A, B)
   & newline(ax, A, X)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & intersection(O, P11, P22, A, X)
   & intersection(M, P11, P22, A, B)
   & newcircle(k, O, A)
   & intersection_cl(C, C1, O, A, P11, P22)
   & freepoint(D, 39.67, 15.88)
   & on_circle(Dp, O, A)
   & newline(cd, C, D)
   & intersection(E, A, B, C, D)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_r(O)
   & cmark_b(M)
   & cmark_lb(D)
   & cmark_lt(E)
   & drawcircle(O, A)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, C)
   & drawsegment(C, M)
   & drawsegment(C, D)
   & prooflevel(1)) 
 => 
   mult(length(C, A), length(C, A)) = mult(length(C, E), length(C, D)))).

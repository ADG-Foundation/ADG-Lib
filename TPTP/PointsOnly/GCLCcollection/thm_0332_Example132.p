% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0332_Example132.p; Output: thm_0332_Example132.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0332_Example132.p; Output: tmp_2_thm_0332_Example132.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0332_Example132
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 132 iz \cite{chou} 
%  thmnamee Example 132 from \cite{chou} 
%  thmtext Neka je $M$ sredi\sh te tetive $AB$ kruga sa centrom $O$. 
%  thmtext Nad $OM$ kao pre\ch nikom nacrtan je novi krug sa centrom $N$. 
%  thmtext Neka je $T$ proizvoljna ta\ch ka na novom krugu i neka tangenta 
%  thmtext iz $T$ drugog kruga se\ch e prvi krug u ta\ch ki $E$. 
%  thmtext Dokazati da je: 
%  thmtext $AE^2 + BE^2 = 4ET^2$. 
%  thmtexte Let $M$ be the midpoint of chord $AB$ of a circle 
%  thmtexte with center $O$. On $OM$ as diameter draw another 
%  thmtexte circle, and at any point $T$ of this circle 
%  thmtexte draw a tangent to it meeting the outer circle in $E$. 
%  thmtexte Prove that: 
%  thmtexte $AE^2 + BE^2 = 4ET^2$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,P11,P22,X,ax,O,ab,M,k,N,k1,T,Tp,tn,P3,E1,E] : ((
   dimensions(110, 110)
   & freepoint(A, 30, 30)
   & freepoint(B, 80, 30)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & freepoint(X, 35, 34)
   & newline(ax, A, X)
   & intersection(O, A, X, P11, P22)
   & newline(ab, A, B)
   & intersection(M, P11, P22, A, B)
   & newcircle(k, O, A)
   & midpoint(N, O, M)
   & newcircle(k1, N, M)
   & freepoint(T, 45.46, 37.01)
   & on_circle(Tp, N, M)
   & newline(tn, T, N)
   & perpendicular(P3, T, T, N)
   & intersection_cl(E, E1, O, A, P3, T)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_lt(O)
   & cmark_b(M)
   & cmark_r(N)
   & cmark_lb(T)
   & cmark_lt(E)
   & drawsegment(A, B)
   & drawsegment(A, E)
   & drawsegment(E, B)
   & drawsegment(O, M)
   & drawsegment(T, E)
   & drawsegment(T, N)
   & drawcircle(O, A)
   & drawcircle(N, M)
   & prooflevel(1)) 
 => 
   mult(4, length(E, T)) = sum(length(A, E), length(B, E)))).

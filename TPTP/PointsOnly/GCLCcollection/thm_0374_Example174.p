% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0374_Example174.p; Output: thm_0374_Example174.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0374_Example174.p; Output: tmp_2_thm_0374_Example174.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0374_Example174
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 174 iz \cite{chou} 
%  thmnamee Example 174 from \cite{chou} 
%  thmtext Visina $AD$ trougla $ABC$ je produ\zh ena i 
%  thmtext se\ch e opisani krug trougla u ta\ch ki $K$. 
%  thmtext Ako je $H$ ortocentar trougla $ABC$, dokazati 
%  thmtext da ta\ch ka $D$ polovi du\zh \ $HK$. 
%  thmtexte The segment of the altitude extended 
%  thmtexte between the orthocenter and the second 
%  thmtexte point of intersection with the circumcircle 
%  thmtexte is bisected by the corresponding side of the triangle. 

include('geo.ax').
fof(thm, conjecture, ! [ A,K,D,Dp,a,P1,P12,P23,X,x,O,k,B,C,b,E,hc,H] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(K, 90, 30)
   & freepoint(D, 70, 30)
   & collinear(Dp, A, K)
   & newline(a, A, K)
   & perpendicular(P1, D, A, K)
   & midpoint(P12, A, K)
   & on_segment_bisector(P23, A, K)
   & freepoint(X, 24, 33)
   & newline(x, A, X)
   & intersection(O, P12, P23, A, X)
   & newcircle(k, O, A)
   & intersection_cl(C, B, O, A, P1, D)
   & newline(b, A, B)
   & foot(E, C, A, B)
   & newline(hc, C, E)
   & intersection(H, C, E, A, K)
   & cmark_lt(H)
   & drawsegment(C, E)
   & cmark_b(E)
   & cmark_rt(C)
   & drawcircle(O, A)
   & cmark_b(O)
   & cmark_lb(A)
   & cmark_b(B)
   & cmark_rb(D)
   & cmark_rb(K)
   & drawsegment(A, K)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & prooflevel(1)) 
 => 
   sratio(H, D, D, K) = 1)).

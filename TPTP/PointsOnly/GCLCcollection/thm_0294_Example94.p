% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0294_Example94.p; Output: thm_0294_Example94.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0294_Example94.p; Output: tmp_2_thm_0294_Example94.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0294_Example94
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 94 iz \cite{chou} 
%  thmnamee Example 94 from \cite{chou} 
%  thmtext Oko trougla $ABE$ opisan je krug $k$ sa 
%  thmtext centrom $O$. Neka je $PE$ proizvoljna 
%  thmtext tangenta na krug $k$. Simetrala 
%  thmtext ugla $\angle APE$ se\ch e du\zh i 
%  thmtext $EA$ i $BE$ u ta\ch kama $C$ i $D$. 
%  thmtext Dokazati da je $EC \cong ED$. 
%  thmtexte Through $P$ a tangent $PE$ and a secant 
%  thmtexte $PAB$ of circle $(O)$ are drawn. The 
%  thmtexte bisector of angle $APE$ meets $AE$ and 
%  thmtexte $BE$ at $C$ and $D$. Show that 
%  thmtexte $EC \cong ED$. 

include('geo.ax').
fof(thm, conjecture, ! [ E,O,k,Ap,Bp,A,B,ab,oe,P1,P,ae,be,P2,C,D] : ((
   dimensions(110, 90)
   & freepoint(E, 35, 20)
   & freepoint(O, 35, 45)
   & newcircle(k, O, E)
   & on_circle(Ap, O, E)
   & on_circle(Bp, O, E)
   & freepoint(A, 17.71, 63.06)
   & freepoint(B, 58.58, 36.68)
   & newline(ab, A, B)
   & newline(oe, O, E)
   & perpendicular(P1, E, O, E)
   & intersection(P, P1, E, A, B)
   & newline(ae, A, E)
   & newline(be, B, E)
   & on_angle_bisector(P2, E, P, A)
   & intersection(C, A, E, P2, P)
   & intersection(D, B, E, P2, P)
   & cmark_t(O)
   & cmark_b(E)
   & cmark_b(P)
   & cmark_lt(A)
   & cmark_r(B)
   & cmark_lb(C)
   & cmark_t(D)
   & drawsegment(E, P)
   & drawsegment(E, O)
   & drawsegment(A, P)
   & drawsegment(A, E)
   & drawsegment(A, B)
   & drawcircle(O, E)
   & drawdashline(P2, P)
   & drawsegment(E, A)
   & drawsegment(E, B)
   & prooflevel(1)) 
 => 
   length(E, D) = length(E, C))).

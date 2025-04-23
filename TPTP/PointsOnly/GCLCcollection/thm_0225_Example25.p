% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0225_Example25.p; Output: thm_0225_Example25.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0225_Example25.p; Output: tmp_2_thm_0225_Example25.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0225_Example25
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 25 iz \cite{chou} 
%  thmnamee Example 25 from \cite{chou} 
%  thmtext Proizvoljna prava se\ch e stranice trougla 
%  thmtext $ABC$ u ta\ch kama $D$, $E$ i $F$. Neka su 
%  thmtext $P$, $Q$ i $R$ sredi\sh ta du\zh i $EF$, $FD$ i $DE$. 
%  thmtext Dalje, neka prave $AP$, $BQ$ i $CR$ seku prave 
%  thmtext $BC$, $CA$ i $AB$ u ta\ch kama $X$, $Y$ i $Z$. 
%  thmtext Dokazati da su $X$, $Y$ i $Z$ kolinearne. 
%  thmtexte A tranversal curs the sides $BC$, $CA$, $AB$ 
%  thmtexte of triangle $ABC$ in $D$, $E$, $F$. $P$,  
%  thmtexte $Q$, $R$ are the midpoints of $EF$, $FD$, 
%  thmtexte $DE$ and $AP$, $BQ$, $CR$ intersec $BC$, $CA$, 
%  thmtexte $AB$ in $X$, $Y$, $Z$. Show that $X$, $Y$, $Z$ are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,F,D,E,P,Q,R,X,Y,Z] : ((
   dimensions(150, 110)
   & freepoint(A, 20, 20)
   & freepoint(B, 70, 20)
   & freepoint(C, 60, 70)
   & collinear(F, A, B)
   & collinear(D, B, C)
   & intersection(F, D, A, C, E)
   & midpoint(P, E, F)
   & midpoint(Q, F, D)
   & midpoint(R, D, E)
   & intersection(A, P, B, C, X)
   & intersection(B, Q, A, C, Y)
   & intersection(C, R, A, B, Z)
   & drawdashline(X, Y)
   & cmark_lb(X)
   & cmark_t(Y)
   & cmark_b(Z)
   & cmark_r(P)
   & cmark_l(Q)
   & cmark_r(R)
   & cmark_t(E)
   & cmark_b(F)
   & cmark_r(D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & drawsegment(A, P)
   & drawsegment(B, Y)
   & drawsegment(C, Z)
   & drawsegment(A, Z)
   & drawsegment(C, B)
   & drawsegment(A, E)
   & drawsegment(F, E)
   & prooflevel(1)) 
 => 
   collinear(X, Y, Z))).

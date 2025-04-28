% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0820_GeoThms20.p; Output: thm_0820_GeoThms20.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0820_GeoThms20.p; Output: tmp_2_thm_0820_GeoThms20.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0820_GeoThms20
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 20 iz \cite{geothms} 
%  thmnamee Example 20 from \cite{geothms} 
%  thmtext U ravni je dat trougao $ABC$ sa te\zh i\sh tem $T$. 
%  thmtext Kroz proizvoljnu ta\ch ku $X$ povu\ch ena je prava 
%  thmtext $TX$. Dokazati da je zbir rastojanja dva temena od prave $TX$ 
%  thmtext jednak rastojanju tr\cj eg temena. 
%  thmnote Obratiti pa\zh nju na sliku koja je izabrana 
%  thmnote tako da se maksimalno pojednostavi proces dokazivanja. 
%  thmnote Slika je konstruisana na na\ch in da najve\cj i 
%  thmnote broj ta\ch aka le\zh i na pravoj koja je  
%  thmnote paralelna koordinatnoj osi. Pa\zh ljivom analizom 
%  thmnote redosleda konstrukcija ta\ch aka, iskusniji \ch italac 
%  thmnote mo\zh e rekonstruisati korake konstrukcije. 
%  thmtexte Given a triangle $ABC$ and a point $X$, the sum 
%  thmtexte of the distances of the line $XG$, where $G$ is the 
%  thmtexte centroid of $ABC$, to the two vertices of the triangle 
%  thmtexte situated on the same side of the line is equal to the 
%  thmtexte distance of the line from the third vertex. 

include('geo.ax').
fof(thm, conjecture, ! [ A,C,T,A_1,C_1,bc,ab,B,X,gx,D,E,F] : ((
   dimensions(110, 100)
   & freepoint(A, 20, 20)
   & freepoint(C, 65, 80)
   & freepoint(T, 55, 45)
   & towards(A_1, A, T, 1.5)
   & towards(C_1, C, T, 1.5)
   & newline(bc, C, A_1)
   & newline(ab, A, C_1)
   & intersection(B, A, C_1, C, A_1)
   & freepoint(X, 95, 45)
   & newline(gx, T, X)
   & foot(D, A, T, X)
   & foot(E, B, T, X)
   & foot(F, C, T, X)
   & cmark_t(D)
   & cmark_t(E)
   & cmark_b(F)
   & cmark_lt(T)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(X)
   & drawline(T, X)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(A, A_1)
   & drawsegment(C, C_1)
   & drawdashsegment(A, D)
   & drawdashsegment(B, E)
   & drawdashsegment(C, F)
   & prooflevel(1)) 
 => 
   sum(sum(sratio(A, D, A, D), sratio(B, E, A, D)), sratio(C, F, A, D)) = 0)).

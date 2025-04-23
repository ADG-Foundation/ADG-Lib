% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0242_Example42.p; Output: thm_0242_Example42.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0242_Example42.p; Output: tmp_2_thm_0242_Example42.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0242_Example42
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 42 iz \cite{chou} 
%  thmnamee Example 42 from \cite{chou} 
%  thmtext Dat je \ch etvorougao $ABCD$. Neka se prave $AB$ i $CD$ 
%  thmtext seku u ta\ch ki $W$ i neka su $X$ i $Y$ sredi\sh ta 
%  thmtext dijagonala $AC$ i $BD$. Dokazati da je povr\sh ina 
%  thmtext trougla $XYW$ \ch etiri puta manja od povr\sh ine 
%  thmtext \ch etvorougla $ABCD$. 
%  thmnote Teorema se dokazuje za orijentisane povr\sh ine. Posmatraju 
%  thmnote se orijentisani trougao $XWY$ i orijentisani \ch etvorougao 
%  thmnote $ABCD$. 
%  thmtexte If a quadrangle $ABCD$ has its opposite sides $AD$ 
%  thmtexte and $BC$ (extended) meeting at $W$, while $X$ and $Y$ 
%  thmtexte are the midpoints of the diagonals $AC$ and $BD$, 
%  thmtexte then $(WXY) = 1/4(ABCD)$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,W,X,Y] : ((
   dimensions(110, 90)
   & freepoint(A, 20, 20)
   & freepoint(B, 60, 20)
   & freepoint(C, 50, 50)
   & freepoint(D, 35, 65)
   & intersection(A, B, C, D, W)
   & midpoint(X, A, C)
   & midpoint(Y, B, D)
   & cmark_b(X)
   & cmark_b(Y)
   & cmark_b(W)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, W)
   & drawsegment(C, B)
   & drawsegment(D, W)
   & drawsegment(A, D)
   & drawdashsegment(B, D)
   & drawdashsegment(C, A)
   & drawsegment(X, Y)
   & drawsegment(X, W)
   & drawsegment(Y, W)
   & prooflevel(1)) 
 => 
   mult(4, signed_area3(X, W, Y)) = signed_area4(A, B, C, D))).

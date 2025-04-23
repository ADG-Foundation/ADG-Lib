% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0320_Example120.p; Output: thm_0320_Example120.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0320_Example120.p; Output: tmp_2_thm_0320_Example120.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0320_Example120
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 120 iz \cite{chou} 
%  thmnamee Example 120 from \cite{chou} 
%  thmtext U ravni je dat trougao $ABC$. Iz tri temena trougla povu\ch ene su 
%  thmtext paralelne prave koje seku prave odre\dj ene naspramnim stranicama 
%  thmtext u ta\ch kama $X$, $Y$, i $Z$. Dokazati da je povr\sh ina 
%  thmtext trouglov $XYZ$ dva puta ve\cj a od povr\sh ine trougla $ABC$. 
%  thmnote Dovoljno je pokazati da je odnos orijentisanih povr\sh ina trouglova 
%  thmnote $ABC$ i $XZY$ jednak $1:2$. Obratiti pa\zh nju da tra\zh imo 
%  thmnote orijentisanu povr\sh inu trougla $XZY$, a ne trougla $XYZ$. Ove 
%  thmnote dve veli\ch ine su suprotnog znaka. Sa slike se vidi da je 
%  thmnote orijentacija ta\ch aka kod trouglova $ABC$ i $XZY$ ista, u oba 
%  thmnote slu\ch aja ta\ch ke su raspore\dj ene u smeru suprotnom od smera 
%  thmnote kretanja kazaljke na satu. 
%  thmtexte Three parallel lines drawn through the vertices 
%  thmtexte of a triangle $ABC$ meet the respective opposite 
%  thmtexte sides in the points $X$, $Y$, $Z$. Show that area ratio  
%  thmtexte $P_{XYZ} : P_{ABC} = 2 : 1$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,X,P1,P2,Y,Z] : ((
   dimensions(110, 100)
   & freepoint(A, 50, 50)
   & freepoint(B, 90, 50)
   & freepoint(C, 75, 80)
   & collinear(X, B, C)
   & parallel(P1, C, A, X)
   & parallel(P2, B, A, X)
   & intersection(P2, B, A, C, Y)
   & intersection(P1, C, A, B, Z)
   & cmark_t(Z)
   & cmark_b(Y)
   & cmark_rt(X)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & drawsegment(Z, B)
   & drawsegment(Y, C)
   & drawsegment(Z, X)
   & drawsegment(A, X)
   & drawsegment(Y, Z)
   & drawsegment(B, C)
   & drawsegment(C, Z)
   & drawsegment(Y, B)
   & drawsegment(X, Y)
   & prooflevel(1)) 
 => 
   mult(2, signed_area3(B, A, C)) = signed_area3(X, Y, Z))).

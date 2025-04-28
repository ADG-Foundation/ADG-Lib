% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0310_Example110.p; Output: thm_0310_Example110.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0310_Example110.p; Output: tmp_2_thm_0310_Example110.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0310_Example110
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 110 iz \cite{chou} 
%  thmnamee Example 110 from \cite{chou} 
%  thmtext Na pravam $AC$ i $BD$ trougla $ABC$ date su 
%  thmtext $D$ i $E$ takve da je $AD \cong BE$. 
%  thmtext Neka je $F = DE \cap AB$. Dokazati da je: 
%  thmtext $FD \cdot AC = EF \cdot BC$. 
%  thmtexte Let $D$ and $E$ be two points on two 
%  thmtexte sides $AC$ and $BC$ of triangle $ABC$ such 
%  thmtexte that $AD \cong BE$. $F = DE \cap AB$. Show that: 
%  thmtexte $FD \cdot AC = EF \cdot BC$. 
%  thmnote Konstrukcija je izvedena tako \sh to su ta\ch ke 
%  thmnote $A$, $B$, $C$ izabrane proizvoljno, $D$ izabrana 
%  thmnote proizvoljno na pravoj $AC$. Zatim je konstruisan  
%  thmnote paralelogram $ADD_1B$ i ta\ch ka $E$ je odre\dj ena 
%  thmnote kao presek kruga sa polupre\ch nikom $BD_1$ 
%  thmnote prave $BC$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,b,P1,c,P2,D1,a,k,E,E1,de,F] : ((
   dimensions(120, 110)
   & freepoint(A, 20, 40)
   & freepoint(B, 85, 40)
   & freepoint(C, 70, 90)
   & collinear(D, A, C)
   & newline(b, A, C)
   & parallel(P1, B, A, C)
   & newline(c, A, B)
   & parallel(P2, D, A, B)
   & intersection(D1, P1, B, P2, D)
   & newline(a, B, C)
   & newcircle(k, B, D1)
   & intersection_cl(E1, E, B, D1, B, C)
   & newline(de, D, E)
   & intersection(F, D, E, A, B)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_lt(D)
   & cmark_b(E)
   & cmark_lb(F)
   & drawsegment(A, B)
   & drawsegment(C, E)
   & drawsegment(A, C)
   & drawdashsegment(B, D1)
   & drawdashsegment(D, D1)
   & drawsegment(D, E)
   & prooflevel(1)) 
 => 
   mult(length(F, D), length(A, C)) = mult(length(E, F), length(B, C)))).

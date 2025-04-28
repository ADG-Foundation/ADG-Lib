% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0900_IsoscelesRightTriangle.p; Output: thm_0900_IsoscelesRightTriangle.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0900_IsoscelesRightTriangle.p; Output: tmp_2_thm_0900_IsoscelesRightTriangle.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0900_IsoscelesRightTriangle
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Problem u jednakonstrani\ch nom pravouglom trouglu 
%  thmnamee Isosceles Right Triangle Problem 
%  thmtext Dat je jednakostrani\ch ni pravougli trougao $ABC$ 
%  thmtext sa pravim uglom kod temena $C$. Na stranici $AC$ 
%  thmtext je izabrana proizvoljna ta\ch ka $E$. Ta\ch ka $D$ 
%  thmtext je odre\dj ena kao presek prave koja sadr\zh i  
%  thmtext ta\ch ku $E$ i paralelna je sa $AB$ i prave $BC$. 
%  thmtext Normale na pravu $BE$ povu\ch ene iz $D$ i $C$ seku 
%  thmtext pravu $AB$ u ta\ch kama $K$ i $L$. Dokazati da je 
%  thmtext $L$ sredi\sh te du\zh i $KA$. 
%  thmtexte Isosceles right triangle $ABC$ with right angle 
%  thmtexte at point $C$ is given. Let $E$ be a point on side $AC$ 
%  thmtexte of a triangle. Let $D$ be the intersection of a line 
%  thmtexte passing through $E$ parallel with line $AB$ and a line. 
%  thmtexte $BC$. Let $p$ and $q$ be lines perpendicular with 
%  thmtexte line $BE$ passing through points $D$ and $C$, and 
%  thmtexte let $K$ and $L$ be intersections of lines $p$ and $q$ 
%  thmtexte with hypotenuse $AB$. Show that $L$ is a midpoint 
%  thmtexte of a segment $KA$. 

include('geo.ax').
fof(thm, conjecture, ! [ C,A,k,ac,P1,B1,B,E,Ep,ab,be,P2,D,P3,P4,L,K] : ((
   dimensions(110, 110)
   & freepoint(C, 20, 20)
   & freepoint(A, 90, 20)
   & newcircle(k, C, A)
   & newline(ac, A, C)
   & perpendicular(P1, C, A, C)
   & intersection_cl(B, B1, C, A, P1, C)
   & freepoint(E, 47, 20)
   & collinear(Ep, A, C)
   & newline(ab, A, B)
   & newline(be, B, E)
   & parallel(P2, E, A, B)
   & intersection(D, P2, E, P1, C)
   & perpendicular(P3, C, B, E)
   & perpendicular(P4, D, B, E)
   & intersection(L, P3, C, A, B)
   & intersection(K, P4, D, A, B)
   & cmark_rt(K)
   & cmark_rt(L)
   & cmark_b(E)
   & cmark_l(D)
   & cmark_t(B)
   & cmark_b(C)
   & cmark_b(A)
   & drawdashsegment(D, E)
   & drawsegment(E, B)
   & drawsegment(A, C)
   & drawsegment(A, B)
   & drawsegment(B, C)
   & drawsegment(D, K)
   & drawsegment(C, L)
   & prooflevel(1)) 
 => 
   sratio(K, L, L, A) = 1)).

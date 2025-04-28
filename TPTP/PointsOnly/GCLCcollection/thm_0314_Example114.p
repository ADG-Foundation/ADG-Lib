% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0314_Example114.p; Output: thm_0314_Example114.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0314_Example114.p; Output: tmp_2_thm_0314_Example114.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0314_Example114
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 114 iz \cite{chou} 
%  thmnamee Example 114 from \cite{chou} 
%  thmtext Na krugu sa pre\ch nikom $AB$ data je 
%  thmtext ta\ch ka $F$. Tangenta iz ta\ch ke $F$ 
%  thmtext se\ch e normale na pravu $AB$ povu\ch ene 
%  thmtext iz ta\ch aka $A$ i $B$ u ta\ch kama 
%  thmtext $D$ i $E$. 
%  thmtext Dokazati da je: 
%  thmtext $OA^2 = DF \cdot EF$. 
%  thmtexte Through point $F$ on the circle with 
%  thmtexte diameter $AB$ a tangent to the circle 
%  thmtexte is drawn meeting the two lines, 
%  thmtexte perpendicular to $AB$ at $A$ and $B$, 
%  thmtexte at $D$ and $E$. Show that: 
%  thmtexte $OA^2 = DF \cdot EF$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,O,k,F,Fp,ab,f,P1,P2,P3,D,E] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 45)
   & freepoint(B, 90, 45)
   & midpoint(O, A, B)
   & newcircle(k, O, A)
   & freepoint(F, 48.77, 79.44)
   & on_circle(Fp, O, A)
   & newline(ab, A, B)
   & newline(f, F, O)
   & perpendicular(P1, F, F, O)
   & perpendicular(P2, A, A, B)
   & perpendicular(P3, B, A, B)
   & intersection(D, P2, A, P1, F)
   & intersection(E, P3, B, P1, F)
   & cmark_l(A)
   & cmark_r(B)
   & cmark_b(O)
   & cmark_lt(F)
   & cmark_t(D)
   & cmark_t(E)
   & drawsegment(A, B)
   & drawsegment(O, F)
   & drawsegment(D, E)
   & drawsegment(E, B)
   & drawsegment(A, D)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   mult(length(O, A), length(O, A)) = mult(length(D, F), length(E, F)))).

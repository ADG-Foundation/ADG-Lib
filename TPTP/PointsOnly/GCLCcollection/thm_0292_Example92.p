% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0292_Example92.p; Output: thm_0292_Example92.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0292_Example92.p; Output: tmp_2_thm_0292_Example92.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0292_Example92
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 92 iz \cite{chou} 
%  thmnamee Example 92 from \cite{chou} 
%  thmtext Sa pre\ch nika $CD$ kruga sa centrom $O$, spu\sh tene 
%  thmtext su normale $CE$ i $DF$ na tetivu $AB$. Dokazati 
%  thmtext da je $OE \cong OF$. 
%  thmnote Konstrukcija je izvedena tako \sh to su izabrane 
%  thmnote proizvoljne ta\ch ke $A$, $B$, $X$, $Y$ i $Z$. Centar 
%  thmnote kruga je odre\dj en kao presek prave $XY$ i simetrale 
%  thmnote du\zh i $AB$. Pre\ch nik $CD$ je odre\dj en kao 
%  thmnote presek prave $OZ$ i kruga. 
%  thmtexte From the ends $D$ and $C$ of a diameter of circle $(O)$ 
%  thmtexte perpendiculars are drawn to chort $AB$. Let $E$ and $F$ 
%  thmtexte be the feet of the perpendiculars. Show that 
%  thmtexte $OE \cong OF$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,X,Y,xy,P11,P22,O,k,Z,cd,C,D,ab,E,F] : ((
   dimensions(130, 110)
   & freepoint(A, 25, 30)
   & freepoint(B, 105, 30)
   & freepoint(X, 100, 100)
   & freepoint(Y, 92, 90)
   & newline(xy, X, Y)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & intersection(O, P11, P22, X, Y)
   & newcircle(k, O, A)
   & freepoint(Z, 80, 80)
   & newline(cd, O, Z)
   & intersection_cl(D, C, O, A, O, Z)
   & newline(ab, A, B)
   & foot(E, C, A, B)
   & foot(F, D, A, B)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_lt(O)
   & cmark_lb(C)
   & cmark_rt(D)
   & cmark_t(E)
   & cmark_b(F)
   & drawcircle(O, A)
   & drawdashsegment(O, E)
   & drawdashsegment(O, F)
   & drawsegment(A, B)
   & drawsegment(C, D)
   & drawsegment(C, E)
   & drawsegment(D, F)
   & prooflevel(1)) 
 => 
   length(O, E) = length(O, F))).

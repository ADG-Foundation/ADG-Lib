% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0291_Example91.p; Output: thm_0291_Example91.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0291_Example91.p; Output: tmp_2_thm_0291_Example91.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0291_Example91
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 91 iz \cite{chou} 
%  thmnamee Example 91 from \cite{chou} 
%  thmtext Neka je $D$ ta\ch ka na stranici $BC$ pravouglog trougla 
%  thmtext $ABC$ takva da krug sa centrom $O$ i pre\ch nikom $CD$ 
%  thmtext doti\ch e hipotenuzu $AB$ u ta\ch ki $E$. Neka je 
%  thmtext $F = AC \cap DE$. Dokazati da je $AF \cong AE$. 
%  thmnote Konstrukcija je izvedena tako \sh to su 
%  thmnote ta\ch ke $C$ i $D$ izabrane proizvoljno, 
%  thmnote ta\ch ka $E$ je izabrana proizvoljno na krugu 
%  thmnote sa pre\ch nikom $CD$, a ostale ta\ch ke 
%  thmnote tako da zadovoljavaju uslove konstrukcije. 
%  thmtexte Let $D$ be a point on the side $CB$ of a right triangle 
%  thmtexte $ABC$ such that the circle ($O$) with diameter $CD$ 
%  thmtexte touches the hypotenuses $AB$ at $E$. Let 
%  thmtexte $F = AC \cap DE$. Show that $AF \cong AE$ 

include('geo.ax').
fof(thm, conjecture, ! [ C,D,cd,O,k,Ep,E,oe,P1,P2,A,B,de,F] : ((
   dimensions(130, 110)
   & freepoint(C, 20, 30)
   & freepoint(D, 70, 30)
   & newline(cd, C, D)
   & midpoint(O, C, D)
   & newcircle(k, O, C)
   & on_circle(Ep, O, C)
   & freepoint(E, 53.34, 53.57)
   & newline(oe, O, E)
   & perpendicular(P1, E, O, E)
   & perpendicular(P2, C, C, D)
   & intersection(A, P2, C, P1, E)
   & intersection(B, P1, E, C, D)
   & newline(de, D, E)
   & intersection(F, D, E, P2, C)
   & cmark_lb(C)
   & cmark_b(O)
   & cmark_rb(D)
   & cmark_rt(E)
   & cmark_l(A)
   & cmark_b(B)
   & cmark_l(F)
   & drawcircle(O, C)
   & drawsegment(C, B)
   & drawsegment(A, B)
   & drawsegment(C, F)
   & drawsegment(O, E)
   & drawsegment(D, F)
   & prooflevel(1)) 
 => 
   length(A, F) = length(A, E))).

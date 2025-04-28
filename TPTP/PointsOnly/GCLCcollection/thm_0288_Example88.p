% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0288_Example88.p; Output: thm_0288_Example88.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0288_Example88.p; Output: tmp_2_thm_0288_Example88.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0288_Example88
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 88 iz \cite{chou} 
%  thmnamee Example 88 from \cite{chou} 
%  thmtext Data je ta\ch ka $D$ na osnovi $AC$ jednakostrani\ch nog 
%  thmtext trougla $ABC$. Neka su $E$ i $F$ podno\zh ja normala 
%  thmtext iz ta\ch ke $D$ na stranice $AB$ i $BC$ i neka je 
%  thmtext $H$ podno\zh je visine trougla $ABC$ iz temena $C$. 
%  thmtext Dokazati da je zbir du\zh i $DE$ i $DF$ jednak visini 
%  thmtext $CH$. 
%  thmnote Dovoljno je dokazati da je algebarska suma du\zh i 
%  thmnote $DE$, $DF$ i $CH$ jednaka nuli. 
%  thmtexte Show that the sum of distances of a point 
%  thmtexte on the base of an isosceles triangle to its 
%  thmtexte two sides is equal to the altitudes on the 
%  thmtexte sides. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,ab,bc,E,F,H] : ((
   dimensions(110, 80)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & on_circle(C, B, A)
   & collinear(D, A, C)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & foot(E, D, A, B)
   & foot(F, D, B, C)
   & foot(H, C, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_l(D)
   & cmark_b(H)
   & cmark_b(E)
   & cmark_rt(F)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, H)
   & drawsegment(D, E)
   & drawsegment(D, F)
   & prooflevel(1)) 
 => 
   alg_sum_zero3(length(D, E), length(D, F), length(C, H)))).

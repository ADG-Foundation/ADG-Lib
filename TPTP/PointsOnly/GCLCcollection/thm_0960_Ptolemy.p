% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0960_Ptolemy.p; Output: thm_0960_Ptolemy.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0960_Ptolemy.p; Output: tmp_2_thm_0960_Ptolemy.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0960_Ptolemy
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Ptolomejeva teorema 
%  thmnamee Ptolemy's Theorem 
%  thmtext Proizvod dijagonala \ch etvorougla upisanog u krug jednak je 
%  thmtext zbiru proizvoda naspramnih stranica. 
%  thmnote Dokaza\cj emo slabije tvr\dj enje, da je algebarska suma tri 
%  thmnote proizvoda iz zadatka jednaka nuli (odnosno da je jedan 
%  thmnote od njih jednak zbiru druga dva). 
%  thmtexte Let a quadrilateral $ABCD$ be inscribed in a circle.  
%  thmtexte Then the sum of the products of the two pairs of  
%  thmtexte opposite sides equals the product of its  
%  thmtexte two diagonals. In other words, 
%  thmtexte $AD \cdot BC + AB \cdot CD = AC \cdot BD$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P11,P22,P13,P24,O,k,Dp,D] : ((
   dimensions(110, 95)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 60, 80)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & midpoint(P13, B, C)
   & on_segment_bisector(P24, B, C)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, A)
   & on_circle(Dp, O, A)
   & freepoint(D, 30.42, 71.1)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_rt(C)
   & cmark_lt(D)
   & cmark_b(O)
   & drawsegment(A, B)
   & drawsegment(A, D)
   & drawsegment(A, D)
   & drawsegment(C, B)
   & drawsegment(D, B)
   & drawsegment(C, D)
   & drawsegment(C, A)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   alg_sum_zero3(mult(length(A, B), length(C, D)), mult(length(A, D), length(B, C)), mult(length(A, C), length(B, D))))).

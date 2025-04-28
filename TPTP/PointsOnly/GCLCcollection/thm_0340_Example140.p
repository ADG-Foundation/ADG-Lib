% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0340_Example140.p; Output: thm_0340_Example140.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0340_Example140.p; Output: tmp_2_thm_0340_Example140.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0340_Example140
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 140 iz \cite{chou} 
%  thmnamee Example 140 from \cite{chou} 
%  thmtext Proizvod dve stranice trougla je jednak 
%  thmtext proizvodu visine povu\ch ene iz tre\cj eg temena 
%  thmtext i pre\ch nika opisanog kruga. 
%  thmtexte The product of two sides of a triangle 
%  thmtexte is equal to the altitude to the third side 
%  thmtexte multiplied by the circumdiameter. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,c,P11,P22,P13,P24,O,k,F] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 73, 85)
   & newline(c, A, B)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & midpoint(P13, A, C)
   & on_segment_bisector(P24, A, C)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, A)
   & foot(F, C, A, B)
   & cmark_b(F)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_t(O)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, F)
   & drawsegment(A, O)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   mult(length(A, C), length(B, C)) = mult(4, mult(length(O, A), length(C, F))))).

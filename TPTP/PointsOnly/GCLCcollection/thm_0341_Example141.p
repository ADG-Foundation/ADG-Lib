% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0341_Example141.p; Output: thm_0341_Example141.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0341_Example141.p; Output: tmp_2_thm_0341_Example141.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0341_Example141
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 141 iz \cite{chou} 
%  thmnamee Example 141 from \cite{chou} 
%  thmtext Povr\sh ina trougla je jednaka koli\ch niku 
%  thmtext proizvoda tri stranice i dvostrukog pre\ch nika 
%  thmtext opisanog kruga, tj. 
%  thmtext $P_{\triangle ABC} = \frac{abc}{2R}$ 
%  thmtexte The area of a triangle is equal to the product 
%  thmtexte of its three sides divided by the double 
%  thmtexte circumdiameter of the triangle. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,c,P11,P22,P13,P24,O,k] : ((
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
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_t(O)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(A, O)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   mult(16, mult(signed_area3(A, B, C), mult(signed_area3(A, B, C), length(A, O)))) = mult(length(A, B), mult(length(A, C), length(B, C))))).

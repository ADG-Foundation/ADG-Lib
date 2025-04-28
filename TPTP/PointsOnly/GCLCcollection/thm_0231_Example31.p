% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0231_Example31.p; Output: thm_0231_Example31.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0231_Example31.p; Output: tmp_2_thm_0231_Example31.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0231_Example31
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 31 iz \cite{chou} 
%  thmnamee Example 31 from \cite{chou} 
%  thmtext Dokazati da u proizvoljnom trouglu va\zh i jednakost: 
%  thmtext $OH^2 = 9R^2 - a^2 - b^2 - c^2$. 
%  thmtexte $OH^2 = 9R^2 - a^2 - b^2 - c^2$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P11,P22,P13,P24,O,ab,P5,ac,P6,H,D,k] : ((
   dimensions(90, 90)
   & freepoint(A, 20, 20)
   & freepoint(B, 70, 20)
   & freepoint(C, 55, 70)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & midpoint(P13, A, B)
   & on_segment_bisector(P24, A, B)
   & intersection(O, P11, P22, P13, P24)
   & newline(ab, A, B)
   & perpendicular(P5, C, A, B)
   & newline(ac, A, C)
   & perpendicular(P6, B, A, C)
   & intersection(H, P5, C, P6, B)
   & intersection(D, P5, C, A, B)
   & newcircle(k, O, A)
   & drawcircle(O, A)
   & cmark_b(O)
   & cmark_l(H)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & drawsegment(C, D)
   & drawsegment(C, O)
   & drawsegment(A, O)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & prooflevel(1)) 
 => 
   mult(9, length(O, A)) = sum(length(O, H), sum(length(A, B), sum(length(A, C), length(B, C)))))).

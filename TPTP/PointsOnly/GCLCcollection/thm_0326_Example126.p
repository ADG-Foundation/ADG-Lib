% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0326_Example126.p; Output: thm_0326_Example126.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0326_Example126.p; Output: tmp_2_thm_0326_Example126.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0326_Example126
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 126 iz \cite{chou} 
%  thmnamee Example 126 from \cite{chou} 
%  thmtext  
%  thmtexte  

include('geo.ax').
fof(thm, conjecture, ! [ B,C,A,P11,P22,P13,P24,O,k,oc,ob,P5,P6,c,b,P7,P8,B_1,C_1] : ((
   dimensions(90, 115)
   & freepoint(B, 20, 50)
   & freepoint(C, 70, 50)
   & freepoint(A, 60, 105)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & midpoint(P13, A, B)
   & on_segment_bisector(P24, A, B)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, B)
   & newline(oc, O, C)
   & newline(ob, O, B)
   & perpendicular(P5, C, O, C)
   & perpendicular(P6, B, O, B)
   & newline(c, A, B)
   & newline(b, A, C)
   & parallel(P7, B, A, C)
   & parallel(P8, C, A, B)
   & intersection(B_1, P5, C, P7, B)
   & intersection(C_1, P6, B, P8, C)
   & cmark_lb(B)
   & cmark_rb(C)
   & cmark_rt(A)
   & cmark_rt(O)
   & cmark_b(B_1)
   & cmark_b(C_1)
   & drawcircle(O, B)
   & drawsegment(B, C)
   & drawsegment(B, O)
   & drawsegment(O, C)
   & drawsegment(B, A)
   & drawsegment(A, C)
   & drawsegment(B, C_1)
   & drawsegment(B, B_1)
   & drawsegment(C, C_1)
   & drawsegment(C, B_1)
   & prooflevel(1)) 
 => 
   mult(length(B, C), length(B, C)) = mult(length(B, C_1), length(B_1, C)))).

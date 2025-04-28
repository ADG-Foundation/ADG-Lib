% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0269_Example69.p; Output: thm_0269_Example69.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0269_Example69.p; Output: tmp_2_thm_0269_Example69.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0269_Example69
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 69 iz \cite{chou} 
%  thmnamee Example 69 from \cite{chou} 
%  thmtext Dijagonale paralelograma i upisanog 
%  thmtext paralelograma su konkurentne. 
%  thmtexte The diagonals of a parallelogram and those 
%  thmtexte of its inscribed parallelogram are concurrent. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,ab,bc,P1,P2,D,A_1,B_1,C_1,D_1,ac,bd,O] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 110, 70)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & parallel(P1, C, A, B)
   & parallel(P2, A, B, C)
   & intersection(D, P1, C, P2, A)
   & midpoint(A_1, A, B)
   & midpoint(B_1, B, C)
   & midpoint(C_1, C, D)
   & midpoint(D_1, D, A)
   & newline(ac, A, C)
   & newline(bd, B, D)
   & intersection(O, A, C, B, D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(A_1)
   & cmark_t(C)
   & cmark_t(D)
   & cmark_t(C_1)
   & cmark_r(B_1)
   & cmark_l(D_1)
   & cmark_b(O)
   & drawsegment(A, B)
   & drawsegment(B, C)
   & drawsegment(C, D)
   & drawsegment(D, A)
   & drawsegment(A_1, B_1)
   & drawsegment(B_1, C_1)
   & drawsegment(C_1, D_1)
   & drawsegment(D_1, A_1)
   & drawdashsegment(A, C)
   & drawdashsegment(B, D)
   & drawdashsegment(A_1, C_1)
   & drawdashsegment(B_1, D_1)
   & prooflevel(1)) 
 => 
   collinear(A_1, C_1, O))).

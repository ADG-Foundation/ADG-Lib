% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0610_CosineTheorem.p; Output: thm_0610_CosineTheorem.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0610_CosineTheorem.p; Output: tmp_2_thm_0610_CosineTheorem.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0610_CosineTheorem
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Kosinusna teorema 
%  thmnamee The Law of Cosine 
%  thmtext $c^2 + b^2 - 2bc \cos \alpha = a^2$ 
%  thmtexte $c^2 + b^2 - 2bc \cos \alpha = a^2$ 
%  thmnote $\cos \alpha = \frac{CD}{AC}$ 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,c,D,a,b,al,x,xx] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 70, 90)
   & newline(c, A, B)
   & foot(D, C, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(D)
   & cmark_t(C)
   & drawsegment(C, D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, C)
   & freepoint(a, 83, 58.4)
   & printat(a, a)
   & freepoint(b, 42.4, 61)
   & printat(b, b)
   & freepoint(c, 57.9, 28.2)
   & printat(c, c)
   & freepoint(al, 30, 34.1)
   & printat(al, \(alpha))
   & freepoint(x, 40, 30)
   & drawarc(A, x, 50)
   & freepoint(xx, 41, 30)
   & drawarc(A, xx, 50)
   & prooflevel(1)) 
 => 
   mult(mult(sum(mult(-1, length(C, B)), sum(length(A, C), length(B, A))), sum(mult(-1, length(C, B)), sum(length(A, C), length(B, A)))), length(A, C)) = mult(4, mult(length(A, C), mult(length(B, A), length(A, D)))))).

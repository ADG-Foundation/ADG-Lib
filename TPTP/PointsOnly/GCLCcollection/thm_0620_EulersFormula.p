% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0620_EulersFormula.p; Output: thm_0620_EulersFormula.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0620_EulersFormula.p; Output: tmp_2_thm_0620_EulersFormula.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0620_EulersFormula
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Ojlerova formula 
%  thmnamee Euler's Formula 
%  thmtext Dokazati da je $d^2 = R(R - 2r)$ 
%  thmtext gde su $R$ i $r$ polupre\ch nici 
%  thmtext opisanog i upisanog kruga trougla, a $d$ 
%  thmtext rastojanje izme\dj u njih. 
%  thmtexte If $R$ and $r$ are half diameters of circumscribed 
%  thmtexte and inscribed circles of a trougle and $d$ is a 
%  thmtexte distance between them, show that: 
%  thmtexte $d^2 = R(R - 2r)$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,I,P13,P24,P15,P26,O,k,c,D,k1,x,y,z] : ((
   dimensions(105, 90)
   & freepoint(A, 20, 33)
   & freepoint(B, 85, 33)
   & freepoint(C, 68, 75)
   & on_angle_bisector(P1, A, C, B)
   & on_angle_bisector(P2, B, A, C)
   & intersection(I, P2, A, P1, C)
   & midpoint(P13, A, B)
   & on_segment_bisector(P24, A, B)
   & midpoint(P15, A, C)
   & on_segment_bisector(P26, A, C)
   & intersection(O, P13, P24, P15, P26)
   & newcircle(k, O, A)
   & newline(c, A, B)
   & foot(D, I, A, B)
   & newcircle(k1, I, D)
   & drawcircle(I, D)
   & drawcircle(O, A)
   & cmark_b(O)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_rt(I)
   & cmark_b(D)
   & drawsegment(A, O)
   & drawsegment(I, D)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(A, B)
   & drawdashsegment(I, O)
   & freepoint(x, 56, 48)
   & printat(x, d)
   & freepoint(y, 38.9, 41.5)
   & printat(y, _5334)
   & freepoint(z, 63.3, 41.3)
   & printat(z, r)
   & prooflevel(1)) 
 => 
   mult(sum(mult(-1, length(I, O)), length(A, O)), sum(mult(-1, length(I, O)), length(A, O))) = mult(4, mult(length(A, O), length(I, D))))).

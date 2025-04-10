% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0322_Example122.p; Output: thm_0322_Example122.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0322_Example122.p; Output: tmp_2_thm_0322_Example122.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0322_Example122
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,O,O_1,E,F,E_1,F_1] : ((
   dimensions(110,110)
   & freepoint(A,40,20)
   & freepoint(B,90,20)
   & freepoint(C,75,50)
   & freepoint(D,55,40)
   & inter(A,B,C,D,O)
   & inter(B,C,A,D,O_1)
   & translate(E,A,B,O)
   & translate(F,D,C,O)
   & translate(E_1,A,D,O_1)
   & translate(F_1,B,C,O_1)
   & cmark_lb(F_1)
   & cmark_rb(E_1)
   & cmark_t(F)
   & cmark_b(E)
   & cmark_l(O_1)
   & cmark_b(O)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_rt(C)
   & cmark_lt(D)
   & drawsegment(O,B)
   & drawsegment(F_1,B)
   & drawsegment(C,O)
   & drawsegment(A,E_1)
   & drawdashsegment(F_1,E_1)
   & drawdashsegment(F,E)
   & prooflevel(1)) 
 => 
   paraNS(E,F,F_1,E_1))).

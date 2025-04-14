% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0970_Simpson.p; Output: thm_0970_Simpson.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0970_Simpson.p; Output: tmp_2_thm_0970_Simpson.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0970_Simpson
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,O,B,C,D,E,F,G] : ((
   dimensions(100,100)
   & freepoint(A,20,50)
   & freepoint(O,55,50)
   & oncircle(B,O,A)
   & oncircle(C,O,A)
   & oncircle(D,O,A)
   & foot(E,D,B,C)
   & foot(F,D,A,C)
   & foot(G,D,A,B)
   & cmark_l(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(D)
   & cmark_t(O)
   & cmark_t(E)
   & cmark_t(F)
   & cmark_t(G)
   & drawsegment(A,B)
   & drawsegment(F,C)
   & drawsegment(C,B)
   & drawcircle(O,A)
   & drawdashsegment(E,D)
   & drawdashsegment(F,D)
   & drawdashsegment(G,D)
   & drawdashline(E,F)
   & prooflevel(1)) 
 => 
   collinear(E,F,G))).

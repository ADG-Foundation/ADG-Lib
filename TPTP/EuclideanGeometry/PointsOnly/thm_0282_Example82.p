% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0282_Example82.p; Output: thm_0282_Example82.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0282_Example82.p; Output: tmp_2_thm_0282_Example82.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0282_Example82
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,F,P,Q,G] : ((
   dimensions(110,100)
   & freepoint(A,20,20)
   & freepoint(B,90,20)
   & freepoint(C,70,70)
   & midp(F,A,B)
   & foot(P,A,B,C)
   & foot(Q,B,A,C)
   & foot(G,F,P,Q)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(F)
   & cmark_t(C)
   & cmark_r(P)
   & cmark_l(Q)
   & cmark_t(G)
   & drawsegment(A,B)
   & drawsegment(C,B)
   & drawsegment(A,C)
   & drawsegment(A,P)
   & drawsegment(Q,B)
   & drawsegment(P,Q)
   & drawsegment(F,G)
   & prooflevel(1)) 
 => 
   sratio(Q,G,G,P) = 1)).

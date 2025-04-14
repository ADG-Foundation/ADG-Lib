% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0110_Parallelogram2.p; Output: thm_0110_Parallelogram2.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0110_Parallelogram2.p; Output: tmp_2_thm_0110_Parallelogram2.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0110_Parallelogram2
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,D,E] : ((
   dimensions(130,70)
   & freepoint(A,20,20)
   & freepoint(B,80,20)
   & freepoint(C,97.6,51.5)
   & paraS(P1,A,B,C)
   & paraS(P2,C,A,B)
   & inter(P1,A,P2,C,D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A,B)
   & drawsegment(C,B)
   & drawsegment(A,D)
   & drawsegment(C,D)
   & inter(A,C,B,D,E)
   & cmark_t(E)
   & drawdashsegment(A,C)
   & drawdashsegment(B,D)
   & prooflevel(1)) 
 => 
   same_length(A,E,E,C))).

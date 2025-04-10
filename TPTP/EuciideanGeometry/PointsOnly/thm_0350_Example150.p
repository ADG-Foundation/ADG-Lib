% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0350_Example150.p; Output: thm_0350_Example150.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0350_Example150.p; Output: tmp_2_thm_0350_Example150.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0350_Example150
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,M,F,E,D,G] : ((
   dimensions(110,110)
   & freepoint(A,20,30)
   & freepoint(B,90,30)
   & freepoint(C,40,88)
   & freepoint(M,93,90)
   & midp(F,A,B)
   & midp(E,A,C)
   & midp(D,B,C)
   & inter(A,D,C,F,G)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_t(M)
   & cmark_lt(G)
   & cmark_b(F)
   & cmark_lt(E)
   & cmark_rt(D)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(C,B)
   & drawsegment(M,B)
   & drawsegment(C,M)
   & drawsegment(C,F)
   & drawsegment(A,D)
   & drawsegment(B,E)
   & drawsegment(G,M)
   & prooflevel(1)) 
 => 
   sum(mult(length(M,G),3),sum(length(A,G),sum(length(C,G),length(B,G)))) = sum(length(A,M),sum(length(B,M),length(C,M))))).

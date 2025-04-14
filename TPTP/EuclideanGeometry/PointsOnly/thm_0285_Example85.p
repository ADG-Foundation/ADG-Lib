% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0285_Example85.p; Output: thm_0285_Example85.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0285_Example85.p; Output: tmp_2_thm_0285_Example85.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0285_Example85
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,D,P,P3,Q,N,M] : ((
   dimensions(130,100)
   & freepoint(A,20,20)
   & freepoint(B,80,20)
   & freepoint(C,110,70)
   & paraS(P1,A,B,C)
   & paraS(P2,C,A,B)
   & inter(P1,A,P2,C,D)
   & coll(P,B,C)
   & paraS(P3,P,A,B)
   & inter(P3,P,P1,A,Q)
   & inter(P,D,Q,C,N)
   & inter(P,A,Q,B,M)
   & cmark_b(M)
   & cmark_b(A)
   & cmark_t(N)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & cmark_r(P)
   & cmark_l(Q)
   & drawsegment(P,D)
   & drawsegment(P,A)
   & drawsegment(Q,C)
   & drawsegment(B,Q)
   & drawsegment(P,Q)
   & drawsegment(A,B)
   & drawsegment(A,D)
   & drawsegment(C,B)
   & drawsegment(C,D)
   & drawdashsegment(M,N)
   & prooflevel(1)) 
 => 
   sratio(A,D,M,N) = 2)).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0243_Example46.p; Output: thm_0243_Example46.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0243_Example46.p; Output: tmp_2_thm_0243_Example46.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0243_Example46
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,E,B,C,P1,P2,D,F,M,N,P,Q] : ((
   dimensions(130,100)
   & freepoint(A,20,20)
   & freepoint(E,80,20)
   & freepoint(B,95,70)
   & coll(C,A,E)
   & paraS(P1,B,A,E)
   & paraS(P2,A,B,E)
   & inter(P1,B,P2,A,D)
   & coll(F,D,B)
   & inter(C,D,A,F,M)
   & inter(E,F,B,C,N)
   & inter(M,N,P2,A,P)
   & inter(M,N,B,E,Q)
   & cmark_b(A)
   & cmark_b(E)
   & cmark_t(B)
   & cmark_t(D)
   & cmark_b(C)
   & cmark_t(F)
   & cmark_rb(M)
   & cmark_rb(N)
   & cmark_lt(P)
   & cmark_rb(Q)
   & drawsegment(A,E)
   & drawsegment(E,B)
   & drawsegment(B,D)
   & drawsegment(D,A)
   & drawdashsegment(D,C)
   & drawdashsegment(A,F)
   & drawdashsegment(E,F)
   & drawdashsegment(C,B)
   & drawline(P,Q)
   & prooflevel(1)) 
 => 
   sratio(A,P,Q,B) = 1)).

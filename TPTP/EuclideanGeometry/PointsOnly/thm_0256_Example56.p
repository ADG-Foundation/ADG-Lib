% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0256_Example56.p; Output: thm_0256_Example56.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0256_Example56.p; Output: tmp_2_thm_0256_Example56.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0256_Example56
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ M,N,P,P1,P2,Q,Pp,S,T,R] : ((
   dimensions(130,60)
   & freepoint(M,20,20)
   & freepoint(N,70,20)
   & freepoint(P,85,45)
   & paraS(P1,P,M,N)
   & paraS(P2,M,N,P)
   & inter(P1,P,P2,M,Q)
   & translate(Pp,M,N,P)
   & coll(S,P,Pp)
   & inter(M,S,N,Q,T)
   & inter(N,P,M,S,R)
   & cmark_b(M)
   & cmark_b(N)
   & cmark_b(S)
   & cmark_b(Q)
   & cmark_b(T)
   & cmark_b(R)
   & cmark_b(P)
   & drawsegment(M,N)
   & drawsegment(Q,S)
   & drawsegment(M,Q)
   & drawsegment(N,P)
   & drawsegment(M,S)
   & drawsegment(M,Q)
   & drawsegment(N,Q)
   & prooflevel(1)) 
 => 
   sum(sratio(M,T,M,R),sratio(M,T,M,S)) = 1)).

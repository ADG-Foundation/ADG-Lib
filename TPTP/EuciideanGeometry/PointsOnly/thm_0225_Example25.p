% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0225_Example25.p; Output: thm_0225_Example25.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0225_Example25.p; Output: tmp_2_thm_0225_Example25.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0225_Example25
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,F,D,E,P,Q,R,X,Y,Z] : ((
   dimensions(150,110)
   & freepoint(A,20,20)
   & freepoint(B,70,20)
   & freepoint(C,60,70)
   & coll(F,A,B)
   & coll(D,B,C)
   & inter(F,D,A,C,E)
   & midp(P,E,F)
   & midp(Q,F,D)
   & midp(R,D,E)
   & inter(A,P,B,C,X)
   & inter(B,Q,A,C,Y)
   & inter(C,R,A,B,Z)
   & drawdashline(X,Y)
   & cmark_lb(X)
   & cmark_t(Y)
   & cmark_b(Z)
   & cmark_r(P)
   & cmark_l(Q)
   & cmark_r(R)
   & cmark_t(E)
   & cmark_b(F)
   & cmark_r(D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & drawsegment(A,P)
   & drawsegment(B,Y)
   & drawsegment(C,Z)
   & drawsegment(A,Z)
   & drawsegment(C,B)
   & drawsegment(A,E)
   & drawsegment(F,E)
   & prooflevel(1)) 
 => 
   collinear(X,Y,Z))).

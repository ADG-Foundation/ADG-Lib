% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0203_Example3.p; Output: thm_0203_Example3.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0203_Example3.p; Output: tmp_2_thm_0203_Example3.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0203_Example3
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,E,J,G,K,I,L,H,F,O] : ((
   dimensions(100,100)
   & freepoint(A,20,20)
   & freepoint(B,55,20)
   & coll(C,A,B)
   & freepoint(D,40.2,47.2)
   & freepoint(E,53.3,37.5)
   & inter(A,E,C,D,J)
   & inter(A,D,B,E,G)
   & inter(B,D,E,C,K)
   & inter(A,E,B,D,I)
   & inter(C,D,B,E,L)
   & inter(E,C,A,D,H)
   & inter(D,E,A,B,F)
   & inter(J,H,I,G,O)
   & cmark_rb(A)
   & cmark_b(B)
   & cmark_lb(C)
   & cmark_t(D)
   & cmark_rb(E)
   & cmark_lb(J)
   & cmark_lt(G)
   & cmark_r(K)
   & cmark_b(I)
   & cmark_r(L)
   & cmark_rb(H)
   & cmark_b(F)
   & cmark_r(O)
   & drawline(O,E)
   & drawline(O,L)
   & drawdashline(A,B)
   & drawdashline(A,E)
   & drawdashline(C,D)
   & drawdashline(A,D)
   & drawdashline(E,C)
   & drawdashsegment(I,G)
   & drawdashsegment(J,H)
   & prooflevel(1)) 
 => 
   collinear(O,E,D))).

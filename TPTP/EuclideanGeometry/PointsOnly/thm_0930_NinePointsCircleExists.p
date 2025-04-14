% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0930_NinePointsCircleExists.p; Output: thm_0930_NinePointsCircleExists.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0930_NinePointsCircleExists.p; Output: tmp_2_thm_0930_NinePointsCircleExists.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0930_NinePointsCircleExists
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,E,F,G,J,I,H,K,L,M,O] : ((
   dimensions(110,110)
   & freepoint(A,20,20)
   & freepoint(B,90,20)
   & freepoint(C,80,100)
   & foot(D,A,B,C)
   & foot(E,B,A,C)
   & foot(F,C,A,B)
   & midp(G,A,B)
   & midp(J,B,C)
   & midp(I,C,A)
   & inter(A,D,B,E,H)
   & midp(K,A,H)
   & midp(L,B,H)
   & midp(M,C,H)
   & inter(K,J,G,M,O)
   & drawcircle(O,G)
   & drawdashline(K,J)
   & drawdashline(G,M)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_r(D)
   & cmark_l(E)
   & cmark_b(F)
   & cmark_b(G)
   & cmark_lb(H)
   & cmark_t(I)
   & cmark_r(J)
   & cmark_lb(M)
   & cmark_b(K)
   & cmark_t(L)
   & cmark_t(O)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(B,C)
   & drawsegment(A,D)
   & drawsegment(B,E)
   & drawsegment(C,F)
   & prooflevel(1)) 
 => 
   perpNS(G,M,G,E))).

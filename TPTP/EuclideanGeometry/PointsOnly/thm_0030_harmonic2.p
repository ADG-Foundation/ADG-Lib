% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0030_harmonic2.p; Output: thm_0030_harmonic2.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0030_harmonic2.p; Output: tmp_2_thm_0030_harmonic2.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0030_harmonic2
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,L,K,F,G] : ((
   dimensions(130,50)
   & freepoint(A,30,32)
   & freepoint(B,40,40)
   & freepoint(C,48,28)
   & freepoint(D,40,25)
   & cmark_lt(A)
   & cmark_t(B)
   & cmark_rt(C)
   & cmark_lb(D)
   & inter(A,B,C,D,L)
   & cmark_b(L)
   & inter(A,D,B,C,K)
   & cmark_b(K)
   & inter(B,D,K,L,F)
   & cmark_b(F)
   & inter(A,C,K,L,G)
   & cmark_b(G)
   & drawsegment(B,L)
   & drawsegment(C,L)
   & drawsegment(A,K)
   & drawsegment(B,K)
   & drawsegment(B,F)
   & drawsegment(A,G)
   & drawdashline(L,K)
   & prooflevel(1)) 
 => 
   harmonic(L,K,F,G))).

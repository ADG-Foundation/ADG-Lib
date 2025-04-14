% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0255_Example55.p; Output: thm_0255_Example55.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0255_Example55.p; Output: tmp_2_thm_0255_Example55.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0255_Example55
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,M,N,P,P1,P2,P3,P_1,M_1,N_1] : ((
   dimensions(130,110)
   & freepoint(A,20,20)
   & freepoint(B,110,20)
   & freepoint(C,80,90)
   & coll(M,A,B)
   & coll(N,B,C)
   & coll(P,A,C)
   & paraS(P1,P,A,B)
   & paraS(P2,N,A,C)
   & paraS(P3,M,B,C)
   & inter(P1,P,B,C,P_1)
   & inter(P3,M,A,C,M_1)
   & inter(P2,N,A,B,N_1)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_rt(N)
   & cmark_b(M)
   & cmark_lt(P)
   & cmark_rt(P_1)
   & cmark_b(N_1)
   & cmark_lt(M_1)
   & drawsegment(A,B)
   & drawsegment(A,C)
   & drawsegment(C,B)
   & drawsegment(P,P_1)
   & drawsegment(M,M_1)
   & drawsegment(N,N_1)
   & drawdashsegment(M,N)
   & drawdashsegment(M,P)
   & drawdashsegment(P,N)
   & drawdashsegment(M_1,N_1)
   & drawdashsegment(M_1,P_1)
   & drawdashsegment(P_1,N_1)
   & prooflevel(1)) 
 => 
   signed_area3(M,N,P) = signed_area3(M_1,N_1,P_1))).

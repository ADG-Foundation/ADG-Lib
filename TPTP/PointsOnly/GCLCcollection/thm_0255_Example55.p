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
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 55 iz \cite{chou} 
%  thmnamee Example 55 from \cite{chou} 
%  thmtext Dat je trougao $ABC$ i ta\ch ke $M$, $N$ i $P$ 
%  thmtext na stranicama $AB$, $BC$ i $CA$ redom.  
%  thmtext Neka su $M_1$, $N_1$ i $P_1$ ta\ch ke na pravama 
%  thmtext $CA$, $AB$ i $BC$ takve da je $MM_1 \parallel BC$, 
%  thmtext $NN_1 \parallel AC$ i $PP_1 \parallel AB$. 
%  thmtext Dokazati da su povr\sh ine trouglova $MNP$ i 
%  thmtext $M_1N_1P_1$ jednake. 
%  thmtexte Let $M$, $N$, $P$ be points on the sides $AB$, $BC$ and $AC$ 
%  thmtexte of a triangle $ABC$. Show that if $M_1$, $N_1$ and $P_1$ 
%  thmtexte are points on sides $AC$, $BA$ and $BC$ of a triangle 
%  thmtexte $ABC$ such that $MM_1 \parallel BC$, $NN_1 \parallel CA$ 
%  thmtexte and $PP_1 \parallel AB$, then triangles $MNP$ and 
%  thmtexte $M_1N_1P_1$ have equal areas. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,M,N,P,P1,P2,P3,P_1,M_1,N_1] : ((
   dimensions(130, 110)
   & freepoint(A, 20, 20)
   & freepoint(B, 110, 20)
   & freepoint(C, 80, 90)
   & collinear(M, A, B)
   & collinear(N, B, C)
   & collinear(P, A, C)
   & parallel(P1, P, A, B)
   & parallel(P2, N, A, C)
   & parallel(P3, M, B, C)
   & intersection(P1, P, B, C, P_1)
   & intersection(P3, M, A, C, M_1)
   & intersection(P2, N, A, B, N_1)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_rt(N)
   & cmark_b(M)
   & cmark_lt(P)
   & cmark_rt(P_1)
   & cmark_b(N_1)
   & cmark_lt(M_1)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(P, P_1)
   & drawsegment(M, M_1)
   & drawsegment(N, N_1)
   & drawdashsegment(M, N)
   & drawdashsegment(M, P)
   & drawdashsegment(P, N)
   & drawdashsegment(M_1, N_1)
   & drawdashsegment(M_1, P_1)
   & drawdashsegment(P_1, N_1)
   & prooflevel(1)) 
 => 
   signed_area3(M, N, P) = signed_area3(M_1, N_1, P_1))).

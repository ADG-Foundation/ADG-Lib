% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0285_Example85.p; Output: thm_0285_Example85.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0285_Example85.p; Output: tmp_2_thm_0285_Example85.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0285_Example85
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 85 iz \cite{chou} 
%  thmnamee Example 85 from \cite{chou} 
%  thmtext Dat je paralelogram $ABCD$. Neka su $P$ i $Q$ 
%  thmtext ta\ch ke na stranicama $BC$ i $AD$ takve da je 
%  thmtext $PQ \parallel AB$. Neka su dalje $M = BQ \cap AP$ 
%  thmtext i $N = CQ \cap PD$. Dokazati da je $MN$ paralelna 
%  thmtext sa $AD$ i jednaka polovini te stranice. 
%  thmnote Kada se doka\zh e paralelnost, druga pretpostavka 
%  thmnote se dokazuje kroz odnos du\zh i. 
%  thmtexte Let $P$ and $Q$ be two points on side $BC$ 
%  thmtexte and $AD$ of a parallelogram such that 
%  thmtexte $PQ \parallel AB$; $M = AP \cap BQ$, 
%  thmtexte $N = DP \cap QC$. Show that $MN \parallel AD$ 
%  thmtexte and $MN = AD/2$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,ab,bc,P1,P2,D,P,P3,Q,pd,qc,N,pa,qb,M] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 110, 70)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & parallel(P1, A, B, C)
   & parallel(P2, C, A, B)
   & intersection(D, P1, A, P2, C)
   & collinear(P, B, C)
   & parallel(P3, P, A, B)
   & intersection(Q, P3, P, P1, A)
   & newline(pd, P, D)
   & newline(qc, Q, C)
   & intersection(N, P, D, Q, C)
   & newline(pa, P, A)
   & newline(qb, Q, B)
   & intersection(M, P, A, Q, B)
   & cmark_b(M)
   & cmark_b(A)
   & cmark_t(N)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & cmark_r(P)
   & cmark_l(Q)
   & drawsegment(P, D)
   & drawsegment(P, A)
   & drawsegment(Q, C)
   & drawsegment(B, Q)
   & drawsegment(P, Q)
   & drawsegment(A, B)
   & drawsegment(A, D)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawdashsegment(M, N)
   & prooflevel(1)) 
 => 
   sratio(A, D, M, N) = 2)).

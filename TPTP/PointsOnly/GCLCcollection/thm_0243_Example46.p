% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0243_Example46.p; Output: thm_0243_Example46.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0243_Example46.p; Output: tmp_2_thm_0243_Example46.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0243_Example46
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 46 iz \cite{chou} 
%  thmnamee Example 46 from \cite{chou} 
%  thmtext Dat je paralelogram $ABEFD$. Na dvema paralelnim 
%  thmtext stranicama $AE$ i $BD$ date su ta\ch ke $C$ i $F$. 
%  thmtext Neka je $M$ presek pravih $CD$ i $AF$ i neka je 
%  thmtext $N$ presek pravih $BC$ i $EF$. Neka su dalje $P$ 
%  thmtext i $Q$ preseci prave $MN$ sa stranicama paralelograma 
%  thmtext $AD$ i $BE$. Dokazati da su du\zh i $AP$ i 
%  thmtext $BQ$ jednake. 
%  thmnote Dovoljno je dokazati da su du\zh i 
%  thmnote $AP$ i $BQ$ paralelne i istog odnosa. 
%  thmtexte Let $C$ and $F$ be any points on the respective 
%  thmtexte sides $AE$ and $BD$ of a parallelogram $ABCD$. 
%  thmtexte Let $M$ and $N$ denote the points of intersection 
%  thmtexte of $CD$ and $FA$ and of $EF$ and $BC$. Let the line 
%  thmtexte $MN$ meet $DA$ at $P$ and $EB$ at $Q$. Then $AP \cong QB$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,E,B,C,ae,P1,be,P2,D,F,cd,af,M,ef,bc,N,mn,P,Q,pq] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(E, 80, 20)
   & freepoint(B, 95, 70)
   & collinear(C, A, E)
   & newline(ae, A, E)
   & parallel(P1, B, A, E)
   & newline(be, B, E)
   & parallel(P2, A, B, E)
   & intersection(D, P1, B, P2, A)
   & collinear(F, D, B)
   & newline(cd, C, D)
   & newline(af, A, F)
   & intersection(M, C, D, A, F)
   & newline(ef, E, F)
   & newline(bc, B, C)
   & intersection(N, E, F, B, C)
   & newline(mn, M, N)
   & intersection(P, M, N, P2, A)
   & intersection(Q, M, N, B, E)
   & newline(pq, P, Q)
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
   & drawsegment(A, E)
   & drawsegment(E, B)
   & drawsegment(B, D)
   & drawsegment(D, A)
   & drawdashsegment(D, C)
   & drawdashsegment(A, F)
   & drawdashsegment(E, F)
   & drawdashsegment(C, B)
   & drawline(P, Q)
   & prooflevel(1)) 
 => 
   sratio(A, P, Q, B) = 1)).

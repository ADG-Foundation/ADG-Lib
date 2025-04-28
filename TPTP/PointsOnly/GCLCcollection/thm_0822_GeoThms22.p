% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0822_GeoThms22.p; Output: thm_0822_GeoThms22.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0822_GeoThms22.p; Output: tmp_2_thm_0822_GeoThms22.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0822_GeoThms22
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 22 iz \cite{geothms} 
%  thmnamee Example 22 from \cite{geothms} 
%  thmtext Dat je paralelogram $ABCD$. Ta\ch ka $N$ je konstruisana 
%  thmtext kao presek prave povu\ch ene iz $C$ paralelne sa dijagonalom 
%  thmtext $BD$ i prave povu\ch ene iz $A$ normalne na dijagonalu $BD$. 
%  thmtext Prave $AN$ i $BN$ seku pravu $CD$ u ta\ch kama $P$ i $Q$. 
%  thmtext Dokazati da je $Q$ sredi\sh te du\zh i $CP$. 
%  thmtexte Given a parallelogram $ABCD$, a point $N$, 
%  thmtexte obtained by the intersection of a line parallel 
%  thmtexte to $BD$ passing through $C$, and a line perpendicular 
%  thmtexte to $BD$ passing through $A$, then the point $Q$, 
%  thmtexte which is given by the intersection of $BN$ and $CD$, 
%  thmtexte is the midpoint of $PC$, where $P$ is the intersection 
%  thmtexte of $CD$ and $AN$, 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,ab,bc,P1,P2,D,bd,P3,P4,N,bn,P,Q] : ((
   dimensions(110, 90)
   & freepoint(A, 20, 20)
   & freepoint(B, 70, 20)
   & freepoint(C, 85, 60)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & parallel(P1, A, B, C)
   & parallel(P2, C, A, B)
   & intersection(D, P1, A, P2, C)
   & newline(bd, B, D)
   & parallel(P3, C, B, D)
   & perpendicular(P4, A, B, D)
   & intersection(N, P3, C, P4, A)
   & newline(bn, B, N)
   & intersection(P, P2, C, P4, A)
   & intersection(Q, B, N, P2, C)
   & drawline(P3, C)
   & drawline(P4, A)
   & drawsegment(A, N)
   & drawsegment(B, N)
   & drawsegment(B, D)
   & cmark_lt(P)
   & cmark_lb(Q)
   & cmark_t(N)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawsegment(A, D)
   & prooflevel(1)) 
 => 
   sratio(P, Q, Q, C) = 1)).

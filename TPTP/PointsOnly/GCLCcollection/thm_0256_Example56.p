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
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 56 iz \cite{chou} 
%  thmnamee Example 56 from \cite{chou} 
%  thmtext Dat je paralelogram $MNPQ$. Prava koja 
%  thmtext prolazi kroz $M$ se\ch e prave $PQ$, 
%  thmtext $NP$ i $NQ$ u ta\ch kama $S$, $R$ i $T$. 
%  thmtext Dokazati da je 
%  thmtext $\frac{1}{\overline{MR}} +  
%  thmtext \frac{1}{\overline{MS}} = 
%  thmtext \frac{1}{\overline{MT}}$. 
%  thmnote Po\sh to se ta\ch ke $M$, $R$, $S$ i $T$  
%  thmnote nalaze na istoj pravoj, dovoljno je 
%  thmnote dokazati da je 
%  thmnote $\frac{\overline{MT}}{\overline{MR}} + 
%  thmnote \frac{\overline{MT}}{\overline{MS}} = 1$. 
%  thmtexte Let $l$ be a line passing through the vertex 
%  thmtexte of $M$ of a parallelogram $MNPQ$ and intersecting 
%  thmtexte the lines $NP$, $PQ$, $NQ$ in points $R$, $S$, $T$. 
%  thmtexte Show that $1/MR + 1/MS = 1/MT$. 

include('geo.ax').
fof(thm, conjecture, ! [ M,N,P,P1,P2,Q,Pp,S,T,R] : ((
   dimensions(130, 60)
   & freepoint(M, 20, 20)
   & freepoint(N, 70, 20)
   & freepoint(P, 85, 45)
   & parallel(P1, P, M, N)
   & parallel(P2, M, N, P)
   & intersection(P1, P, P2, M, Q)
   & translate(Pp, M, N, P)
   & collinear(S, P, Pp)
   & intersection(M, S, N, Q, T)
   & intersection(N, P, M, S, R)
   & cmark_b(M)
   & cmark_b(N)
   & cmark_b(S)
   & cmark_b(Q)
   & cmark_b(T)
   & cmark_b(R)
   & cmark_b(P)
   & drawsegment(M, N)
   & drawsegment(Q, S)
   & drawsegment(M, Q)
   & drawsegment(N, P)
   & drawsegment(M, S)
   & drawsegment(M, Q)
   & drawsegment(N, Q)
   & prooflevel(1)) 
 => 
   sum(sratio(M, T, M, R), sratio(M, T, M, S)) = 1)).

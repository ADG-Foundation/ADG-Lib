% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0300_Example5_1.p; Output: thm_0300_Example5_1.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0300_Example5_1.p; Output: tmp_2_thm_0300_Example5_1.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0300_Example5_1
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 5.1 iz \cite{chou} 
%  thmnamee Example 5.1 from \cite{chou} 
%  thmtext Dat je kvadrat $ABCD$. Na pravoj koja 
%  thmtext prolazi kroz teme $C$ i paralelna je 
%  thmtext dijagonali kvadrata $BD$ izabrana je 
%  thmtext ta\ch ka $E$ takva da je $BD \cong BE$. 
%  thmtext Neka je $F$ presek prave $BE$ i prave $CD$. 
%  thmtext Dokazati da je $DE \cong DF$. 
%  thmtexte Let $ABCD$ be a square. $CG$ is parallel 
%  thmtexte to the diagonal $BD$. Point $E$ is on 
%  thmtexte $CG$ such that $BE \cong BD$. $F$ is the 
%  thmtexte intersection of $BE$ and $DC$. Show that 
%  thmtexte $DF \cong DE$. 
%  thmnote Ova teorema ima dve razli\ch ite slike 
%  thmnote (pogledati ta\ch ke $E_1$ i $F_1$). 
%  thmnote Algebarski dokaz za obe konfiguracije je isti, 
%  thmnote dok se elementarni dokaz razlikuje u zavisnosti 
%  thmnote od izabrane slike. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,ab,P1,k,D_1,D,P2,P3,C,d,P4,k1,E_1,E,be,cd,F,be1,F_1] : ((
   dimensions(110, 60)
   & freepoint(A, 59, 20)
   & freepoint(B, 78, 20)
   & newline(ab, A, B)
   & perpendicular(P1, A, A, B)
   & newcircle(k, A, B)
   & intersection_cl(D, D_1, A, B, P1, A)
   & perpendicular(P2, D, P1, A)
   & perpendicular(P3, B, A, B)
   & intersection(C, P2, D, P3, B)
   & newline(d, B, D)
   & parallel(P4, C, B, D)
   & newcircle(k1, B, D)
   & intersection_cl(E, E_1, B, D, P4, C)
   & newline(be, B, E)
   & newline(cd, C, D)
   & intersection(F, B, E, C, D)
   & newline(be1, B, E_1)
   & intersection(F_1, B, E_1, C, D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(D)
   & cmark_t(C)
   & cmark_t(E)
   & cmark_lb(F)
   & cmark_rt(E_1)
   & cmark_t(F_1)
   & drawsegment(A, B)
   & drawsegment(A, D)
   & drawsegment(C, B)
   & drawsegment(F_1, C)
   & drawsegment(B, D)
   & drawsegment(B, E)
   & drawsegment(E, D)
   & drawsegment(C, E)
   & drawsegment(E, E_1)
   & drawsegment(F_1, E_1)
   & drawdashsegment(D, E_1)
   & prooflevel(1)) 
 => 
   length(D, F) = length(D, E))).

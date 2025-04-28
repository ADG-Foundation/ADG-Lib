% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0323_Example123.p; Output: thm_0323_Example123.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0323_Example123.p; Output: tmp_2_thm_0323_Example123.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0323_Example123
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 123 iz \cite{chou} 
%  thmnamee Example 123 from \cite{chou} 
%  thmtext Neka je $P$ proizvoljna ta\ch ka 
%  thmtext na polukrugu sa pre\ch nikom $AB$. 
%  thmtext Ako su $C$ i $D$ ta\ch ke na polukrugu 
%  thmtext takve da su lukovi $BC$ i $CD$ jednaki, 
%  thmtext i ako su $E$ i $F$ prese\ch ne ta\ch ke 
%  thmtext pravih $AC$ i $PB$, odnosno pravih $AD$ 
%  thmtext i $PC$, dokazati da se prave $EF$ i 
%  thmtext $AD$ seku pod pravim uglom. 
%  thmtexte If $P$ is any point on a semicircle, 
%  thmtexte diameter $AB$, and $BC$, $CD$ are two 
%  thmtexte equal arcs, then if $E = CA \cap PB$, 
%  thmtexte $F = AD \cap PC$, prove that $AD$ 
%  thmtexte is perpendicular to $EF$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,O,k,D,Dp,P11,P22,C1,C,P,Pp,pb,ca,E,ad,pc,F] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 55)
   & freepoint(B, 90, 55)
   & midpoint(O, A, B)
   & newcircle(k, O, A)
   & freepoint(D, 32.62, 81.91)
   & on_circle(Dp, O, A)
   & midpoint(P11, B, D)
   & on_segment_bisector(P22, B, D)
   & intersection_cl(C, C1, O, A, P11, P22)
   & freepoint(P, 22.36, 67.63)
   & on_circle(Pp, O, A)
   & newline(pb, P, B)
   & newline(ca, C, A)
   & intersection(E, C, A, P, B)
   & newline(ad, A, D)
   & newline(pc, P, C)
   & intersection(F, A, D, P, C)
   & cmark_l(P)
   & cmark_lt(F)
   & cmark_b(E)
   & cmark_t(D)
   & cmark_rt(C)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_b(O)
   & drawsegment(A, B)
   & drawcircle(O, A)
   & drawsegment(A, D)
   & drawsegment(A, C)
   & drawsegment(P, B)
   & drawsegment(P, C)
   & drawdashsegment(F, E)
   & prooflevel(1)) 
 => 
   perpendicular(E, F, A, D))).

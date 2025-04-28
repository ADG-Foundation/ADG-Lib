% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0350_Example150.p; Output: thm_0350_Example150.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0350_Example150.p; Output: tmp_2_thm_0350_Example150.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0350_Example150
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 150 iz \cite{chou} 
%  thmnamee Example 150 from \cite{chou} 
%  thmtext Neka je $G$ te\zh i\sh te trougla $ABC$ i 
%  thmtext neka je $M$ proizvoljna ta\ch ka u ravni. 
%  thmtext Dokazati da je: 
%  thmtext $3 \cdot MG^2 + AG^2 + BG^2 + CG^2 = AM^2 + BM^2 + CM^2$. 
%  thmtexte If $G$ is a centroid of triangle $ABC$, 
%  thmtexte show that for any given point $M$: 
%  thmtexte $3 \cdot MG^2 + AG^2 + BG^2 + CG^2 = AM^2 + BM^2 + CM^2$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,M,F,E,D,cf,ad,G] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 40, 88)
   & freepoint(M, 93, 90)
   & midpoint(F, A, B)
   & midpoint(E, A, C)
   & midpoint(D, B, C)
   & newline(cf, C, F)
   & newline(ad, A, D)
   & intersection(G, A, D, C, F)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_t(M)
   & cmark_lt(G)
   & cmark_b(F)
   & cmark_lt(E)
   & cmark_rt(D)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(M, B)
   & drawsegment(C, M)
   & drawsegment(C, F)
   & drawsegment(A, D)
   & drawsegment(B, E)
   & drawsegment(G, M)
   & prooflevel(1)) 
 => 
   sum(mult(length(M, G), 3), sum(length(A, G), sum(length(C, G), length(B, G)))) = sum(length(A, M), sum(length(B, M), length(C, M))))).

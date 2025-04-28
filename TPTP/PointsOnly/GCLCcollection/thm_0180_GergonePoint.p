% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0180_GergonePoint.p; Output: thm_0180_GergonePoint.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0180_GergonePoint.p; Output: tmp_2_thm_0180_GergonePoint.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0180_GergonePoint
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Gergonova ta\ch ka 
%  thmnamee Gergonne point 
%  thmtext Upisani krug trougla $ABC$ dodiruje stranice 
%  thmtext trougla $BC$, $CA$ i $AB$ redom u 
%  thmtext ta\ch kama $D$, $E$ i $F$. Dokazati da su 
%  thmtext prave $AD$, $BE$ i $CF$ konkuretne. 
%  thmtexte Assume the incircle of $\triangle ABC$ touches the  
%  thmtexte sides $BC$, $AC$ and $AB$ in points  
%  thmtexte $D$, $E$ and $F$ respectively.  
%  thmtexte Show that lines $AD$, $BE$ and $CF$ meet at the Gergonne  
%  thmtexte point $G$ of the triangle.  

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,P3,a,b,c,I,D,E,F,k,ad,be,cf,G] : ((
   dimensions(100, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 70, 70)
   & on_angle_bisector(P1, B, A, C)
   & on_angle_bisector(P2, C, B, A)
   & on_angle_bisector(P3, A, C, B)
   & newline(a, B, C)
   & newline(b, A, C)
   & newline(c, A, B)
   & intersection(I, P1, A, P2, B)
   & foot(D, I, B, C)
   & foot(E, I, A, C)
   & foot(F, I, A, B)
   & newcircle(k, I, F)
   & newline(ad, A, D)
   & newline(be, B, E)
   & newline(cf, C, F)
   & intersection(G, A, D, B, E)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(F)
   & cmark_lt(E)
   & cmark_rt(D)
   & cmark_lt(G)
   & drawcircle(I, F)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, A)
   & drawdashsegment(A, D)
   & drawdashsegment(B, E)
   & drawdashsegment(C, F)
   & prooflevel(1)) 
 => 
   collinear(C, F, G))).

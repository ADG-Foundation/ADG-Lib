% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0319_Example119.p; Output: thm_0319_Example119.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0319_Example119.p; Output: tmp_2_thm_0319_Example119.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0319_Example119
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 119 iz \cite{chou} 
%  thmnamee Example 119 from \cite{chou} 
%  thmtext Neka je $P$ ta\ch ka na krugu opisanom oko 
%  thmtext jednakostrani\ch nog trougla $ABC$. Dokazati da me\dj u 
%  thmtext tri du\zh i $PA$, $PB$ i $PC$, jedna je jednaka 
%  thmtext sumi druge dve. 
%  thmnote Dovoljno je pokazati da je algebarska suma du\zh i 
%  thmnote $PA$, $PB$ i $PC$ jednaka nuli. 
%  thmtexte Of the three lines joining the vertices 
%  thmtexte of an equilateral triangle to a point 
%  thmtexte on its circumcircle, one is equal to the 
%  thmtexte sum of the other two. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,k,P11,P22,C1,C,P13,P24,O,k1,P] : ((
   dimensions(110, 100)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & newcircle(k, A, B)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & intersection_cl(C, C1, A, B, P11, P22)
   & midpoint(P13, A, C)
   & on_segment_bisector(P24, A, C)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k1, O, A)
   & on_circle(P, O, A)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_rt(P)
   & cmark_b(O)
   & cmark_t(C)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawdashsegment(P, A)
   & drawdashsegment(P, B)
   & drawdashsegment(P, C)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   alg_sum_zero3(length(P, A), length(P, B), length(P, C)))).

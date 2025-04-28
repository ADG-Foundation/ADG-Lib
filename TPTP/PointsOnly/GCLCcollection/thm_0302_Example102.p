% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0302_Example102.p; Output: thm_0302_Example102.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0302_Example102.p; Output: tmp_2_thm_0302_Example102.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0302_Example102
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 102 iz \cite{chou} 
%  thmnamee Example 102 from \cite{chou} 
%  thmtext Dve tangente povu\ch ene iz $A$ i $C$ 
%  thmtext na opisan kruga trougla $ABC$ seku 
%  thmtext se u ta\ch ki $E$. Neka je $D$ presek 
%  thmtext simetrale du\zh i $BC$ i prave $AB$. 
%  thmtext Dokazati da je $DE \parallel BC$. 
%  thmtexte The two tangents to the circumcircle 
%  thmtexte of $ABC$ at $A$ and $C$ meet at $E$. 
%  thmtexte The mediator of $BC$ meet $AB$ 
%  thmtexte at $D$. Show that $DE \parallel BC$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P11,P22,P13,P24,O,k,a,H,c,D,ao,co,P5,P6,E] : ((
   dimensions(110, 85)
   & freepoint(A, 35, 25)
   & freepoint(B, 90, 25)
   & freepoint(C, 58, 68)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & midpoint(P13, A, B)
   & on_segment_bisector(P24, A, B)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, A)
   & newline(a, B, C)
   & intersection(H, P11, P22, B, C)
   & newline(c, A, B)
   & intersection(D, P11, P22, A, B)
   & newline(ao, A, O)
   & newline(co, C, O)
   & perpendicular(P5, A, A, O)
   & perpendicular(P6, C, C, O)
   & intersection(E, P5, A, P6, C)
   & cmark_t(E)
   & cmark_b(D)
   & cmark_rb(O)
   & drawcircle(O, A)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_rt(H)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(A, O)
   & drawsegment(C, O)
   & drawsegment(A, E)
   & drawsegment(C, E)
   & drawsegment(D, H)
   & drawdashsegment(D, E)
   & prooflevel(1)) 
 => 
   parallel(D, E, B, C))).

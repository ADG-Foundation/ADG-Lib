% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0237_Example37.p; Output: thm_0237_Example37.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0237_Example37.p; Output: tmp_2_thm_0237_Example37.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0237_Example37
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 37 iz \cite{chou} 
%  thmnamee Example 37 from \cite{chou} 
%  thmtext Iz ta\ch ke $P$ su povu\ch ene tangente 
%  thmtext $PT$ i $PB$ na krug $k$ sa centrom $O$. 
%  thmtext Neka je $BA$ pre\ch nik kruga $k$ i neka 
%  thmtext je $H$ normala spu\sh tena iz $T$ na pre\ch nik 
%  thmtext $AB$. Dokazati da prava $AP$ polovi du\zh \ $TH$. 
%  thmnote Konstrukcija u dokazu je izvedena na druga\cj ini 
%  thmnote na\ch in, polaze\cj i od pre\ch nika $AB$ i odabirom 
%  thmnote proizvoljne ta\ch ke $T$ na krugu (pogledati koordinate 
%  thmnote ta\ch aka u konstrukciji). 
%  thmtexte Let $PT$ and $PB$ be two tangents to a circle, 
%  thmtexte $AB$ the diameter through $B$, and $TH$ 
%  thmtexte the perpendicular from $T$ to $AB$. Then 
%  thmtexte $AP$ bisects $TH$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,O,k,T,Tp,ab,P1,ot,P2,P,H,th,ap,I] : ((
   dimensions(130, 110)
   & freepoint(A, 30, 50)
   & freepoint(B, 90, 50)
   & midpoint(O, A, B)
   & newcircle(k, O, A)
   & freepoint(T, 69.1, 78.59)
   & on_circle(Tp, O, A)
   & newline(ab, A, B)
   & perpendicular(P1, B, A, B)
   & newline(ot, O, T)
   & perpendicular(P2, T, O, T)
   & intersection(P, P1, B, P2, T)
   & foot(H, T, A, B)
   & newline(th, T, H)
   & newline(ap, A, P)
   & intersection(I, T, H, A, P)
   & cmark_lb(A)
   & cmark_b(H)
   & cmark_b(O)
   & cmark_rb(B)
   & cmark_r(P)
   & cmark_t(T)
   & cmark_rb(I)
   & drawsegment(A, B)
   & drawsegment(A, P)
   & drawsegment(T, H)
   & drawsegment(T, O)
   & drawsegment(P, B)
   & drawsegment(P, T)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   sratio(T, I, I, H) = 1)).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0275_Example75.p; Output: thm_0275_Example75.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0275_Example75.p; Output: tmp_2_thm_0275_Example75.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0275_Example75
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 75 iz \cite{chou} 
%  thmnamee Example 75 from \cite{chou} 
%  thmtext Na tetivi $AB$ kruga $k$ sa centrom $O$, izabrana je ta\ch ka 
%  thmtext $C$. Neka su $D$ i $E$ preseci normale iz ta\ch ke $C$ na 
%  thmtext pravu $OC$ sa tangentama kruga $k$ iz ta\ch aka $A$ i $B$. 
%  thmtext Dokazati da je $C$ sredi\sh te du\zh i $DE$. 
%  thmtexte Let $C$ be a point on a chord $AB$ of circle $O$. Let $D$ 
%  thmtexte and $E$ be the intersections of perpendiculars of $OC$ 
%  thmtexte through $C$ with the two tangents of the circle at $A$ 
%  thmtexte and $B$, respectively. Show that $CE \cong CD$. 
%  thmnote Dovoljno je pokazati da su projekcije du\zh i $CD$ i $CE$ 
%  thmnote na $x$ osu jednake. 

include('geo.ax').
fof(thm, conjecture, ! [ A,O,B,Bp,k,C,Cp,oc,P1,ob,oa,P2,P3,E,D] : ((
   dimensions(100, 80)
   & freepoint(A, 20, 40)
   & freepoint(O, 50, 40)
   & freepoint(B, 69.2, 63.05)
   & on_circle(Bp, O, A)
   & newcircle(k, O, A)
   & freepoint(C, 52.36, 55.16)
   & collinear(Cp, A, B)
   & newline(oc, O, C)
   & perpendicular(P1, C, O, C)
   & newline(ob, O, B)
   & newline(oa, O, A)
   & perpendicular(P2, B, O, B)
   & perpendicular(P3, A, O, A)
   & intersection(E, P1, C, P2, B)
   & intersection(D, P1, C, P3, A)
   & cmark_t(C)
   & cmark_lb(A)
   & cmark_b(O)
   & cmark_rt(B)
   & cmark_r(E)
   & cmark_lt(D)
   & drawsegment(A, O)
   & drawsegment(B, O)
   & drawsegment(A, B)
   & drawsegment(A, D)
   & drawsegment(B, E)
   & drawsegment(C, O)
   & drawsegment(D, E)
   & drawcircle(O, A)
   & prooflevel(1)) 
 => 
   sratio(D, C, C, E) = 1)).

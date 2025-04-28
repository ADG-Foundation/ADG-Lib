% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0317_Example117.p; Output: thm_0317_Example117.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0317_Example117.p; Output: tmp_2_thm_0317_Example117.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0317_Example117
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 117 iz \cite{chou} 
%  thmnamee Example 117 from \cite{chou} 
%  thmtext Iz ta\ch ke $A$ dve tangente su povu\ch ene na krug 
%  thmtext sa centrom $O$, doti\ch u\cj i krug u ta\ch kama $B$ i $C$. 
%  thmtext Iz proizvoljne ta\ch ke $P$ na krugu, spu\sh tene su 
%  thmtext normale $PE$, $PF$ i $PD$ na prave $AC$, $AB$ i $BC$ 
%  thmtext redom. Dokazati da je: 
%  thmtext $PD^2 = PE \cdot PF$. 
%  thmtexte From a point $A$ two lines are drawn tangent to 
%  thmtexte circle $(O)$ at $B$ and $C$. From a point $P$ on 
%  thmtexte the circle peprendiculars are drawn to $BC$, $AB$ 
%  thmtexte and $AC$. Let $D$, $F$, $E$ be the feet. Show that: 
%  thmtexte $PD^2 = PE \cdot PF$. 
%  thmnote Konstrukcija je izvedena na slede\cj i na\ch in: 
%  thmnote izabrane su proizvoljne nekolinearne ta\ch ke $A$, $B$ i $X$. 
%  thmnote Ta\ch ka $O$ je odre\dj ena kao presek normale iz $B$ na $AB$ 
%  thmnote i simetrale ugla $BAX$. Ta\ch ka $C$ je podno\zh je normale 
%  thmnote iz $O$ na $AX$. Ta\ch ka $P$ je izabrana proizvoljno na 
%  thmnote krugu sa polupre\ch nikom $OB$, i $E$, $F$, $D$ su 
%  thmnote podno\zh ja normala iz $P$ na $AC$, $AB$ i $BC$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,ab,X,ac,P1,P2,O,C,k,P,Pp,bc,F,E,D] : ((
   dimensions(110, 90)
   & freepoint(A, 20, 20)
   & freepoint(B, 70, 20)
   & newline(ab, A, B)
   & freepoint(X, 60, 70)
   & newline(ac, A, X)
   & on_angle_bisector(P1, B, A, X)
   & perpendicular(P2, B, A, B)
   & intersection(O, P2, B, P1, A)
   & foot(C, O, A, X)
   & newcircle(k, O, B)
   & freepoint(P, 46.05, 42.01)
   & on_circle(Pp, O, B)
   & newline(bc, B, C)
   & foot(F, P, A, B)
   & foot(E, P, A, X)
   & foot(D, P, B, C)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_rt(O)
   & cmark_lt(C)
   & cmark_rt(D)
   & cmark_b(F)
   & cmark_lt(E)
   & cmark_lb(P)
   & drawcircle(O, B)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(O, B)
   & drawsegment(O, C)
   & drawsegment(C, B)
   & drawsegment(P, F)
   & drawsegment(P, E)
   & drawsegment(P, D)
   & prooflevel(1)) 
 => 
   mult(length(P, D), length(P, D)) = mult(length(P, E), length(P, F)))).

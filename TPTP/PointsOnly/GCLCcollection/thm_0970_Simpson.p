% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0970_Simpson.p; Output: thm_0970_Simpson.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0970_Simpson.p; Output: tmp_2_thm_0970_Simpson.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0970_Simpson
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Simsonova teorema 
%  thmnamee Simson's Theorem 
%  thmtext U ravni je dat trougao $ABC$ oko koga je opisan 
%  thmtext krug $k$ sa centrom $O$. Neka je $D$ proizvoljna 
%  thmtext ta\ch ka na krugu $k$ i neka su $E$, $F$ i $G$ 
%  thmtext podno\zh ja normala iz ta\ch ke $D$ na prave 
%  thmtext $AB$, $AC$ i $BC$ redom. Dokazati da su ta\ch ke 
%  thmtext $E$, $F$ i $G$ kolinearne. 
%  thmtexte Let $D$ be a point on the circumscribed 
%  thmtexte cirle $(O)$ of triangle $ABC$. From $D$, three 
%  thmtexte perpendiculars are drawn to the three sides $BC$, 
%  thmtexte $CA$ and $AB$ of triangle $ABC$. Let $E$, $F$ and $G$ 
%  thmtexte be the three feet respectively. Show that $E$, $F$ and $G$ 
%  thmtexte are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ A,O,B,C,D,E,F,G] : ((
   dimensions(100, 100)
   & freepoint(A, 20, 50)
   & freepoint(O, 55, 50)
   & on_circle(B, O, A)
   & on_circle(C, O, A)
   & on_circle(D, O, A)
   & foot(E, D, B, C)
   & foot(F, D, A, C)
   & foot(G, D, A, B)
   & cmark_l(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(D)
   & cmark_t(O)
   & cmark_t(E)
   & cmark_t(F)
   & cmark_t(G)
   & drawsegment(A, B)
   & drawsegment(F, C)
   & drawsegment(C, B)
   & drawcircle(O, A)
   & drawdashsegment(E, D)
   & drawdashsegment(F, D)
   & drawdashsegment(G, D)
   & drawdashline(E, F)
   & prooflevel(1)) 
 => 
   collinear(E, F, G))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0336_Example136.p; Output: thm_0336_Example136.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0336_Example136.p; Output: tmp_2_thm_0336_Example136.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0336_Example136
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 136 iz \cite{chou} 
%  thmnamee Example 136 from \cite{chou} 
%  thmtext Dat je trougao $ABC$ i neka je $CF$ simetrala ugla 
%  thmtext $\angle ACB$ gde je $F$ ta\ch ka na pravoj $AB$. 
%  thmtext Ako su $K$ i $J$ podno\zh ja normala iz temena 
%  thmtext $B$ i $A$ na simetralu $CF$, pokazati da su 
%  thmtext ta\ch ke $C$, $F$, $J$ i $K$ harmonijski spregnute. 
%  thmtexte Show that the internal (or external) bisector of an 
%  thmtexte angle of a triangle is divided harmonically by the 
%  thmtexte feet of the perpendiculars dropped upon it from 
%  thmtexte the two other vertices of the triangle. 
%  thmnote Teorema va\zh i i za unutra\sh nju simetralu 
%  thmnote ugla $\angle C$, kao i za spolja\sh nju simetralu. 
%  thmnote Pogledati alternativnu sliku. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,c,P1,K,J,F,A_1,P2,K_1,J_1,F_1] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 70, 80)
   & newline(c, A, B)
   & on_angle_bisector(P1, A, C, B)
   & foot(K, B, P1, C)
   & foot(J, A, P1, C)
   & intersection(F, A, B, P1, C)
   & towards(A_1, A, C, 2)
   & on_angle_bisector(P2, A_1, C, B)
   & foot(K_1, B, P2, C)
   & foot(J_1, A, P2, C)
   & intersection(F_1, A, B, P2, C)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_rb(F)
   & cmark_rb(J)
   & cmark_l(K)
   & cmark_rb(F_1)
   & cmark_t(J_1)
   & cmark_t(K_1)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, J)
   & drawsegment(B, K)
   & drawsegment(A, J)
   & drawdashsegment(F_1, J_1)
   & drawdashsegment(B, K_1)
   & drawdashsegment(A, J_1)
   & drawdashsegment(C, A_1)
   & prooflevel(1)) 
 => 
   harmonic(C, F, J, K))).

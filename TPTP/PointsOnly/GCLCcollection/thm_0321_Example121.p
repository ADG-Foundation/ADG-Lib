% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0321_Example121.p; Output: thm_0321_Example121.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0321_Example121.p; Output: tmp_2_thm_0321_Example121.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0321_Example121
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 121 iz \cite{chou} 
%  thmnamee Example 121 from \cite{chou} 
%  thmtext Date su \ch etiri nekolinearne ta\ch ke $A$, $B$, $C$ i $D$. 
%  thmtext Prava koja prolazi kroz ta\ch ku $A$ i paralelna 
%  thmtext je sa pravom $BD$ se\ch e pravu $AD$ u ta\ch ki $E$. 
%  thmtext Prava koja prolazi kroz ta\ch ku $E$ i paralelna je sa 
%  thmtext pravom $BC$ se\ch e pravu $AB$ u ta\ch ki $F$. Dokazati 
%  thmtext da je prava $AC$ paralelna sa pravom $DF$. 
%  thmtexte Two parallel line $AE$, $BD$ through the vertices 
%  thmtexte $A$, $B$ of the triangle $ABC$ meet a line through 
%  thmtexte the vertex $C$ in the points $E$, $D$. If the 
%  thmtexte parallel through $E$ to $BC$ meets $AB$ in $F$, 
%  thmtexte show that $DF$ is parallel to $AC$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,P1,E,P2,F] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 35)
   & freepoint(B, 90, 35)
   & freepoint(C, 70, 90)
   & freepoint(D, 50, 20)
   & parallel(P1, A, B, D)
   & intersection(P1, A, C, D, E)
   & parallel(P2, E, B, C)
   & intersection(A, B, P2, E, F)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(D)
   & cmark_r(E)
   & cmark_rb(F)
   & drawsegment(A, B)
   & drawsegment(C, D)
   & drawsegment(C, B)
   & drawsegment(A, E)
   & drawsegment(E, F)
   & drawdashsegment(A, C)
   & drawdashsegment(D, F)
   & prooflevel(1)) 
 => 
   parallel(A, C, D, F))).

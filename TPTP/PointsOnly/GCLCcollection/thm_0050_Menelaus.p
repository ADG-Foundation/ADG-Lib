% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0050_Menelaus.p; Output: thm_0050_Menelaus.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0050_Menelaus.p; Output: tmp_2_thm_0050_Menelaus.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0050_Menelaus
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Menelajeva teorema 
%  thmnamee Menelaus's Theorem 
%  thmtext Dat je trougao $ABC$. Neka su $D$ i $E$ proizvoljne 
%  thmtext ta\ch ke na pravama $BC$ i $AC$ redom. Neka je 
%  thmtext $F$ presek prave $DE$ sa pravom $AB$. Dokazati 
%  thmtext da je 
%  thmtext $\frac{\overline{AF}}{\overline{FB}} 
%  thmtext \frac{\overline{BD}}{\overline{DC}} 
%  thmtext \frac{\overline{CE}}{\overline{EA}} 
%  thmtext = -1$. 
%  thmtexte Line $p$ intersects lines $AB$, $AC$ and $BC$ 
%  thmtexte at points $F$, $E$ and $D$ respectively. Show that: 
%  thmtext $\frac{\overline{AF}}{\overline{FB}} 
%  thmtext \frac{\overline{BD}}{\overline{DC}} 
%  thmtext \frac{\overline{CE}}{\overline{EA}} 
%  thmtext = -1$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,E,F] : ((
   dimensions(100, 80)
   & freepoint(A, 30, 20)
   & freepoint(B, 60, 20)
   & freepoint(C, 40, 50)
   & collinear(D, B, C)
   & collinear(E, A, C)
   & intersection(A, B, D, E, F)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(B, C)
   & drawline(D, E)
   & drawline(A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_rt(D)
   & cmark_lt(E)
   & cmark_rt(F)
   & prooflevel(1)) 
 => 
   mult(mult(sratio(A, F, F, B), sratio(B, D, D, C)), sratio(C, E, E, A)) = -1)).

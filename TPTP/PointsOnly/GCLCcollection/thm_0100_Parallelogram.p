% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0100_Parallelogram.p; Output: thm_0100_Parallelogram.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0100_Parallelogram.p; Output: tmp_2_thm_0100_Parallelogram.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0100_Parallelogram
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Paralelogram teorema 
%  thmnamee Parallelogram Theorem 
%  thmtext U ravni je dat trougao $ABC$. Neka 
%  thmtext je prava $p$ paralela na $BC$ iz ta\ch ke $A$ 
%  thmtext i neka je prava $q$ paralela na $AB$ iz 
%  thmtext tacke $C$. Neka je $D$ presek pravih $p$ i $q$ 
%  thmtext Dokazati da je $\overline{AB} = \overline{DC}$. 
%  thmtexte Given triangle $ABC$, let $p$ be line through $A$ parallel 
%  thmtexte with $BC$, and let $q$ be line through $C$ parallel 
%  thmtexte with $AB$. Let $p$ and $q$ intersects at $D$. Show that 
%  thmtexte $\overline{AB} = \overline{DC}$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D] : ((
   dimensions(130, 70)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 103.4, 55.1)
   & translate(D, B, A, C)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, D)
   & drawsegment(C, D)
   & prooflevel(1)) 
 => 
   sratio(A, B, D, C) = 1)).

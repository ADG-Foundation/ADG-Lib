% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0110_Parallelogram2.p; Output: thm_0110_Parallelogram2.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0110_Parallelogram2.p; Output: tmp_2_thm_0110_Parallelogram2.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0110_Parallelogram2
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Paralelogram teorema 2 
%  thmnamee Parallelogram Theorem 2 
%  thmtext U ravni je dat trougao $ABC$. Neka 
%  thmtext je prava $p$ paralela na $BC$ iz ta\ch ke $A$ 
%  thmtext i neka je prava $q$ paralela na $AVB$ iz 
%  thmtext tacke $C$. Neka je $D$ presek pravih $p$ i $q$ i 
%  thmtext neka je $E$ presek pravih $AC$ i $BCD$. 
%  thmtext Dokazati da je $\overline{AE} = \overline{EC}$. 
%  thmtexte Given triangle $ABC$, let $p$ be line through $A$ parallel 
%  thmtexte with $BC$, and let $q$ be line through $C$ parallel 
%  thmtexte with $AB$. Let $p$ and $q$ intersects at $D$.  
%  thmtexte Let $BD$ intersect $AC$ at $E$. Show that: 
%  thmtexte $\overline{AE} = \overline{EC}$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,D,E] : ((
   dimensions(130, 70)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 97.6, 51.5)
   & parallel(P1, A, B, C)
   & parallel(P2, C, A, B)
   & intersection(P1, A, P2, C, D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, D)
   & drawsegment(C, D)
   & intersection(A, C, B, D, E)
   & cmark_t(E)
   & drawdashsegment(A, C)
   & drawdashsegment(B, D)
   & prooflevel(1)) 
 => 
   congruent_segments(A, E, E, C))).

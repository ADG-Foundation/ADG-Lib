% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0040_Desargues.p; Output: thm_0040_Desargues.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0040_Desargues.p; Output: tmp_2_thm_0040_Desargues.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0040_Desargues
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Dezargova teorema 
%  thmnamee Desargues' theorem 
%  thmtext Ako se prave $A_1B_1$, 
%  thmtext $A_2B_2$ i $A_3B_3$ seku u jednoj ta\ch ki, 
%  thmtext tada su preseci pravih $A_1A_2 \cap B_1B_2$, 
%  thmtext $A_1A_3 \cap B_1B_3$ i $A_2A_3 \cap B_2B_3$ 
%  thmtext tri kolinearne ta\ch ke. 
%  thmtexte If lines $A_1B_1$, $A_2B_2$ and $A_3B_3$ are 
%  thmtexte concurrent, show that intersections 
%  thmtexte $A_1A_2 \cap B_1B_2$, $A_1A_3 \cap B_1B_3$ 
%  thmtexte and $A_2A_3 \cap B_2B_3$ are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ S,A_2,sa2,B_2,A_1,B_1,A_3,B_3,a12,a13,a23,b12,b13,b23,P,Q,R,pqr,sa1,sa3] : ((
   dimensions(110, 90)
   & freepoint(S, 20, 30)
   & freepoint(A_2, 36.6, 30)
   & newline(sa2, S, A_2)
   & collinear(B_2, S, A_2)
   & freepoint(A_1, 27.2, 24.7)
   & collinear(B_1, S, A_1)
   & freepoint(A_3, 42.2, 41.1)
   & collinear(B_3, S, A_3)
   & newline(a12, A_1, A_2)
   & newline(a13, A_1, A_3)
   & newline(a23, A_2, A_3)
   & newline(b12, B_1, B_2)
   & newline(b13, B_1, B_3)
   & newline(b23, B_2, B_3)
   & intersection(P, A_1, A_2, B_1, B_2)
   & intersection(Q, A_1, A_3, B_1, B_3)
   & intersection(R, A_2, A_3, B_2, B_3)
   & newline(pqr, P, Q)
   & drawdashline(P, Q)
   & drawline(A_1, A_2)
   & drawline(A_1, A_3)
   & drawline(A_2, A_3)
   & drawline(B_1, B_2)
   & drawline(B_1, B_3)
   & drawline(B_2, B_3)
   & cmark_t(P)
   & cmark_l(Q)
   & cmark_l(R)
   & cmark_b(A_1)
   & cmark_rb(A_2)
   & cmark_rb(A_3)
   & cmark_b(B_1)
   & cmark_rb(B_2)
   & cmark_rb(B_3)
   & cmark_b(S)
   & newline(sa1, S, A_1)
   & newline(sa2, S, A_2)
   & newline(sa3, S, A_3)
   & drawline(S, A_1)
   & drawline(S, A_2)
   & drawline(S, A_3)
   & prooflevel(1)) 
 => 
   collinear(P, Q, R))).

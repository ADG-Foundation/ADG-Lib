% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0980_Varignon.p; Output: thm_0980_Varignon.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0980_Varignon.p; Output: tmp_2_thm_0980_Varignon.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0980_Varignon
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Vorinjonova teorema 
%  thmnamee Varignon's Theorem 
%  thmtext Dat je \ch etvorougap $ABCD$. Neka su 
%  thmtext $P$, $Q$, $R$ i $S$ sredi\sh ta stranica 
%  thmtext $AB$, $BC$, $CD$ i $DA$ redom. Dokazati 
%  thmtext da je \ch etvorougao $PQRS$ paralelogram. 
%  thmtexte If we draw line segments between the midpoints, 
%  thmtexte in order, of any quadrilateral, we get a parallelogram  
%  thmtexte which has half the area of the original  
%  thmtexte quadrilateral. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,P,Q,R,S] : ((
   dimensions(100, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 70, 70)
   & freepoint(D, 30, 50)
   & midpoint(P, A, B)
   & midpoint(Q, B, C)
   & midpoint(R, C, D)
   & midpoint(S, D, A)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & cmark_b(P)
   & cmark_r(Q)
   & cmark_t(R)
   & cmark_l(S)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawsegment(A, D)
   & drawdashsegment(P, Q)
   & drawdashsegment(R, Q)
   & drawdashsegment(R, S)
   & drawdashsegment(P, S)
   & prooflevel(1)) 
 => 
   parallel(P, Q, R, S))).

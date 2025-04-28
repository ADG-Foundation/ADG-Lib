% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0295_Example95.p; Output: thm_0295_Example95.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0295_Example95.p; Output: tmp_2_thm_0295_Example95.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0295_Example95
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 95 iz \cite{chou} 
%  thmnamee Example 95 from \cite{chou} 
%  thmtext Na krugu $k$ sa centrom $O$ data je tetiva 
%  thmtext $AB$. Neka je $D$ sredi\sh te tetive $AB$ 
%  thmtext i neka je $M$ sredina luka $AB$ kruga $k$. 
%  thmtext Neka je $E$ podno\zh je normale spu\sh tene 
%  thmtext iz $M$ na pravu koja prolazi kroz $A$ i  
%  thmtext normalna je na polupre\ch nik $AO$. 
%  thmtext Dokazati da je $ME \cong MD$. 
%  thmtexte Let $M$ be the midpoint of the arc $AB$ 
%  thmtexte of circle $(O)$, $D$ be the midpoint of 
%  thmtexte $AB$. he perpendicular through $M$ is drawn 
%  thmtexte to the tangent of the circle at $A$ 
%  thmtexte meeting that tangent at $E$. Show $ME \cong MD$. 

include('geo.ax').
fof(thm, conjecture, ! [ D,O,d,M,Mp,k,P1,A,B,p,P2,P3,E] : ((
   dimensions(100, 100)
   & freepoint(D, 50, 33)
   & freepoint(O, 50, 55)
   & newline(d, O, D)
   & freepoint(M, 50, 90)
   & collinear(Mp, O, D)
   & newcircle(k, O, M)
   & perpendicular(P1, D, O, D)
   & intersection_cl(B, A, O, M, P1, D)
   & newline(p, A, O)
   & perpendicular(P2, A, A, O)
   & parallel(P3, M, A, O)
   & intersection(E, P3, M, P2, A)
   & cmark_t(E)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_r(O)
   & cmark_b(D)
   & cmark_t(M)
   & drawcircle(O, M)
   & drawsegment(A, B)
   & drawsegment(A, O)
   & drawsegment(M, D)
   & drawsegment(E, M)
   & drawsegment(A, E)
   & prooflevel(1)) 
 => 
   length(M, E) = length(M, D))).

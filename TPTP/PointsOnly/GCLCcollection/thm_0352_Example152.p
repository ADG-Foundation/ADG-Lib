% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0352_Example152.p; Output: thm_0352_Example152.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0352_Example152.p; Output: tmp_2_thm_0352_Example152.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0352_Example152
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 152 iz \cite{chou} 
%  thmnamee Example 152 from \cite{chou} 
%  thmtext \Ch etiri podno\zh ja normala spu\sh tenih 
%  thmtext iz jednog temena trougla na \ch etiri simetrale 
%  thmtext ugla preostala dva temena (dva unutra\sh nja i dva 
%  thmtext spolja\sh nja ugla) su kolinearna. 
%  thmtexte The feet of the four perpendiculars 
%  thmtexte dropped from a vertex of a triangle 
%  thmtexte upon the four bisectors of the other 
%  thmtexte two angles are collinear. 
%  thmnote Tako\dj e, prava $PQRS$ je paralelna sa pravom $AB$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,P3,P4,P,Q,R,S,p,a] : ((
   dimensions(120, 110)
   & freepoint(A, 30, 30)
   & freepoint(B, 100, 30)
   & freepoint(C, 50, 88)
   & on_angle_bisector(P1, B, A, C)
   & on_angle_bisector(P2, A, B, C)
   & perpendicular(P3, A, P1, A)
   & perpendicular(P4, B, P2, B)
   & foot(P, C, P1, A)
   & foot(Q, C, P2, B)
   & foot(R, C, P3, A)
   & foot(S, C, P4, B)
   & cmark_b(A)
   & cmark_rb(B)
   & cmark_t(C)
   & cmark_b(P)
   & cmark_lb(Q)
   & cmark_lb(R)
   & cmark_rb(S)
   & newline(p, P, Q)
   & drawline(P, Q)
   & drawdashline(P1, A)
   & drawdashline(P2, B)
   & drawdashline(P3, A)
   & drawdashline(P4, B)
   & newline(a, A, B)
   & drawline(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, P)
   & drawsegment(C, Q)
   & drawsegment(C, R)
   & drawsegment(C, S)
   & prooflevel(1)) 
 => 
   parallel(P, Q, A, B))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0327_Example127.p; Output: thm_0327_Example127.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0327_Example127.p; Output: tmp_2_thm_0327_Example127.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0327_Example127
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 127 iz \cite{chou} 
%  thmnamee Example 127 from \cite{chou} 
%  thmtext Dat je trougao $ABC$ i ta\ch ka $M$ na simetrali 
%  thmtext ugla $BAC$. Iz $M$ su spu\sh tene normale $MQ$ 
%  thmtext i $MR$ na prave $AC$ i $AB$. Neka je $N$ presek 
%  thmtext prave $QR$ i prave $AA_1$, gde je $A_1$ sredi\sh te 
%  thmtext stranice $BC$. Dokazati da je prava $MN$ normalna 
%  thmtext na pravu $BC$. 
%  thmnote Teorema va\zh i za unutra\sh nji ugao temena $A$, 
%  thmnote kao i za spolja\sh nji ugao (pogledati alternativnu 
%  thmnote sliku). 
%  thmtexte Of $Q$, $R$ are the projections of a point $M$ 
%  thmtexte of the internal bisector $AM$ of the angle $A$ 
%  thmtexte of the triangle $ABC$ upon the sides $AC$, $AB$, 
%  thmtexte show that the perpendicular $MP$ from $M$ upon 
%  thmtexte $BC$ meets $QR$ in the point $N$ on the median 
%  thmtexte $AA_1$ of $ABC$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,a,P1,X,M,Mp,b,c,Q,R,A_1,a1,qr,N,B1,P2,M_1,Q_1,R_1,qr1,N_1] : ((
   dimensions(150, 110)
   & freepoint(A, 65, 20)
   & freepoint(B, 120, 20)
   & freepoint(C, 50, 90)
   & newline(a, C, B)
   & on_angle_bisector(P1, B, A, C)
   & intersection(X, P1, A, C, B)
   & freepoint(M, 102.91, 66.89)
   & collinear(Mp, A, X)
   & newline(b, A, C)
   & newline(c, A, B)
   & foot(Q, M, A, C)
   & foot(R, M, A, B)
   & midpoint(A_1, B, C)
   & newline(a1, A, A_1)
   & newline(qr, Q, R)
   & intersection(N, Q, R, A, A_1)
   & freepoint(B1, 10, 20)
   & on_angle_bisector(P2, B1, A, C)
   & freepoint(M_1, 48.2, 33.6)
   & foot(Q_1, M_1, A, C)
   & foot(R_1, M_1, A, B)
   & newline(qr1, Q_1, R_1)
   & intersection(N_1, Q_1, R_1, A, A_1)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_l(C)
   & cmark_t(M)
   & cmark_lb(Q)
   & cmark_b(R)
   & cmark_rt(A_1)
   & cmark_t(N)
   & cmark_lt(M_1)
   & cmark_r(Q_1)
   & cmark_b(R_1)
   & cmark_t(N_1)
   & drawsegment(R_1, B)
   & drawsegment(C, B)
   & drawsegment(A, C)
   & drawsegment(A, A_1)
   & drawsegment(M, N)
   & drawsegment(M, Q)
   & drawsegment(A, M)
   & drawsegment(M, R)
   & drawdashsegment(Q, R)
   & drawdashsegment(M_1, N_1)
   & drawdashsegment(M_1, Q_1)
   & drawdashsegment(A, M_1)
   & drawdashsegment(M_1, R_1)
   & drawdashsegment(N_1, R_1)
   & prooflevel(1)) 
 => 
   perpendicular(B, C, M, N))).

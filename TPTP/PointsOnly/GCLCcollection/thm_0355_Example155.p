% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0355_Example155.p; Output: thm_0355_Example155.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0355_Example155.p; Output: tmp_2_thm_0355_Example155.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0355_Example155
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 155 iz \cite{chou} 
%  thmnamee Example 155 from \cite{chou} 
%  thmtext Centar upisanog i centar ekterno upisanog 
%  thmtext kruga dele simetralu ugla na kojoj se nalaze 
%  thmtext u harmoni\ch nom odnosu. Odnosno, ta\ch ke 
%  thmtext $C$, $D$, $I$ i $I_c$ su harmonijski spregnute. 
%  thmtexte Two tritangent centers divide the bisector 
%  thmtexte on which they are located, harmonically 
%  thmtexte (ie, points $C$, $D$, $I$ and $I_c$ 
%  thmtexte are harmonic). 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,P3,c,I,I_c,D,X,Y,k,k1,A1,B1] : ((
   dimensions(120, 110)
   & freepoint(A, 20, 63)
   & freepoint(B, 85, 63)
   & freepoint(C, 28, 98)
   & on_angle_bisector(P1, A, C, B)
   & on_angle_bisector(P2, B, A, C)
   & perpendicular(P3, A, P2, A)
   & newline(c, A, B)
   & intersection(I, P2, A, P1, C)
   & intersection(I_c, P3, A, P1, C)
   & intersection(D, P1, C, A, B)
   & foot(X, I, A, B)
   & foot(Y, I_c, A, B)
   & newcircle(k, I, X)
   & newcircle(k1, I_c, Y)
   & towards(A1, C, A, 10)
   & towards(B1, C, B, 10)
   & drawdashsegment(A, A1)
   & drawdashsegment(B, B1)
   & drawdashcircle(I, X)
   & drawdashcircle(I_c, Y)
   & cmark_lt(A)
   & cmark_rt(B)
   & cmark_t(C)
   & cmark_rt(I)
   & cmark_lb(D)
   & cmark_rt(I_c)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(A, B)
   & drawsegment(C, I_c)
   & drawsegment(A, I)
   & drawsegment(B, I)
   & drawsegment(A, I_c)
   & prooflevel(1)) 
 => 
   harmonic(C, D, I, I_c))).

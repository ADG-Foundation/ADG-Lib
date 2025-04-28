% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0190_AdamsCircle.p; Output: thm_0190_AdamsCircle.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0190_AdamsCircle.p; Output: tmp_2_thm_0190_AdamsCircle.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0190_AdamsCircle
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Adamsov krug 
%  thmnamee Adams' Circle 
%  thmtext Upisani krug trougla $ABC$, sa centrom $I$, dodiruje stranice 
%  thmtext trougla $BC$, $CA$ i $AB$ redom u 
%  thmtext ta\ch kama $D$, $E$ i $F$. Prave $AD$, $BE$ i $CF$  
%  thmtext konkuretne i seku se u Gergonovoj ta\ch ki. Iz 
%  thmtext Gergonove ta\ch ke su povu\ch ene paralele sa stranicama 
%  thmtext trougla $DEF$ koje seku stranice trougla $ABC$ u ta\ch kama 
%  thmtext $P$, $Q$, $R$, $S$, $T$ i $U$. Dokazati da se ovih 
%  thmtext \sh est ta\ch aka nalazi na krugu sa centrom $I$. 
%  thmtexte Assume the incircle of $\triangle ABC$ touches the  
%  thmtexte sides $BC$, $AC$ and $AB$ in points  
%  thmtexte $D$, $E$ and $F$ respectively.  
%  thmtexte The lines $AD$, $BE$ and $CF$ meet at the Gergonne  
%  thmtexte point $G$ of the triangle. $DEF$ is known as 
%  thmtexte Gergonne triangle (and also contact triangle) of 
%  thmtexte $\triangle ABC$. Suppose three lines are drawn through 
%  thmtexte $G$ parallel to the sides of the Gergonne triangle. 
%  thmtexte These meet the sides of $\triangle ABC$ in six points 
%  thmtexte $P$, $Q$, $R$, $S$, $T$ and $U$. Show that six points 
%  thmtexte are concyclic. Moreover, the circle they lie on is 
%  thmtexte centered at the incenter. 
%  thmnote Zbog simetrije problema, dovoljno je pokazati za 
%  thmnote ta\ch ke $S$, $T$ i $Q$ da se nalaze na krugu sa 
%  thmnote centrom $I$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,P2,P3,a,b,c,I,D,E,F,k,ad,be,cf,G,de,df,ef,P4,P5,P6,P,Q,R,S,T,U,k1] : ((
   dimensions(130, 130)
   & freepoint(A, 20, 20)
   & freepoint(B, 110, 20)
   & freepoint(C, 95, 105)
   & on_angle_bisector(P1, B, A, C)
   & on_angle_bisector(P2, C, B, A)
   & on_angle_bisector(P3, A, C, B)
   & newline(a, B, C)
   & newline(b, A, C)
   & newline(c, A, B)
   & intersection(I, P1, A, P2, B)
   & foot(D, I, B, C)
   & foot(E, I, A, C)
   & foot(F, I, A, B)
   & newcircle(k, I, F)
   & newline(ad, A, D)
   & newline(be, B, E)
   & newline(cf, C, F)
   & intersection(G, A, D, B, E)
   & newline(de, D, E)
   & newline(df, D, F)
   & newline(ef, E, F)
   & parallel(P4, G, D, E)
   & parallel(P5, G, D, F)
   & parallel(P6, G, E, F)
   & intersection(P, P4, G, A, C)
   & intersection(Q, P4, G, B, C)
   & intersection(R, P5, G, B, C)
   & intersection(S, P5, G, A, B)
   & intersection(T, P6, G, A, B)
   & intersection(U, P6, G, A, C)
   & cmark_l(I)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(F)
   & cmark_lt(E)
   & cmark_rt(D)
   & cmark_rb(G)
   & cmark_lt(P)
   & cmark_r(Q)
   & cmark_rt(R)
   & cmark_b(S)
   & cmark_b(T)
   & cmark_lt(U)
   & drawcircle(I, F)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, A)
   & drawsegment(A, D)
   & drawsegment(B, E)
   & drawsegment(C, F)
   & drawdashsegment(P, Q)
   & drawdashsegment(R, S)
   & drawdashsegment(T, U)
   & drawsegment(D, E)
   & drawsegment(D, F)
   & drawsegment(F, E)
   & newcircle(k1, I, S)
   & drawdashcircle(I, S)
   & prooflevel(1)) 
 => 
   length(I, S) = length(I, T))).
fof(thm, conjecture, ! [ A,B,C,P1,P2,P3,a,b,c,I,D,E,F,k,ad,be,cf,G,de,df,ef,P4,P5,P6,P,Q,R,S,T,U,k1] : ((
   dimensions(130, 130)
   & freepoint(A, 20, 20)
   & freepoint(B, 110, 20)
   & freepoint(C, 95, 105)
   & on_angle_bisector(P1, B, A, C)
   & on_angle_bisector(P2, C, B, A)
   & on_angle_bisector(P3, A, C, B)
   & newline(a, B, C)
   & newline(b, A, C)
   & newline(c, A, B)
   & intersection(I, P1, A, P2, B)
   & foot(D, I, B, C)
   & foot(E, I, A, C)
   & foot(F, I, A, B)
   & newcircle(k, I, F)
   & newline(ad, A, D)
   & newline(be, B, E)
   & newline(cf, C, F)
   & intersection(G, A, D, B, E)
   & newline(de, D, E)
   & newline(df, D, F)
   & newline(ef, E, F)
   & parallel(P4, G, D, E)
   & parallel(P5, G, D, F)
   & parallel(P6, G, E, F)
   & intersection(P, P4, G, A, C)
   & intersection(Q, P4, G, B, C)
   & intersection(R, P5, G, B, C)
   & intersection(S, P5, G, A, B)
   & intersection(T, P6, G, A, B)
   & intersection(U, P6, G, A, C)
   & cmark_l(I)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(F)
   & cmark_lt(E)
   & cmark_rt(D)
   & cmark_rb(G)
   & cmark_lt(P)
   & cmark_r(Q)
   & cmark_rt(R)
   & cmark_b(S)
   & cmark_b(T)
   & cmark_lt(U)
   & drawcircle(I, F)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, A)
   & drawsegment(A, D)
   & drawsegment(B, E)
   & drawsegment(C, F)
   & drawdashsegment(P, Q)
   & drawdashsegment(R, S)
   & drawdashsegment(T, U)
   & drawsegment(D, E)
   & drawsegment(D, F)
   & drawsegment(F, E)
   & newcircle(k1, I, S)
   & drawdashcircle(I, S)
   & prooflevel(1)
   & prooflevel(1)) 
 => 
   length(I, S) = length(I, Q))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0372_Example172.p; Output: thm_0372_Example172.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0372_Example172.p; Output: tmp_2_thm_0372_Example172.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0372_Example172
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 172 iz \cite{chou} 
%  thmnamee Example 172 from \cite{chou} 
%  thmtext Dokazati da je povr\sh ina pravouglog trougla 
%  thmtext jednaka proizvodu dva segmenta na koje je podeljena 
%  thmtext hipotenuza ta\ch kom dodira sa upisanim krugom. 
%  thmtexte Show that the area of a right triangle is equal 
%  thmtexte to the product of the two segments into 
%  thmtexte which the hypothenuse is divided by its point 
%  thmtexte of contact with incircle. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,c,X,x,P1,C,P2,P3,I,a,D,k,E,F] : ((
   dimensions(90, 90)
   & freepoint(A, 20, 20)
   & freepoint(B, 70, 20)
   & newline(c, A, B)
   & freepoint(X, 30, 65)
   & newline(x, B, X)
   & perpendicular(P1, A, A, B)
   & intersection(C, B, X, P1, A)
   & on_angle_bisector(P2, B, A, C)
   & on_angle_bisector(P3, A, B, C)
   & intersection(I, P2, A, P3, B)
   & newline(a, B, C)
   & foot(D, I, B, C)
   & newcircle(k, I, D)
   & drawcircle(I, D)
   & cmark_rt(D)
   & cmark_lt(I)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(A, B)
   & foot(E, I, A, B)
   & foot(F, I, P1, A)
   & drawdashsegment(I, E)
   & drawdashsegment(I, F)
   & drawdashsegment(I, D)
   & prooflevel(1)) 
 => 
   mult(length(C, D), length(B, D)) = mult(signed_area3(A, B, C), signed_area3(A, B, C)))).

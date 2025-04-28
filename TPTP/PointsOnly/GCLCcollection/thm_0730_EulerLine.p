% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0730_EulerLine.p; Output: thm_0730_EulerLine.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0730_EulerLine.p; Output: tmp_2_thm_0730_EulerLine.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0730_EulerLine
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Ojlerova prava 
%  thmnamee Eualer Line Theorem 
%  thmtext Dokazati da se ortocentar, te\zh i\sh te i centar 
%  thmtext opisanog kruga trougla nalaze na istoj pravoj. 
%  thmnote Bi\cj e dokazano op\sh tije tvr\dj enje. Ta\ch ke 
%  thmnote se nalaze na istoj pravoj, te\zh i\sh te je izme\dj u 
%  thmnote ortocentra i centra opisanog kruga i deli tu du\zh \ u 
%  thmnote odnosu $2 : 1$. 
%  thmtexte Show that in any triangle, the orthocenter, 
%  thmtexte the centroid and the center of circumscribed 
%  thmtexte circle are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,C_1,A_1,at,ct,T,P11,P22,P13,P24,O,ab,bc,C_2,A_2,ah,ch,H,oth] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 70, 80)
   & midpoint(C_1, A, B)
   & midpoint(A_1, B, C)
   & newline(at, A, A_1)
   & newline(ct, C, C_1)
   & intersection(T, A, A_1, C, C_1)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & midpoint(P13, A, B)
   & on_segment_bisector(P24, A, B)
   & intersection(O, P11, P22, P13, P24)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & foot(C_2, C, A, B)
   & foot(A_2, A, B, C)
   & newline(ah, A, A_2)
   & newline(ch, C, C_2)
   & intersection(H, A, A_2, C, C_2)
   & newline(oth, O, T)
   & drawline(O, T)
   & drawdashsegment(A, A_2)
   & drawdashsegment(C, C_2)
   & drawdashsegment(O, A_1)
   & drawdashsegment(O, C_1)
   & drawdashsegment(A, A_1)
   & drawdashsegment(C, C_1)
   & cmark_rb(H)
   & cmark_t(O)
   & cmark_rb(T)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(C_1)
   & cmark_b(C_2)
   & cmark_rt(A_1)
   & cmark_rt(A_2)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & prooflevel(1)) 
 => 
   sratio(H, T, T, O) = 2)).

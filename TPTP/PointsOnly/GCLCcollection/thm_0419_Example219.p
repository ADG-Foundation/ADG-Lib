% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0419_Example219.p; Output: thm_0419_Example219.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0419_Example219.p; Output: tmp_2_thm_0419_Example219.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0419_Example219
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 219 iz \cite{chou} 
%  thmnamee Example 219 from \cite{chou} 
%  thmtext U trouglu $ABC$, $O$ je centar opisanog kruga, a 
%  thmtext $U$ je presek simetrale ugla $\angle ACB$ i prave $AB$. 
%  thmtext Dokazati da su prave $CO$, simetrala du\zh i $CU$ 
%  thmtext i normala iz $U$ na pravu $AB$ konkurentne. 
%  thmtexte Show that the mediator of the bisector $CU$ of the 
%  thmtexte triangle $ABC$, the perpendicular to $AB$ at $U$, 
%  thmtexte and the circumdiameter of $ABC$ passing through $C$ 
%  thmtexte are concurrent. 
%  thmnote Ekvivalentno tvr\dj enje je da ako je $P$ presek 
%  thmnote prave $AO$ i simetrale du\zh i $CU$, onda je 
%  thmnote prava $PU$ normalna sa pravom $AB$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P11,P22,P13,P24,O,k,P5,c,U,p,P16,P27,P] : ((
   dimensions(110, 100)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 75, 85)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & midpoint(P13, A, C)
   & on_segment_bisector(P24, A, C)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, A)
   & on_angle_bisector(P5, A, C, B)
   & newline(c, A, B)
   & intersection(U, P5, C, A, B)
   & newline(p, C, O)
   & midpoint(P16, C, U)
   & on_segment_bisector(P27, C, U)
   & intersection(P, C, O, P16, P27)
   & drawdashline(P16, P27)
   & drawcircle(O, A)
   & cmark_lt(P)
   & cmark_b(U)
   & cmark_l(O)
   & cmark_lb(A)
   & cmark_rb(B)
   & cmark_t(C)
   & drawdashsegment(P, U)
   & drawsegment(C, O)
   & drawsegment(C, U)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & prooflevel(1)) 
 => 
   perpendicular(P, U, A, B))).

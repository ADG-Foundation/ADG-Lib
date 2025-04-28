% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0702_SixPointsCircle.p; Output: thm_0702_SixPointsCircle.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0702_SixPointsCircle.p; Output: tmp_2_thm_0702_SixPointsCircle.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0702_SixPointsCircle
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Krug \sh est ta\ch aka. 
%  thmnamee  Six Points Circle 
%  thmtext U ravni je dat trougao $ABC$. Neka su $A_1$, 
%  thmtext $B_1$ i $C_1$ podno\zh ja visina trougla povu\ch ene iz 
%  thmtext temena $A$, $B$ i $C$ redom. Neka su dalje 
%  thmtext $A_2$ i $A_3$ podno\zh ja normala spu\sh tenih 
%  thmtext iz ta\ch ke $A_1$ na prave $AC$ i $AB$. 
%  thmtext Na sli\ch an na\ch in su konstruisane i 
%  thmtext ta\ch ke $B_2$, $B_3$, $C_2$ i $C_3$. 
%  thmtext Dokazati da se \sh est ta\ch aka $A_2$, $A_3$, 
%  thmtext $B_2$, $B_3$, $C_2$ i $C_3$ nalaze na istom 
%  thmtext krugu. 
%  thmtexte Given triangle $ABC$, let $A_1$, $B_1$ and $C_1$ 
%  thmtexte endpoints of triangle altitudes. From each of 
%  thmtexte points $A_1$, $B_1$ and $C_1$ feet are drawn upon 
%  thmtexte triangle sides, those are: $A_2$, $A_3$, $B_2$, 
%  thmtexte $B_3$, $C_2$ and $C_3$. Show that these six 
%  thmtexte points lie on a circle. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,ac,ab,bc,A_1,B_1,C_1,C_2,C_3,A_2,A_3,B_2,B_3,P11,P22,P13,P24,O,k] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 70, 70)
   & newline(ac, A, C)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & foot(A_1, A, B, C)
   & foot(B_1, B, A, C)
   & foot(C_1, C, A, B)
   & foot(C_2, C_1, B, C)
   & foot(C_3, C_1, A, C)
   & foot(A_2, A_1, A, C)
   & foot(A_3, A_1, A, B)
   & foot(B_2, B_1, B, C)
   & foot(B_3, B_1, A, B)
   & midpoint(P11, B_3, A_3)
   & on_segment_bisector(P22, B_3, A_3)
   & midpoint(P13, B_3, C_3)
   & on_segment_bisector(P24, B_3, C_3)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, B_3)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_r(A_1)
   & cmark_l(B_1)
   & cmark_b(C_1)
   & cmark_b(A_3)
   & cmark_b(B_3)
   & cmark_l(C_3)
   & cmark_lt(A_2)
   & cmark_r(C_2)
   & cmark_rt(B_2)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawdashsegment(A, A_1)
   & drawdashsegment(B, B_1)
   & drawdashsegment(C, C_1)
   & drawdashsegment(C_1, C_2)
   & drawdashsegment(C_1, C_3)
   & drawdashsegment(A_1, A_2)
   & drawdashsegment(A_1, A_3)
   & drawdashsegment(B_1, B_2)
   & drawdashsegment(B_1, B_3)
   & drawcircle(O, B_3)
   & prooflevel(1)) 
 => 
   length(O, C_2) = length(O, B_3))).
fof(thm, conjecture, ! [ A,B,C,ac,ab,bc,A_1,B_1,C_1,C_2,C_3,A_2,A_3,B_2,B_3,P11,P22,P13,P24,O,k] : ((
   dimensions(130, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 70, 70)
   & newline(ac, A, C)
   & newline(ab, A, B)
   & newline(bc, B, C)
   & foot(A_1, A, B, C)
   & foot(B_1, B, A, C)
   & foot(C_1, C, A, B)
   & foot(C_2, C_1, B, C)
   & foot(C_3, C_1, A, C)
   & foot(A_2, A_1, A, C)
   & foot(A_3, A_1, A, B)
   & foot(B_2, B_1, B, C)
   & foot(B_3, B_1, A, B)
   & midpoint(P11, B_3, A_3)
   & on_segment_bisector(P22, B_3, A_3)
   & midpoint(P13, B_3, C_3)
   & on_segment_bisector(P24, B_3, C_3)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, B_3)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_r(A_1)
   & cmark_l(B_1)
   & cmark_b(C_1)
   & cmark_b(A_3)
   & cmark_b(B_3)
   & cmark_l(C_3)
   & cmark_lt(A_2)
   & cmark_r(C_2)
   & cmark_rt(B_2)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawdashsegment(A, A_1)
   & drawdashsegment(B, B_1)
   & drawdashsegment(C, C_1)
   & drawdashsegment(C_1, C_2)
   & drawdashsegment(C_1, C_3)
   & drawdashsegment(A_1, A_2)
   & drawdashsegment(A_1, A_3)
   & drawdashsegment(B_1, B_2)
   & drawdashsegment(B_1, B_3)
   & drawcircle(O, B_3)
   & prooflevel(1)
   & prooflevel(1)) 
 => 
   length(O, A_2) = length(O, B_3))).

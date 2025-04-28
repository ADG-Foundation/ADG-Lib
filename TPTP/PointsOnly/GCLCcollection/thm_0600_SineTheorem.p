% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0600_SineTheorem.p; Output: thm_0600_SineTheorem.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0600_SineTheorem.p; Output: tmp_2_thm_0600_SineTheorem.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0600_SineTheorem
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Sinusna teorema 
%  thmnamee Sine Theorem 
%  thmtext Dokazati da je u  proizvoljnom trouglu 
%  thmtext odnos stranice i pre\ch nika opisanog kruga 
%  thmtext jednak sinusu naspramnog ugla, odnosno: 
%  thmtext $\frac{a}{2R} = \sin \alpha$ 
%  thmtexte Show that in any given triangle the ratio 
%  thmtexte between one triangle side and a diameter of 
%  thmtexte circumscribed circle is equal to the sine 
%  thmtexte of opposite angle, ie: 
%  thmtexte $\frac{a}{2R} = \sin \alpha$ 
%  thmnote $\sin \alpha = \frac{AD}{AC}$ 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P11,P22,P13,P24,O,k,c,D,a,b,al,r,x,xx] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 30)
   & freepoint(B, 90, 30)
   & freepoint(C, 70, 90)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & midpoint(P13, A, C)
   & on_segment_bisector(P24, A, C)
   & intersection(O, P11, P22, P13, P24)
   & newcircle(k, O, A)
   & newline(c, A, B)
   & foot(D, C, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_b(O)
   & drawcircle(O, A)
   & cmark_b(D)
   & drawsegment(O, C)
   & drawsegment(C, D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(A, C)
   & freepoint(a, 83, 58.4)
   & printat(a, a)
   & freepoint(b, 42.4, 61)
   & printat(b, b)
   & freepoint(c, 57.9, 28.2)
   & printat(c, c)
   & freepoint(al, 30, 34.1)
   & printat(al, \(alpha))
   & freepoint(r, 60, 70.9)
   & printat(r, _6474)
   & freepoint(x, 40, 30)
   & drawarc(A, x, 50)
   & freepoint(xx, 41, 30)
   & drawarc(A, xx, 50)
   & prooflevel(1)) 
 => 
   mult(4, mult(length(A, O), length(C, D))) = mult(length(B, C), length(C, A)))).

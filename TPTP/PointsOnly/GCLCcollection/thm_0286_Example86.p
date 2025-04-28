% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0286_Example86.p; Output: thm_0286_Example86.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0286_Example86.p; Output: tmp_2_thm_0286_Example86.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0286_Example86
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 86 iz \cite{chou} 
%  thmnamee Example 86 from \cite{chou} 
%  thmtext Neka je $ABC$ trougao takav da je ugao kod temena 
%  thmtext $B$ dva puta ve\cj i od ugla u temenu $C$. Neka 
%  thmtext je $D$ podno\zh je normale iz ta\ch ke $A$ i neka 
%  thmtext je $M$ sredi\sh te stranice $BC$. Dokazati da je 
%  thmtext $AB = 2DM$. 
%  thmnote Slika je konstruisana tako \sh to je prvo konstruisan 
%  thmnote jednakokraki trougao $CFB$, a zatim ta\ch ka $A$ 
%  thmnote odre\dj ena kao presek simetrale ugla $\angle C$ 
%  thmnote i stranice $BF$. 
%  thmtexte Let $ABC$ be a triangle with $\angle B = 2\angle C$, 
%  thmtexte D the foot of the altitude on $CB$ and $M$ the 
%  thmtexte midpoint of $B$ and $C$. Show that $AB = 2DM$. 

include('geo.ax').
fof(thm, conjecture, ! [ C,B,bc,P11,P22,A_1,ab,F,P3,A,M,D] : ((
   dimensions(110, 80)
   & freepoint(C, 20, 20)
   & freepoint(B, 90, 20)
   & newline(bc, B, C)
   & midpoint(P11, B, C)
   & on_segment_bisector(P22, B, C)
   & freepoint(A_1, 80, 60)
   & newline(ab, A_1, B)
   & intersection(F, A_1, B, P11, P22)
   & on_angle_bisector(P3, B, C, F)
   & intersection(A, P3, C, A_1, B)
   & intersection(M, B, C, P11, P22)
   & foot(D, A, B, C)
   & cmark_b(C)
   & cmark_b(B)
   & cmark_r(A)
   & cmark_b(M)
   & cmark_b(D)
   & drawsegment(B, C)
   & drawsegment(A, C)
   & drawsegment(B, A)
   & drawsegment(D, A)
   & drawsegment(M, A)
   & prooflevel(1)) 
 => 
   mult(4, length(D, M)) = length(A, B))).

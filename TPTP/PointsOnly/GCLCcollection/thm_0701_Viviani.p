% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0701_Viviani.p; Output: thm_0701_Viviani.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0701_Viviani.p; Output: tmp_2_thm_0701_Viviani.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0701_Viviani
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Vivianijeva teorema 
%  thmnamee Viviani's Theorem 
%  thmtext Iz ta\ch ke $P$ unutar trougla jednakostrani\ch nog $ABC$ 
%  thmtext spu\sh tene su normale na stranice 
%  thmtext trougla. Dokazati da je suma ove tri 
%  thmtext normale jednaka visini trougla $ABC$. 
%  thmnote Dovoljno je dokazati da je algebarska 
%  thmnote suma du\zh i $CH$, $PF$ i $PG$ jednaka 
%  thmnote nuli. Pogledati sliku. 
%  thmtexte The sum of distances of a point inside 
%  thmtexte an equilateral triangle or on  
%  thmtexte one of its sides to the three triangle segments,  
%  thmtexte equals the  
%  thmtexte length of its altitude. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,P,k,P11,P22,C1,C,ab,D,bc,ac,G,F,E,H] : ((
   dimensions(110, 100)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(P, 65, 40)
   & newcircle(k, A, B)
   & midpoint(P11, A, B)
   & on_segment_bisector(P22, A, B)
   & intersection_cl(C, C1, A, B, P11, P22)
   & newline(ab, A, B)
   & intersection(D, A, B, P11, P22)
   & newline(bc, B, C)
   & newline(ac, A, C)
   & foot(G, P, A, C)
   & foot(F, P, B, C)
   & foot(E, P, A, B)
   & foot(H, P, P11, P22)
   & cmark_b(D)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(P)
   & cmark_l(H)
   & cmark_lt(G)
   & cmark_rt(F)
   & cmark_b(E)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawsegment(P, H)
   & drawsegment(P, G)
   & drawsegment(P, F)
   & drawsegment(P, E)
   & prooflevel(1)) 
 => 
   alg_sum_zero3(length(C, H), length(P, F), length(P, G)))).

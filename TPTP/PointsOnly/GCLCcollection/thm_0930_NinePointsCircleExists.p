% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0930_NinePointsCircleExists.p; Output: thm_0930_NinePointsCircleExists.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0930_NinePointsCircleExists.p; Output: tmp_2_thm_0930_NinePointsCircleExists.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0930_NinePointsCircleExists
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Krug devet ta\ch aka 
%  thmnamee Nine Points Circle 
%  thmtext Dokazati da se podno\zh ja visina trougla, 
%  thmtext sredi\sh ta stranica i sredi\sh ta du\zh i 
%  thmtext koje povezuju temena sa ortocentrom, nalaze 
%  thmtext na istom krugu. 
%  thmnote Slika nam daje ideju gde se centar kruga nalazi. 
%  thmnote Iskoristi\cj emo to i dokazati da su tri para 
%  thmnote ta\ch aka istovremeno i pre\ch nici kruga devet ta\ch aka 
%  thmnote (odnosno bi\cj e dokazano i vi\sh e nego 
%  thmnote \sh to se tra\zh i u zadatku, ali \cj e 
%  thmnote to u\ch initi dokaz ne te\zh im, ve\cj \ lak\sh im!). 
%  thmnote Krug devet ta\ch aka je tako\dj e poznat pod mnogim imenima: 
%  thmnote Fojerbahov krug, Ojlerov krug, Terkvemov krug,  
%  thmnote krug \sh est ta\ch aka, itd. 
%  thmtexte Prove that in any triangle midpoints of each side, 
%  thmtexte feet of each altitude and midpoints of the segments 
%  thmtexte of each altitude from its vertex to the orthocenter 
%  thmtexte lie on circle. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,E,F,G,J,I,H,K,L,M,O] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 80, 100)
   & foot(D, A, B, C)
   & foot(E, B, A, C)
   & foot(F, C, A, B)
   & midpoint(G, A, B)
   & midpoint(J, B, C)
   & midpoint(I, C, A)
   & intersection(A, D, B, E, H)
   & midpoint(K, A, H)
   & midpoint(L, B, H)
   & midpoint(M, C, H)
   & intersection(K, J, G, M, O)
   & drawcircle(O, G)
   & drawdashline(K, J)
   & drawdashline(G, M)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_r(D)
   & cmark_l(E)
   & cmark_b(F)
   & cmark_b(G)
   & cmark_lb(H)
   & cmark_t(I)
   & cmark_r(J)
   & cmark_lb(M)
   & cmark_b(K)
   & cmark_t(L)
   & cmark_t(O)
   & drawsegment(A, B)
   & drawsegment(A, C)
   & drawsegment(B, C)
   & drawsegment(A, D)
   & drawsegment(B, E)
   & drawsegment(C, F)
   & prooflevel(1)) 
 => 
   perpendicular(G, M, G, E))).

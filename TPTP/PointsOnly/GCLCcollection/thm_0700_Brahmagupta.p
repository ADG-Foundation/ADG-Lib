% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0700_Brahmagupta.p; Output: thm_0700_Brahmagupta.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0700_Brahmagupta.p; Output: tmp_2_thm_0700_Brahmagupta.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0700_Brahmagupta
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Brahmaguptina teorema 
%  thmnamee Brahmagupta's Theorem 
%  thmtext \Ch etvorougao $ABCD$ \ch ije dijagonale grade prav 
%  thmtext ugao je upisan u krug. Dokazati da prava koja prolazi 
%  thmtext kroz presek dijagonala i normalna je na jednu stranicu 
%  thmtext \ch etvorougla, polovi suprotnu stranicu. 
%  thmnote Da bi se izbegao slu\ch aj svodivosti u koji bi 
%  thmnote dokaziva\ch \ upao ukoliko bi poku\sh ao da odredi 
%  thmnote prese\ch ne ta\ch ke prave i kruga (do svodivosti 
%  thmnote dolazi zato \sh to presek nije jednozna\ch an), 
%  thmnote polaze\cj i od ta\ch aka $B$, $T$ i $O$, ostala 
%  thmnote temena \ch etvorougla su konstruisana malo du\zh im, 
%  thmnote ali jednozna\ch nim putem. 
%  thmtexte In a cyclic quadrilateral having perpendicular  
%  thmtexte diagonals, the perpendicular to a side from  
%  thmtexte the point of intersection of the diagonals  
%  thmtexte always bisects the opposite side. 

include('geo.ax').
fof(thm, conjecture, ! [ B,T,O,k,bd,P1,P2,X,D,C1,A,P3,Y,C,ad,bc,P4,P,Q] : ((
   dimensions(110, 110)
   & freepoint(B, 20, 40)
   & freepoint(T, 43, 40)
   & freepoint(O, 55, 60)
   & newcircle(k, O, B)
   & newline(bd, B, T)
   & perpendicular(P1, T, B, T)
   & perpendicular(P2, O, B, T)
   & intersection(X, P2, O, B, T)
   & towards(D, B, X, 2)
   & intersection_cl(A, C1, O, B, P1, T)
   & perpendicular(P3, O, P1, T)
   & intersection(Y, P3, O, P1, T)
   & towards(C, A, Y, 2)
   & newline(ad, A, D)
   & newline(bc, B, C)
   & perpendicular(P4, T, B, C)
   & intersection(P, P4, T, A, D)
   & intersection(Q, P4, T, B, C)
   & cmark_rt(P)
   & cmark_t(Q)
   & cmark_l(B)
   & cmark_r(D)
   & cmark_t(A)
   & cmark_b(C)
   & cmark_b(O)
   & cmark_rb(T)
   & cmark_b(X)
   & cmark_l(Y)
   & drawdashsegment(P, Q)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawsegment(A, D)
   & drawsegment(A, C)
   & drawsegment(D, B)
   & drawcircle(O, B)
   & prooflevel(1)) 
 => 
   sratio(A, P, P, D) = 1)).

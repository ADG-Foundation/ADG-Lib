% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0030_harmonic2.p; Output: thm_0030_harmonic2.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0030_harmonic2.p; Output: tmp_2_thm_0030_harmonic2.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0030_harmonic2
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Harmoni\ch ne ta\ch ke 2 
%  thmnamee Harmonic Points 2 
%  thmtext Dat je \ch etvorougao $ABCD$. Neka je $K$ presek 
%  thmtext pravih $AD$ i $BC$, $L$ presek pravih $AB$ i 
%  thmtext $CD$, $F$ presek pravih $KL$ i $FD$ i $G$ presek 
%  thmtext pravih $KL$ i $AC$. Dokazati da je \ch etvorka 
%  thmtext $LFKG$ harmonijski spregnuta, odnosno da je 
%  thmtext $\frac{\overline{LK}}{\overline{KF}} = \frac{\overline{GL}}{\overline{GF}}$. 
%  thmtexte Given four points $A$, $B$, $C$ and $D$, 
%  thmtexte points of intersections are formed: $L = AB \cap CD$,  
%  thmtexte $K = AC \cap BC$, $F = KL \cap BD$ and $G = KL \cap AC$. 
%  thmtexte Show that segment $KL$ is harmonically divided by 
%  thmtexte the points $F$ and $G$, ie: 
%  thmtexte $\frac{\overline{LK}}{\overline{KF}} = \frac{\overline{GL}}{\overline{GF}}$. 
%  thmnote Isti primer je ponovljen sa druga\ch ijom konfiguracijom. Obratiti pa\zh nju 
%  thmnote na sliku, odabir koordinata i kompleksnost dokaza. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,AB,CD,L,AD,BC,K,BD,KL,F,AC,G,lkfg] : ((
   dimensions(130, 50)
   & freepoint(A, 30, 32)
   & freepoint(B, 40, 40)
   & freepoint(C, 48, 28)
   & freepoint(D, 40, 25)
   & cmark_lt(A)
   & cmark_t(B)
   & cmark_rt(C)
   & cmark_lb(D)
   & newline(AB, A, B)
   & newline(CD, C, D)
   & intersection(L, A, B, C, D)
   & cmark_b(L)
   & newline(AD, A, D)
   & newline(BC, B, C)
   & intersection(K, A, D, B, C)
   & cmark_b(K)
   & newline(BD, B, D)
   & newline(KL, K, L)
   & intersection(F, B, D, K, L)
   & cmark_b(F)
   & newline(AC, A, C)
   & intersection(G, A, C, K, L)
   & cmark_b(G)
   & drawsegment(B, L)
   & drawsegment(C, L)
   & drawsegment(A, K)
   & drawsegment(B, K)
   & drawsegment(B, F)
   & drawsegment(A, G)
   & newline(lkfg, L, K)
   & drawdashline(L, K)
   & prooflevel(1)) 
 => 
   harmonic(L, K, F, G))).

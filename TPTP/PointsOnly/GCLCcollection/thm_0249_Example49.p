% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0249_Example49.p; Output: thm_0249_Example49.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0249_Example49.p; Output: tmp_2_thm_0249_Example49.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0249_Example49
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 49 iz \cite{chou} 
%  thmnamee Example 49 from \cite{chou} 
%  thmtext Dat je trapez $ABCD$ gde su $AB$ i $CD$ 
%  thmtext paralelne. Dokazati da prava koja sadr\zh i 
%  thmtext presek dijagonala trapeza i presek suprotnih 
%  thmtext stranica trapeza polovi bazu $AB$ trapeza. 
%  thmnote Dovoljno je dokazati jednak odnos du\zh i 
%  thmnote po\sh to se nalaze na istoj pravoj. 
%  thmtexte Prove that the line joining the point of intersection 
%  thmtexte of the extensions of the nonparallel sides of a trapezoid 
%  thmtexte to the point of intersection of its diagonals bisects the base 
%  thmtexte of the trapezoid. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,P1,Cp,D,F,E,G] : ((
   dimensions(130, 80)
   & freepoint(A, 20, 20)
   & freepoint(B, 110, 20)
   & freepoint(C, 90, 50)
   & parallel(P1, C, A, B)
   & translate(Cp, A, B, C)
   & collinear(D, C, Cp)
   & intersection(A, D, B, C, F)
   & intersection(A, C, B, D, E)
   & intersection(A, B, E, F, G)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_rt(C)
   & cmark_lt(D)
   & cmark_rb(E)
   & cmark_rt(F)
   & cmark_b(G)
   & drawsegment(A, F)
   & drawsegment(B, F)
   & drawsegment(G, F)
   & drawsegment(A, B)
   & drawsegment(C, D)
   & drawsegment(A, C)
   & drawsegment(B, D)
   & prooflevel(1)) 
 => 
   sratio(A, G, G, B) = 1)).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0150_PappusHexagon.p; Output: thm_0150_PappusHexagon.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0150_PappusHexagon.p; Output: tmp_2_thm_0150_PappusHexagon.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0150_PappusHexagon
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Paposov heksagon 
%  thmnamee Pappus Hexagon Theorem 
%  thmtext Na pravoj $p$ su date ta\ch ke $A$, $B$ i $C$, 
%  thmtext dok su na pravoj $q$ date ta\ch ke $A_1$, $B_1$ 
%  thmtext i $C_1$. Neka je $P = AB_1 \cap A_1B$, 
%  thmtext $Q = AC_1 \cap A_1C$ i $R = BC_1 \cap B_1C$. 
%  thmtext Dokazati da su ta\ch ke $P$, $Q$ i $R$ 
%  thmtext kolinearne. 
%  thmnote Ova teorema je posledica Paskalove teoreme 
%  thmnote za krive drugog reda. Dve prave su specijalan 
%  thmnote slu\ch aj krive drugog reda. 
%  thmtexte Let $A$, $B$ and $C$ be three points on the 
%  thmtexte line $p$, and let $A_1$, $B_1$ and $C_1$ be 
%  thmtexte three points on the line $q$. Following intersections are created: 
%  thmtexte $P = AB_1 \cap A_1B$, $Q = AC_1 \cap A_1C$ and 
%  thmtexte $R = BC_1 \cap B_1C$. Show that points 
%  thmtexte $P$, $Q$ and $R$ are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,A_1,B_1,C_1,A_1B_1,AB_1,AC_1,BA_1,BC_1,CA_1,CB_1,P,Q,S] : ((
   dimensions(110, 90)
   & freepoint(A, 40, 10)
   & freepoint(B, 90, 10)
   & collinear(C, A, B)
   & freepoint(A_1, 35.2, 38.2)
   & freepoint(B_1, 76.8, 64.6)
   & collinear(C_1, A_1, B_1)
   & newline(A_1B_1, A_1, B_1)
   & newline(AB_1, A, B_1)
   & newline(AC_1, A, C_1)
   & newline(BA_1, B, A_1)
   & newline(BC_1, B, C_1)
   & newline(CA_1, C, A_1)
   & newline(CB_1, C, B_1)
   & intersection(P, A, B_1, B, A_1)
   & intersection(Q, A, C_1, C, A_1)
   & intersection(S, B, C_1, C, B_1)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_b(C)
   & cmark_lt(A_1)
   & cmark_rb(B_1)
   & cmark_l(C_1)
   & cmark_rb(P)
   & cmark_r(Q)
   & cmark_r(S)
   & drawdashline(P, S)
   & drawsegment(A, B_1)
   & drawsegment(A, Q)
   & drawsegment(B, A_1)
   & drawsegment(B, C_1)
   & drawsegment(C, Q)
   & drawsegment(C, B_1)
   & drawline(A_1, C_1)
   & drawline(A, C)
   & prooflevel(1)) 
 => 
   collinear(P, Q, S))).

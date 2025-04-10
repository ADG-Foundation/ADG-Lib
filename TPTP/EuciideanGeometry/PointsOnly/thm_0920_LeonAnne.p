% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0920_LeonAnne.p; Output: thm_0920_LeonAnne.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0920_LeonAnne.p; Output: tmp_2_thm_0920_LeonAnne.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0920_LeonAnne
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,M_1,M_2,O] : ((
   dimensions(110,110)
   & freepoint(A,20,20)
   & freepoint(B,90,20)
   & freepoint(C,75,85)
   & freepoint(D,40,65)
   & midp(M_1,A,C)
   & midp(M_2,B,D)
   & coll(O,M_1,M_2)
   & drawline(A,C)
   & drawline(B,D)
   & drawdashline(M_1,M_2)
   & cmark_b(M_1)
   & cmark_b(M_2)
   & cmark_t(O)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A,B)
   & drawsegment(C,B)
   & drawsegment(C,D)
   & drawsegment(A,D)
   & prooflevel(1)) 
 => 
   mult(2,sum(signed_area3(A,B,O),signed_area3(C,D,O))) = signed_area4(A,B,C,D))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0950_Pascal.p; Output: thm_0950_Pascal.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0950_Pascal.p; Output: tmp_2_thm_0950_Pascal.p; Arg: [-l]
%--------------------------------------------------------------------------
% File     : tmp_thm_0950_Pascal
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms

include('geo.ax').
fof(thm, conjecture, ! [ A,O,B,C,D,E,F,P,Q,S] : ((
   dimensions(100,100)
   & freepoint(A,20.5,51.4)
   & freepoint(O,50,50)
   & oncircle(B,O,A)
   & oncircle(C,O,A)
   & oncircle(D,O,A)
   & oncircle(E,O,A)
   & oncircle(F,O,A)
   & drawdashline(A,B)
   & drawdashline(D,F)
   & drawdashline(B,C)
   & drawdashline(F,E)
   & drawdashline(C,D)
   & drawdashline(E,A)
   & inter(A,B,D,F,P)
   & inter(B,C,F,E,Q)
   & inter(C,D,E,A,S)
   & cmark_lt(A)
   & cmark_t(O)
   & cmark_t(B)
   & cmark_t(C)
   & cmark_lb(D)
   & cmark_t(E)
   & cmark_lt(F)
   & cmark_t(P)
   & cmark_t(Q)
   & cmark_t(S)
   & drawcircle(O,A)
   & drawline(P,Q)
   & prooflevel(1)) 
 => 
   collinear(P,Q,S))).

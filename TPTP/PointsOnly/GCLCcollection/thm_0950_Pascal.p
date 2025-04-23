% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0950_Pascal.p; Output: thm_0950_Pascal.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,O] : ((
   dimensions(100, 100)
   & freepoint(A, 20.5, 51.4)
   & freepoint(O, 50, 50)
   & on_circle(B, O, A)
   & on_circle(C, O, A)
   & on_circle(D, O, A)
   & on_circle(E, O, A)
   & on_circle(F, O, A)
   & drawdashline(A, B)
   & drawdashline(D, F)
   & drawdashline(B, C)
   & drawdashline(F, E)
   & drawdashline(C, D)
   & drawdashline(E, A)
   & intersection(A, B, D, F, P)
   & intersection(B, C, F, E, Q)
   & intersection(C, D, E, A, S)
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
   & drawcircle(O, A)
   & drawline(P, Q)
   & prooflevel(1)) 
 => 
   collinear(P, Q, S))).

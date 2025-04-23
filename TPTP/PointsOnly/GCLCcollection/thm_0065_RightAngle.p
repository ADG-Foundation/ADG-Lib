% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0065_RightAngle.p; Output: thm_0065_RightAngle.p; Arg: [-p]

include('geo.ax').
fof(thm, conjecture, ! [ A,B] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 55)
   & freepoint(B, 90, 55)
   & midpoint(O, A, B)
   & on_circle(C, O, A)
   & cmark_t(C)
   & drawsegment(A, C)
   & drawsegment(B, C)
   & drawcircle(O, A)
   & cmark_l(A)
   & cmark_r(B)
   & drawsegment(A, B)
   & prooflevel(1)) 
 => 
   perpendicular(A, C, C, B))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0920_LeonAnne.p; Output: thm_0920_LeonAnne.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0920_LeonAnne.p; Output: tmp_2_thm_0920_LeonAnne.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0920_LeonAnne
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Leon-An teorema 
%  thmnamee Leon Anne's Theorem 
%  thmtext U ravni je dat \ch etvorouga $ABCD$. Neka su $M_1$ i $M_2$ 
%  thmtext sredi\sh ta dijagonala $AC$ i $BD$ i neka je $O$ proizvoljna 
%  thmtext ta\ch ka na pravoj $M_1M_2$. Dokazati da je zbir povr\sh ina 
%  thmtext trouglova $ABO$ i $CDO$ jednak polovini povr\sh ine  
%  thmtext \ch etvorougla $ABCD$. 
%  thmtexte Given quadrilateral $ABCD$, let $M_1$ and $M_2$ be 
%  thmtexte midpoints of diagonals $AC$ and $BD$, and let $O$ 
%  thmtexte be point on line $M_1M_2$. Show that the sum of 
%  thmtexte areas of triangles $ABO$ and $CDO$ equals the half of the 
%  thmtexte area of quadrilateral $ABCD$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,M_1,M_2,m12,O,ac,bd] : ((
   dimensions(110, 110)
   & freepoint(A, 20, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 75, 85)
   & freepoint(D, 40, 65)
   & midpoint(M_1, A, C)
   & midpoint(M_2, B, D)
   & newline(m12, M_1, M_2)
   & collinear(O, M_1, M_2)
   & newline(ac, A, C)
   & newline(bd, B, D)
   & drawline(A, C)
   & drawline(B, D)
   & drawdashline(M_1, M_2)
   & cmark_b(M_1)
   & cmark_b(M_2)
   & cmark_t(O)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_t(D)
   & drawsegment(A, B)
   & drawsegment(C, B)
   & drawsegment(C, D)
   & drawsegment(A, D)
   & prooflevel(1)) 
 => 
   mult(2, sum(signed_area3(A, B, O), signed_area3(C, D, O))) = signed_area4(A, B, C, D))).

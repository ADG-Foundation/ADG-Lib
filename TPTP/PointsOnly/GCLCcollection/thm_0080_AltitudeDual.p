% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0080_AltitudeDual.p; Output: thm_0080_AltitudeDual.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0080_AltitudeDual.p; Output: tmp_2_thm_0080_AltitudeDual.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0080_AltitudeDual
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Dualna teorema visinama trougla 
%  thmnamee Dual Altitude Theorem 
%  thmtext Dat je trougao $ABC$ i ta\ch ka $O$ u 
%  thmtext istoj ravni. Neka su $p$, $q$ i $r$ 
%  thmtext prave koje prolaze kroz $O$ i normalne su 
%  thmtext sa pravama $OA$, $OB$ i $OC$ redom. 
%  thmtext Neka su $D$, $E$ i $F$ prese\ch ne ta\ch ke 
%  thmtext pravih $p$, $q$ i $r$ sa pravama 
%  thmtext $BC$, $AC$ i $BC$ redom. Dokazati da su 
%  thmtext $D$, $E$ i $F$ kolinearne. 
%  thmtexte Triangle $ABC$ and point $O$ are given. 
%  thmtexte Let $p$, $q$ and $r$ be lines through the point 
%  thmtexte $O$ which are perpendicular with lines $OA$, $OB$ and 
%  thmtexte $OC$ respectively. Let $D$, $E$, and $F$ be 
%  thmtexte intersections of lines $p$, $q$ and $r$ with lines 
%  thmtexte $BC$, $AC$ and $BC$ respectively. Show that 
%  thmtexte $D$, $E$ and $F$ are collinear. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,O,bc,ca,ab,oa,P1,D,ob,P2,E,oc,P3,F,def] : ((
   dimensions(100, 80)
   & freepoint(A, 20, 20)
   & freepoint(B, 80, 20)
   & freepoint(C, 40, 60)
   & freepoint(O, 75, 45)
   & newline(bc, B, C)
   & newline(ca, C, A)
   & newline(ab, A, B)
   & newline(oa, O, A)
   & perpendicular(P1, O, O, A)
   & intersection(D, P1, O, B, C)
   & newline(ob, O, B)
   & perpendicular(P2, O, O, B)
   & intersection(E, P2, O, C, A)
   & newline(oc, O, C)
   & perpendicular(P3, O, O, C)
   & intersection(F, P3, O, A, B)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_t(C)
   & cmark_r(O)
   & cmark_b(D)
   & cmark_t(E)
   & cmark_b(F)
   & drawsegment(A, B)
   & drawsegment(D, C)
   & drawsegment(C, A)
   & drawsegment(O, A)
   & drawsegment(O, B)
   & drawsegment(O, C)
   & drawdashsegment(O, E)
   & drawdashsegment(O, F)
   & drawdashsegment(O, D)
   & newline(def, D, E)
   & drawdashline(D, E)
   & prooflevel(1)) 
 => 
   collinear(D, E, F))).

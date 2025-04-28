% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0950_Pascal.p; Output: thm_0950_Pascal.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0950_Pascal.p; Output: tmp_2_thm_0950_Pascal.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0950_Pascal
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Paskalova teorema 
%  thmnamee Pascal's Theorem 
%  thmtext Na krugu $k$ sa centrom $O$ date su ta\ch ke 
%  thmtext $A$, $B$, $C$, $D$, $E$, i $F$. Neka su 
%  thmtext $P$, $Q$ i $S$ preseci parova pravih $AB$ i 
%  thmtext $FD$, $BC$ i $EF$, $AE$ i $CD$ redom. 
%  thmtext Dokazati da su ta\ch ke $P$, $Q$ i $S$ 
%  thmtext kolinearne. 
%  thmnote Paskalova teorema va\zh i i ako se umesto na krugu ta\ch ke 
%  thmnote nalaze na proizvoljnoj krivoj drugog reda. To je posledica 
%  thmnote osobina projektivne geometrije - svaki krug se mo\zh e 
%  thmnote projektivnim transformacijama koje \ch uvaju incidentnost 
%  thmnote pravih i ta\ch aka preslikati u proizvoljnu krivu drugog reda. 
%  thmtexte Hexagon $ABCDEF$ is incsibed in a circle with 
%  thmtexte center $O$. Show that three points at which 
%  thmtexte pairs of opposite sides meet, lie on a 
%  thmtexte straight line. 

include('geo.ax').
fof(thm, conjecture, ! [ A,O,k,B,C,D,E,F,ab,df,bc,fe,cd,ea,P,Q,S,pqs] : ((
   dimensions(100, 100)
   & freepoint(A, 20.5, 51.4)
   & freepoint(O, 50, 50)
   & newcircle(k, O, A)
   & on_circle(B, O, A)
   & on_circle(C, O, A)
   & on_circle(D, O, A)
   & on_circle(E, O, A)
   & on_circle(F, O, A)
   & newline(ab, A, B)
   & newline(df, D, F)
   & newline(bc, B, C)
   & newline(fe, F, E)
   & newline(cd, C, D)
   & newline(ea, E, A)
   & drawdashline(A, B)
   & drawdashline(D, F)
   & drawdashline(B, C)
   & drawdashline(F, E)
   & drawdashline(C, D)
   & drawdashline(E, A)
   & intersection(P, A, B, D, F)
   & intersection(Q, B, C, F, E)
   & intersection(S, C, D, E, A)
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
   & newline(pqs, P, Q)
   & drawline(P, Q)
   & prooflevel(1)) 
 => 
   collinear(P, Q, S))).

% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0322_Example122.p; Output: thm_0322_Example122.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0322_Example122.p; Output: tmp_2_thm_0322_Example122.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0322_Example122
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname Primer 122 iz \cite{chou} 
%  thmnamee Example 122 from \cite{chou} 
%  thmtext Stranice $BC$ i $CD$ \ch etvorougla $ABCD$ seku 
%  thmtext se u ta\ch ki $O$, dok se stranice $AD$ i $BC$ 
%  thmtext seku u ta\ch ki $O_1$. Na pravama $OA$, $OC$, 
%  thmtext $O_1A$, $O_1C$ su redom konstruisane ta\ch ke 
%  thmtext $E$, $F$, $E_1$ i $F_1$ takve da je 
%  thmtext $\overrightarrow{OE} \cong \overrightarrow{AB}$, $\overrightarrow{OF} \cong \overrightarrow{DC}$,  
%  thmtext $\overrightarrow{O_1E_1} \cong \overrightarrow{AD}$, $\overrightarrow{O_1F_1} \cong \overrightarrow{BC}$. 
%  thmtext Dokazati da su prave $EF$ i $E_1F_1$ paralelne. 
%  thmtexte The sides $BA$, $CD$ of the quadrilateral 
%  thmtexte $ABCD$ meet in $O$, and the sides $DA$, $CB$ 
%  thmtexte meet $O_1$. Along $OA$, $OC$, $O_1A$, $O_1C$ 
%  thmtexte are measured off, respectively, $OE$, $OF$, 
%  thmtexte $O_1E_1$, $O_1F_1$ equal to $AB$, $DC$, $AD$, 
%  thmtexte $BC$. Prove that $EF$ is parallel to $E_1F_1$. 

include('geo.ax').
fof(thm, conjecture, ! [ A,B,C,D,cd,ab,O,bc,ad,O_1,E,F,E_1,F_1] : ((
   dimensions(110, 110)
   & freepoint(A, 40, 20)
   & freepoint(B, 90, 20)
   & freepoint(C, 75, 50)
   & freepoint(D, 55, 40)
   & newline(cd, C, D)
   & newline(ab, A, B)
   & intersection(O, A, B, C, D)
   & newline(bc, B, C)
   & newline(ad, A, D)
   & intersection(O_1, B, C, A, D)
   & translate(E, A, B, O)
   & translate(F, D, C, O)
   & translate(E_1, A, D, O_1)
   & translate(F_1, B, C, O_1)
   & cmark_lb(F_1)
   & cmark_rb(E_1)
   & cmark_t(F)
   & cmark_b(E)
   & cmark_l(O_1)
   & cmark_b(O)
   & cmark_b(A)
   & cmark_b(B)
   & cmark_rt(C)
   & cmark_lt(D)
   & drawsegment(O, B)
   & drawsegment(F_1, B)
   & drawsegment(C, O)
   & drawsegment(A, E_1)
   & drawdashsegment(F_1, E_1)
   & drawdashsegment(F, E)
   & prooflevel(1)) 
 => 
   parallel(E, F, F_1, E_1))).

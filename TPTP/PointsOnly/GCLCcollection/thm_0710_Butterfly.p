% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_2_thm_0710_Butterfly.p; Output: thm_0710_Butterfly.p; Arg: [-p]
% ------------  TPTP/fof translation by Predrag Janicic, 2025.  ------------
% Input: tmp_1_thm_0710_Butterfly.p; Output: tmp_2_thm_0710_Butterfly.p; Arg: [-lines2points]
%--------------------------------------------------------------------------
% File     : tmp_thm_0710_Butterfly
% Domain   : Geometry 
% Problem  : ...
% Source   : Converted from GCLC Goran Predovic Collection of Theorems
% Refs     : Shang-Ching Chou: Mechanical Geometry Theorem Proving, Springer, 1988
% Status   : Valid
%--------------------------------------------------------------------------
%----Include geometry axioms
%include('geo.ax').
%--------------------------------------------------------------------------
%  thmname  Leptir teorema 
%  thmnamee Butterfly theorem 
%  thmtext Date su \ch etiri ta\ch ke na krugu $k$ 
%  thmtext sa centrom $O$, to su $P_1$, $P_2$, $P_3$ i 
%  thmtext $P_4$. Neka je $M$ presek pravih $P_1P_3$ i 
%  thmtext $P_2P_4$. Neka je prava $l$ normala iz ta\ch ke $M$ 
%  thmtext na pravu $OM$ i neka su $X$ i $Y$ preseci prave 
%  thmtext $l$ sa pravama $P_2P_3$ i $P_1P_4$ redom. 
%  thmtext Dokazati da je $M$ sredi\sh te du\zh i $XY$. 
%  thmtexte $P_1$, $P_2$, $P_3$ and $P_4$ are four points on 
%  thmtexte circle $k$ with a center $O$.  
%  thmtexte $M$ is the intersection of $P_1P_3$ and 
%  thmtexte $P_2P_4$. Through $M$ draw a line $l$ perpendicular 
%  thmtexte to $OM$, meeting $P_2P_3$ at $X% and $P_1P_4$ at $Y$. 
%  thmtexte Show that $MX \cong MY$. 
%  thmnote Po\sh to su $X$, $Y$ i $M$ na istoj pravoj, 
%  thmnote dovoljno je dokazati da je odnos paralelnih 
%  thmnote du\zh i $\overline{XM}$ i $\overline{MY}$ jednak $1$. 

include('geo.ax').
fof(thm, conjecture, ! [ P_1,O,k,P_2p,P_3p,P_4p,P_2,P_3,P_4,p1p3p,p1p3,p2p4p,p2p4,p1p4p,p1p4,p2p3p,p2p3,Mp,M,omp,om,P1,P2,Xp,X,Yp,Y] : ((
   dimensions(100, 100)
   & freepoint(P_1, 32, 40)
   & freepoint(O, 62, 40)
   & newcircle(k, O, P_1)
   & on_circle(P_2p, O, P_1)
   & on_circle(P_3p, O, P_1)
   & on_circle(P_4p, O, P_1)
   & freepoint(P_2, 35.8, 25.5)
   & freepoint(P_3, 62.8, 69.9)
   & freepoint(P_4, 77.8, 14.8)
   & newline(p1p3p, P_1, P_3p)
   & newline(p1p3, P_1, P_3)
   & newline(p2p4p, P_2p, P_4p)
   & newline(p2p4, P_2, P_4)
   & newline(p1p4p, P_1, P_4p)
   & newline(p1p4, P_1, P_4)
   & newline(p2p3p, P_2p, P_3p)
   & newline(p2p3, P_2, P_3)
   & intersection(Mp, P_1, P_3p, P_2p, P_4p)
   & intersection(M, P_1, P_3, P_2, P_4)
   & newline(omp, O, Mp)
   & newline(om, O, M)
   & perpendicular(P1, Mp, O, Mp)
   & perpendicular(P2, M, O, M)
   & intersection(Xp, P1, Mp, P_2p, P_3p)
   & intersection(X, P2, M, P_2, P_3)
   & intersection(Yp, P1, Mp, P_1, P_4p)
   & intersection(Y, P2, M, P_1, P_4)
   & cmark_l(P_1)
   & cmark_l(P_2)
   & cmark_lt(P_3)
   & cmark_b(P_4)
   & cmark_b(O)
   & cmark_lt(M)
   & cmark_l(X)
   & cmark_t(Y)
   & drawcircle(O, P_1)
   & drawdashline(P_1, P_3)
   & drawdashline(P_2, P_4)
   & drawdashline(P_1, P_4)
   & drawdashline(P_2, P_3)
   & drawsegment(X, Y)
   & prooflevel(1)) 
 => 
   sratio(X, M, M, Y) = 1)).

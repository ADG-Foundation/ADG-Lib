include('../Axioms/gelernter.ax').
include('../Axioms/gelernter-euclidean.ax').

% Example taken from Gelertner seminal paper:  
% REALIZATION OF A GEOMETRY THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------

fof(thm_B, conjecture, ![A,B,C,D]: (
  ( 
  ~collinear(A,B,D) & 
  ~collinear(C,D,B) & 
  parallel(B,C,A,D) & 
  cong(B,C,A,D) & 
  opposite_sides(D,B,A,C))
  => 
  cong(A,B,C,D) 
  )).
	
% --------------------------------------------------------------------------------


% larus TPTP/PointsOnly/gelernter/gel_thm_2.p  -t     -m7 -l2000 -h -noexcludedmiddle (2s)

 

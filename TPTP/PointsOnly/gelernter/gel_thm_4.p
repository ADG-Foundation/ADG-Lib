include('../Axioms/gelernter.ax').
include('../Axioms/gelernter-euclidean.ax').

% Example taken from Gelertner seminal paper:  
% EMPIRICAL EXPLORATIONS OF THE GEOMETRY-THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------

fof(thm_appendix1, conjecture, ![A,B,C,D,E,F,G,H]: (
  ( 
  ~collinear(E,F,G) &
  A!=D &
  B!=C &
  midpoint(E,A,B) &
  midpoint(F,A,C) &
  midpoint(G,C,D) &
  midpoint(H,B,D) 
  )
  => 
  parallelogram(E,F,G,H)
  )).
	
% --------------------------------------------------------------------------------

%  larus TPTP/PointsOnly/gelernter/gel_thm_4.p  -t     -m8 -l2000 -h -noexcludedmiddle

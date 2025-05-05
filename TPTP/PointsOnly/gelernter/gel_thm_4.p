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
  is_midpoint(E,A,B) &
  is_midpoint(F,A,C) &
  is_midpoint(G,C,D) &
  is_midpoint(H,B,D) 
  )
  => 
 parallelogram(E,F,G,H)
  )).
	
% --------------------------------------------------------------------------------

%  larus theorems/gel_thm_4.p -h -l1000 -m17 -n0 -i -t -noexcludedmiddle (25s)

%include('../axioms/axiomsGelernter.p').
include('../axioms/geo.ax').

% Example taken from Gelertner seminal paper:  
% EMPIRICAL EXPLORATIONS OF THE GEOMETRY-THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------

fof(thm_gelertner_4, conjecture, ![A,B,C,D,E,F,G,H]: (
 ( 
  quadrilateral(A,B,C,D) &
  midpoint(E,A,B) &
  midpoint(F,A,C) &
  midpoint(G,C,D) &
  midpoint(H,B,D) &
  ~collinear(E,F,G) 
 )
  => 
 parallelogram(E,F,G,H)
)).
	
% --------------------------------------------------------------------------------

% larus thm_gelertner_4.p -h  -t  -l100 -noexcludedmiddle -m8
% Elapsed time: 27.56s


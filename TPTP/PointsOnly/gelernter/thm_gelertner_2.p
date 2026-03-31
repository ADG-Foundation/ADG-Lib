%include('../axioms/axiomsGelernter.p').
include('../axioms/geo.ax').

% Example taken from Gelertner seminal paper:  
% REALIZATION OF A GEOMETRY THEOREM PROVING MACHINE
% --------------------------------------------------------------------------------

fof(thm_gelertner_2, conjecture, ![A,B,C,D]: (
  ( 
  quadrilateral(A,B,C,D) & 
  parallel(B,C,A,D) & 
  cong(B,C,A,D) &
  opposite_sides(B,D,A,C)
  )
  => 
  
  cong(A,B,C,D)
     
  )).
	
% --------------------------------------------------------------------------------

% larus thm_gelertner_2.p -h  -t  -l100 -noexcludedmiddle -m8
% Elapsed time: 1.33s


 

include('../Axioms/gelernter.ax').

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

% /larus theorems/gel_thm_2.p -h -l1000 -m14 -n0 -i -t (35s)
 

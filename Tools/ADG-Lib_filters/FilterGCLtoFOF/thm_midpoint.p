% thm_midpoint


%----Include Geometry Deductive Database Method axioms
include('geometryDeductiveDatabaseMethod.ax').

fof(tgtpthm_midpoint,conjecture,( ! [ A,B,C] : 
		(
		 midp(B_1,B,C) &
		 midp(A_1,A,C)
		)
		=>
		(
		 parallel(A_1,B_1,A,B)
		)
	)
).

% problema1


%----Include Geometry Deductive Database Method axioms
include('geometryDeductiveDatabaseMethod.ax').

fof(tgtpproblema1,conjecture,( ! [ A,B,C,D] : 
		(
		 midp(E,A,B) &
		 midp(F,B,C) &
		 midp(G,C,D) &
		 midp(H,D,A)
		)
		=>
		(
		 parallel(E,F,G,H)
		)
	)
).

%**********************************************
% Verify whether the input TPTP formulae belongs to the tiven theory T
%**********************************************

%verify_syntax(_Theory,A,_M) :- write('provera '),write(A),nl,fail.

verify_syntax(_Theory,include(_Ax),_M) :- !.

verify_syntax(Theory,fof(_, _, F), M) :- !,
   fof2Implication(F, _Univ, _Exi, Premises, Goal),
   conjunction2list(Premises, LP),
   verify_syntax(Theory, LP, M),
   verify_syntax(Theory, Goal, M).

verify_syntax(Theory, ~F, M) :- !,
   verify_syntax(Theory, F, M).
verify_syntax(_Theory, [], _M) :- !.     
verify_syntax(Theory, [F|T], M) :- !,  
   verify_syntax(Theory, F, M),
   verify_syntax(Theory, T, M).
verify_syntax(Theory, A, _M) :- 
   A =.. [Af | Args],
   length(Args, Len),
   signature(Theory, Af, Len),!.
verify_syntax(Theory, A, M) :- !,
   nl,write('Error! '), print(A,M), write(' does not belong to the theory '),write(Theory),nl,nl,fail.  



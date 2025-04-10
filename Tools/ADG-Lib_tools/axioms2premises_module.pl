%*******************************************************
% TPTP/FOF-Axioms to TPTP/FOF-Premises=>Goal translation
%*******************************************************

translate_tptp_entry_folAxioms2Premises(include(Ax),_M) :- !,
    nl,write("include('"),write(Ax),write("')."),nl.
translate_tptp_entry_folAxioms2Premises(fof(_Ax, axiom, F), _M) :- !,
    allpremises(P),
    retractall(allpremises(P)),
    assert(allpremises([F|P])). 
translate_tptp_entry_folAxioms2Premises(fof(Ax,conjecture, F),  M) :- !,
    write('fof('),write(Ax),write(', conjecture, '),
    allpremises(P),
    collect_all_points(P, M, AllPoints,_ConstructedPoints),
    delete_duplicates(AllPoints, AllPoints1),
    reverse(AllPoints1, AllPoints2),    
    write('! [ '),
    printaallquantifiers(AllPoints2, M),
    write('] : (('),nl,write('   '),
    printaallpremises(P,M),
    write(') '), nl, write(' => '),nl, write('   '),
    translate_goal_folAxioms2Premises(F, M),
    write(')).'),nl. 

printaallquantifiers([],_M).
printaallquantifiers([V],M) :- !,
   print(V,M).
printaallquantifiers([V|T],M) :- 
   print(V,M),write(','),
   printaallquantifiers(T,M).

printaallpremises([],_M).
printaallpremises([F],M) :- !,
    translate_term_folAxioms2Premises(F, M).
printaallpremises([$true|P],M) :-
    printaallpremises(P, M).
printaallpremises([F|P],M) :-
    printaallpremises(P, M),
    nl, write('   & '), 
    translate_term_folAxioms2Premises(F, M).

translate_term_folAxioms2Premises(F, M) :- !, 
   pretty_print(F,M).

translate_goal_folAxioms2Premises(F,M) :-    
   print(F,M).




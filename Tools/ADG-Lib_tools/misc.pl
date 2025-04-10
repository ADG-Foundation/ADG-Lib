
% ------------------------------------- 
% Pretty printing
% ------------------------------------- 

%print(A,M) :- write(' print'), write(A), nl, fail.

print(A, M) :- 
    var(A), !, 
    write_term(A, [variable_names(M)]).

print([],_) :- !.
print([H|L], M) :- !,
    pretty_print(H, M), write(' ; '),
    print(L, M).  
print(H,M) :- 
    pretty_print(H, M).

% -------------------------------------

%pretty_print(A, _M) :- 
%   nl, write(' print: '), write(A),nl,fail.

pretty_print(A, M) :- 
    var(A), !, 
    write_term(A, [variable_names(M)]), write(' ').
pretty_print(A, _M) :- 
    number(A), !, 
    write(A).
pretty_print(A - B, M) :- !,
    pretty_print(A, M),
    write(' != '),
    pretty_print(B, M).

pretty_print(A=B, M) :- !,
    pretty_print(A, M),
    write(' = '),
    pretty_print(B, M).

pretty_print([], _M) :- !,
    write('[]').
pretty_print([H|T], M) :- !,
    write('['),
    pretty_print(H, M),    
    pretty_print_list(T,M),
    write(']').
    
pretty_print($false, _M) :-  !,
    write($false).
pretty_print($true, _M) :-  !,
    write($true).
pretty_print(A, _M) :- 
    atom(A),
    not(var(A)), 
    atom_concat('nVar',S,A), !,
    atom_concat('NVar',S,A1),
    write(A1).
pretty_print(A, _M) :- 
    atom(A),
    not(var(A)),
    write(A).
pretty_print(A, M) :- 
    not(var(A)),!,
    A =.. [ F | Args ], 
    not(Args == []), !,
    write(F),write('('),
    pretty_print_list(Args, M),
    write(')').
pretty_print(A, M) :- 
    write_term(A, [variable_names(M)]).

pretty_print_list([], _M).
pretty_print_list([H], M) :- !,
  pretty_print(H, M). 
pretty_print_list([H | T], M) :-
  pretty_print(H, M), write(','),
  pretty_print_list(T, M).


% ------------------------------------- 
% Miscellaneous
% ------------------------------------- 

list_diff([], _B, []) :- !.
list_diff([H|T], B, TT) :-
   var_member(H,B),!,
   list_diff(T, B, TT).
list_diff([H|T], B, [H|TT] ) :- 
   list_diff(T, B, TT).


delete_duplicates([], []).
delete_duplicates([H|T], TT) :-
  var_member(H,T),!,
  delete_duplicates(T, TT).
delete_duplicates([H|T], [H|TT]) :-
  delete_duplicates(T, TT).

firstFour([C], [C]) :- !.
firstFour([C1, C2], [C1, C2]) :- !.
firstFour([C1, C2, C3], [C1, C2, C3]) :- !.
firstFour([C1, C2, C3, C4 | _], [C1, C2, C3, C4]) :- !.

% ------------------------------------- 

getNewVarName(Prefix, VarName) :-
    counterVar(I),
    I1 is I+1,
    number_string(I,SI),
    atom_concat(Prefix,SI,VarName),
    retractall(counterVar(_)),
    assert(counterVar(I1)).

% ------------------------------------- 



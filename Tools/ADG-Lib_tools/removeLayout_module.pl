%****************************************************************
% Specific TPTP->TPTP translation that removes layout information
%****************************************************************

translate_tptp_entry_folRemoveLayoutAxioms(include(Ax),_M) :- !,
    nl,write("include('"),write(Ax),write("')."), nl.
%translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, freepoint(_,_,_)), _M)    :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, drawsegment(_,_)), _M)     :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, drawdashsegment(_,_)), _M) :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, drawcircle(_,_)), _M)     :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, cmark_b(_)), _M)           :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, cmark_t(_)), _M)           :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, cmark_l(_)), _M)           :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, cmark_r(_)), _M)           :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, cmark_lt(_)), _M)          :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, cmark_rt(_)), _M)          :- !.
translate_tptp_entry_folRemoveLayoutAxioms(fof(_Ax, axiom, prooflevel(_)), _M)        :- !.

translate_tptp_entry_folRemoveLayoutAxioms(fof(Ax,axiom, F), M) :- !,
    print(fof(Ax, axiom, F), M),
    write('.'),nl. 
translate_tptp_entry_folRemoveLayoutAxioms(fof(Ax, conjecture, F), M) :- !,
    print(fof(Ax, conjecture, F),  M),
    write('.'),nl. 

translate_term_folRemoveLayoutAxioms(F, M) :- !, 
   pretty_print(F,M).


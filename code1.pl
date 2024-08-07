schedule(2, "first", 'binary search').
schedule(2, "second", 'stack').
schedule(3, "first", 'c++').
schedule(3, "second", 'binary search').
schedule(4, "first", 'containers').
schedule(4, "second", 'prefix').
schedule(5, "first", 'dfs').
schedule(5, "second", 'sparse table').
schedule(6, "first", 'segment tree').
schedule(6, "second", 'treap').
schedule(7, "first", 'persistents').
schedule(7, "second", 'aho').
schedule(8, "first", 'hld').
schedule(8, "second", 'persistent').
schedule(9, "first", 'number theory').
schedule(9, "second", 'fft').
schedule(10, "first", 'dp optimization').
schedule(10, "second", 'fft').

both(PARALLEL1, DAY1, PARALLEL2, DAY2, THEME) :-
  schedule(PARALLEL1, DAY1, THEME),
  schedule(PARALLEL2, DAY2, THEME).

one_from(PARALLEL, DAY, THEME1, THEME2) :-
  schedule(PARALLEL, DAY, THEME1);
  schedule(PARALLEL, DAY, THEME2).

equals(PARALLEL1, DAY1, PARALLEL2, DAY2) :-
  schedule(PARALLEL1, DAY1, THEME1),
  schedule(PARALLEL2, DAY2, THEME2),
  THEME1 == THEME2.

% is: X is ... / X = ...

next(PARALLEL, DAY, THEME) :-
  NEXT is PARALLEL + 1,
  schedule(NEXT, DAY, THEME).






add(A, B, ANS) :-
  ANS is A + B.



% ARRAY : for i in rand(ARRAY.length)

% !

check(0) :- !.

check(X) :-
  Y is X - 1,
  check(Y).

mul([], 1) :- !.

mul([0 | ARRAY], 0) :- !.

mul([HEAD | ARRAY], MTP) :-
  mul(ARRAY, MTP2),
  MTP is MTP2 * HEAD.

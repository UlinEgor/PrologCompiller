












%prime(2).
%prime(3).
% ....


divisible(A, B) :-
  X is A mod B,
  X == 0.

/*
prime2(N, INDEX) :-
  SQ is INDEX * INDEX,
  SQ > N, !.

prime2(N, INDEX) :-
  X is N mod INDEX,
  X > 0,
  NEXT_IND is INDEX + 1,
  prime2(N, NEXT_IND).

prime(N) :-
  prime2(N, 2).
*/

% assert(prime(2))

assert2(X, DIV) :-
  not_prime(X),
  !.

assert2(X, DIV) :-
  assert(not_prime(X)),
  assert(min_divisor(X, DIV)).

for2(INDEX, MAX_VAL, STEP) :-
  INDEX > MAX_VAL, !.

for2(INDEX, MAX_VAL, STEP) :-
  assert2(INDEX, STEP),
  NEXT_IDX is INDEX + STEP,
  for2(NEXT_IDX, MAX_VAL, STEP).

for(INDEX, INDEX) :- !.

for(INDEX, MAX_VAL) :-
  not_prime(INDEX),
  !,
  NEXT_IDX is INDEX + 1,
  for(NEXT_IDX, MAX_VAL).

/*for(INDEX, MAX_VAL) :-
  TMP is INDEX * INDEX,
  TMP > MAX_VAL,
  !.*/

for(INDEX, MAX_VAL) :-
  assert(min_divisor(INDEX, INDEX)),
  START is INDEX * INDEX,
  for2(START, MAX_VAL, INDEX),
  NEXT_IDX is INDEX + 1,
  for(NEXT_IDX, MAX_VAL).
  
prime(X) :-
  not not_prime(X).

init(MAX) :-
  for(2, MAX).

primes(1, []) :- !.
  
primes(X, ARRAY) :-
  min_divisor(X, Y),
  W is X / Y,
  primes(W, ARRAY2),
  ARRAY = [Y | ARRAY2].

swap([X, Y], [Y, X]).

merge([], X, X) :- !.
merge(X, [], X) :- !.

merge([H1 | T1], [H2 | T2], MERGED) :-
  H1 > H2,
  !,
  merge([H1 | T1], T2, MERGED2),
  MERGED = [H2 | MERGED2].

merge([H1 | T1], [H2 | T2], MERGED) :-
  merge(T1, [H2 | T2], MERGED2),
  MERGED = [H1 | MERGED2].

split([], [], []) :- !.
split([X], [X], []) :- !.

split([H1, H2 | T], SP1, SP2) :-
  split(T, NEW_SP1, NEW_SP2),
  SP1 = [H1 | NEW_SP1],
  SP2 = [H2 | NEW_SP2].

merge_sort([], []) :- !.
merge_sort([X], [X]) :- !.

merge_sort(ARRAY, SORTED) :-
  split(ARRAY, ARR1, ARR2),
  merge_sort(ARR1, SORTED1),
  merge_sort(ARR2, SORTED2),
  merge(SORTED1, SORTED2, SORTED).













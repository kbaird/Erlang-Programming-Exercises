-module(ex3_6).
-author("Kevin C. Baird").
-purpose("Implement quicksort and mergesort.").
-export([quicksort/1, mergesort/1]).

quicksort([])    -> [];
quicksort([H|T]) ->
  Before = [ X || X <- T, X < H],
  After  = [ X || X <- T, X >= H],
  quicksort(Before) ++ [H] ++ quicksort(After).

mergesort([])  -> [];
mergesort([X]) -> [X];
mergesort(L)  ->
  Len = length(L),
  {L1, L2} = lists:split(Len, L),
  SortedL1 = mergesort(L1),
  SortedL2 = mergesort(L2),
  merge(SortedL1, SortedL2).

merge([], L) -> L;
merge(L, []) -> L;
merge([H1|T1], [H2|T2]) ->
  case H2 < H1 of
    true  -> [ H2 | merge([H1|T1], T2) ];
    false -> [ H1 | merge(T1, [H2|T2]) ]
  end.

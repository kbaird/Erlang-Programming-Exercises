-module(ex3_5).
-author("Kevin C. Baird").
-purpose("Write functions to manipulate lists.").
-export([filter/2, reverse/1, concatenate/1, flatten/1]).

filter([], _) -> [];
filter([H|T], Max) ->
  case Max < H of
    true  -> filter(T, Max);
    false -> [H] ++ filter(T, Max)
  end.

reverse([])    -> [];
reverse([H|T]) -> reverse(T) ++ [H].

concatenate([])    -> [];
concatenate([H|T]) -> concatenate(H) ++ concatenate(T);
concatenate(X)     -> [X].

flatten(L) -> concatenate(L).

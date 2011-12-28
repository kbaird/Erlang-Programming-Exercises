-module(ex3_5_tests).
-author("Kevin C. Baird").
-include_lib("eunit/include/eunit.hrl").
-import(ex3_5, [filter/2, reverse/1, concatenate/1, flatten/1]).

filter_test() ->
  ?assertEqual(filter([1,2,3,4,5], 3), [1,2,3]).

reverse_test() ->
  ?assertEqual(reverse([1,2,3]), [3,2,1]).

concatenate_test() ->
  ?assertEqual(concatenate([[1,2,3], [], [4, five]]), [1,2,3,4,five]).

flatten_test() ->
  ?assertEqual(flatten([[1,[2,[3],[]]], [[[4]]], [5,6]]), [1,2,3,4,5,6]).

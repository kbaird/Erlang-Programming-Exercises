-module(ex3_6_tests).
-author("Kevin C. Baird").
-include_lib("eunit/include/eunit.hrl").
-import(ex3_6, [quicksort/1, mergesort/1]).

quicksort_empty_test() ->
  ?assertEqual(quicksort([]), []).

quicksort_test() ->
  ?assertEqual(quicksort([3,4,1,2]), [1,2,3,4]).

mergesort_empty_test() ->
  ?assertEqual(mergesort([]), []).

mergesort_test() ->
  ?assertEqual(mergesort([3,4,1,2]), [1,2,3,4]).


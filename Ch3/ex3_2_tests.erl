-module(ex3_2_tests).
-author("Kevin C. Baird").
-include_lib("eunit/include/eunit.hrl").
-import(ex3_2, [create/1]).

create_five_test() ->
  ?assertEqual(create(5), [1,2,3,4,5]).

create_one_test() ->
  ?assertEqual(create(1), [1]).


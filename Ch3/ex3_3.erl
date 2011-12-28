-module(ex3_3).
-author("Kevin C. Baird").
-purpose("Write functions count/1 and count_even/1 that print all/even # from 1 to N.").
-export([count/1, count_even/1]).

count(N)      -> [io:format("Number:~w~n",[X]) || X <- lists:seq(1,N)], ok.
count_even(N) -> [io:format("Number:~w~n",[X]) || X <- lists:seq(1,N), X rem 2 =:= 0], ok.


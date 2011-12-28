-module(ex3_2).
-author("Kevin C. Baird").
-purpose("Write functions create/1 and reverse_create/1 that return lists of the format [1,2,..,N-1,N] (and the reverse).").
-export([create/1, reverse_create/1]).

create(N) -> lists:reverse(reverse_create(N)).

reverse_create(1) -> [1];
reverse_create(N) when N < 1 -> erlang:error('create/1 can only handle positive arguments.');
reverse_create(N) -> [N] ++ reverse_create(N-1).


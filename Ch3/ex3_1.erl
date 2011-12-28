-module(ex3_1).
-author("Kevin C. Baird").
-purpose("Write functions sum/1 and sum/2 which, given a positive integer N, will return the sum of all the integers between 1 and N (or within the range).").
-export([sum/1, sum/2]).

sum(0) -> 0;
sum(X) when X < 0 -> erlang:error('sum/1 can only handle positive arguments.');
sum(X) -> X + sum(X-1).

sum(X, X) -> X;
sum(N, M) when N > M -> erlang:error('sum/2 requires that the first argument not be greater than the second.');
sum(N, M) -> N + sum(N+1, M).


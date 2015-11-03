-module(db).
-author("Kevin C. Baird").
-purpose("Ex3.4: Write a primitive DB using lists and records").
-export([new/0, write/3, read/2, read_lc/2, match/2, delete/2]).

new() -> [].

write(Key, Element, Db) ->
  [{Key, Element} | Db].

read(_, []) ->
  {error, instance};
read(DesiredKey, Db) ->
  [{Key, Element}|T] = Db,
  case DesiredKey =:= Key of
    true  -> {ok, Element};
    false -> read(DesiredKey, T)
  end.

%% Rewritten with List Comprehensions
read_lc(DesiredKey, L) ->
  Matches = [ {Key, Element} || {Key, Element} <- L, DesiredKey =:= Key],
  case Matches =:= [] of
    true  -> {error, instance};
    false ->
      [{_, Element}|_] = Matches,
      {ok, Element}
  end.

match(DesiredElement, Db) -> match(DesiredElement, Db, []).

match(_, [], [])      -> {error, instance};
match(_, [], Matches) -> lists:reverse(Matches);
%% Using lists:reverse. Could have avoided by doing
% 'Matches ++ [Key]' instead of '[Key] ++ Matches' below,
% but this is more efficient.

match(DesiredElement, Db, Matches) ->
  [{Key, Element}|T] = Db,
  %% Can be rewritten with List Comprehensions
  case DesiredElement =:= Element of
    true  -> match(DesiredElement, T, [Key | Matches]);
    false -> match(DesiredElement, T, Matches)
  end.

delete(_,           []) -> [];
delete(KeyToDelete, Db) ->
  [{Key, Element}|T] = Db,
  %% Can be rewritten with List Comprehensions
  case KeyToDelete =:= Key of
    true  -> delete(KeyToDelete, T);
    false -> [{Key, Element} | delete(KeyToDelete, T)]
  end.

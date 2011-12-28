-module(db_tests).
-author("Kevin C. Baird").
-include_lib("eunit/include/eunit.hrl").
-import(db, [new/0, destroy/1, write/3, delete/2, read/2, match/2]).

new_db_test() ->
  Db = db:new(),
  ?assertEqual([], Db).

write_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  ?assertEqual([{francesco,london}], Db1).

write_again_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  ?assertEqual([{lelle,stockholm},{francesco,london}], Db2).

write_yet_again_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  ?assertEqual([{joern,stockholm},{lelle,stockholm},{francesco,london}], Db3).

read_error_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  ?assertEqual({error,instance}, db:read(ola, Db3)).

read_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  ?assertEqual({ok,stockholm}, db:read(lelle, Db3)).

read_lc_error_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  ?assertEqual({error,instance}, db:read_lc(ola, Db3)).

read_lc_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  ?assertEqual({ok,stockholm}, db:read_lc(lelle, Db3)).

match_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  ?assertEqual([joern,lelle], db:match(stockholm, Db3)).

delete_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  Db4 = db:delete(lelle, Db3),
  ?assertEqual([{joern,stockholm},{francesco,london}], Db4).

match_after_delete_test() ->
  Db  = db:new(),
  Db1 = db:write(francesco, london, Db),
  Db2 = db:write(lelle, stockholm, Db1),
  Db3 = db:write(joern, stockholm, Db2),
  Db4 = db:delete(lelle, Db3),
  ?assertEqual([joern], db:match(stockholm, Db4)).


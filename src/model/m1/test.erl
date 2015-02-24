-compile({parse_transform, pmod_pt}).
-module(test,[Id,Name]).
-table("test").
-export([foo/0]).

%% hello
foo() ->
   " --- foo pas foo @@@@@@@@@@@@@@@@@@@ ----------- <br>".



-module(loadtest_index_controller,[Req, SessionId]).
-export([index/3]).

-default_action(index).

index(<<"GET">>, [], _ReqCtx) ->
 error_logger:info_msg("session_id ~p",[SessionId]),
 {ok, [{message, "Hello World from main app"},{sid, SessionId}]};

index(<<"GET">>, [A,B,C]=Params, _ReqCtx) ->
 Msg = io_lib:format("Hello World from main app with ~p", [Params]),
 {ok, [{message, Msg},{session_id, SessionId}]}.

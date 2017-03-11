using client/server on same computer, 
AMD E1-2100 APU with Radeon(TM) HD Graphics
FREQ 800MHz
L2 cache 1024 KB
Ubuntu 16.04 LTS

siege -c100 http://127.0.0.1:8000/test -b -t30s
** SIEGE 3.0.8
** Preparing 100 concurrent users for battle.
The server is now under siege...
Lifting the server siege...      done.

Transactions:		       22097 hits
Availability:		      100.00 %
Elapsed time:		       29.78 secs
Data transferred:	        3.79 MB
Response time:		        0.13 secs
Transaction rate:	      742.01 trans/sec
Throughput:		        0.13 MB/sec
Concurrency:		       99.51
Successful transactions:       22097
Failed transactions:	           0
Longest transaction:	        0.21
Shortest transaction:	        0.06
 
FILE: /var/log/siege.log
You can disable this annoying message by editing
the .siegerc file in your home directory; change
the directive 'show-logfile' to false.

using sample review app from n2o deps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cat deps/n2o/samples/apps/review/src/test.erl
-module(test).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/wf.hrl").

main() ->
  {A,B,C}=erlang:now(),
  random:seed(A,B,C),
  R = random:uniform(20),
  #dtl{file = "test", app=review,bindings=[{list,getList(R)}] }.


getList(R) ->
    lists:foldl(fun(N,A) ->
                 ["-",wf:to_list(N),#br{}|A] 
                end,[],lists:seq(1,R)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cat deps/n2o/samples/apps/review/src/routes.erl
-module(routes).
-author('Maxim Sokhatsky').
-include_lib("n2o/include/wf.hrl").
-export([init/2, finish/2]).

%% U can use default dynamic routes or define custom static as this
%% Just put needed module name to sys.config:
%% {n2o, [{route,routes}]}
%% Also with dynamic routes u must load all modules before starting Cowboy
%% [code:ensure_loaded(M) || M <- [index, login, ... ]]

finish(State, Ctx) -> {ok, State, Ctx}.
init(State, Ctx) ->
    Path = wf:path(Ctx#cx.req),
    wf:info(?MODULE,"Route: ~p~n",[Path]),
    {ok, State, Ctx#cx{path=Path,module=route_prefix(Path)}}.

route_prefix(<<"/ws/",P/binary>>) -> route(P);
route_prefix(<<"/",P/binary>>) -> route(P);
route_prefix(P) -> route(P).

route(<<>>)              -> login;
route(<<"counter",_/binary>>) -> counter;
route(<<"chat",_/binary>>) -> chat;
route(<<"doc",_/binary>>) -> doc;
route(<<"index",_/binary>>) -> index;
route(<<"static/spa/index",_/binary>>) -> index;
route(<<"static/spa/login",_/binary>>) -> login;
route(<<"login",_/binary>>) -> login;
route(<<"test",_/binary>>) -> test;
route(_) -> login.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cat test.html 
<html>
    <head>
        <title>Loadtest</title>
    </head>
    <body>
        {{list}}
    </body>
</html>

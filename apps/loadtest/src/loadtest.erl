-module(loadtest).
-behaviour(supervisor).
-behaviour(application).
-export([init/1, start/2, stop/1, main/1]).
-compile(export_all).

main(A)    -> mad_repl:sh(A).
start(_,_) -> supervisor:start_link({local,loadtest }, loadtest,[]).
stop(_)    -> ok.
init([])   -> naga:start([loadtest]), 
              sup().              
sup()      -> { ok, { { one_for_one, 5, 100 }, [] } }.

log_modules() -> [].

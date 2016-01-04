-module(loadtest_routes).
-include_lib("n2o/include/wf.hrl").
-include_lib("deps/naga/include/naga.hrl").

-export([init/2, finish/2]).

finish(State, Ctx) -> {ok, State, Ctx}.
init(State, Ctx) ->
    Req = Ctx#cx.req,

    {Bindings,_  }=cowboy_req:bindings(Req),
    {Controller,_}=cowboy_req:binding(controller,Req),
    {Action,_}    =cowboy_req:binding(action,Req),
    {Method,_}    =cowboy_req:method(Req),
    {Params,_}    =cowboy_req:path_info(Req),

    {C,A} = match(Controller,Action),
    Module = naga:module(loadtest,C),

    R = #{application    => loadtest,
          method         => Method,
          controller     => C,
          module         => Module,
          action         => A,
          params         => Params,
          bindings       => Bindings
         },
    io:format("~p~n",[R]),
    {ok, State, Ctx#cx{path=R,module=Module}}.

match(undefined        ,undefined)    -> {index  ,index};
match(<<"session">>    ,undefined)    -> {session,index};
match(_,_)                            -> {error  ,'404'}.

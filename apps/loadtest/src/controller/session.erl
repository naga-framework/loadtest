-module(session).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("naga/include/naga.hrl").


%% ----------
index(<<"GET">>, _, _) ->
    {A,B,C}=erlang:timestamp(),
    random:seed(A,B,C),
    R = random:uniform(20),
    List = getList(R),
    {render_other, #route{app=loadtest,controller=index,action=index}, [{list, List}]}.

getList(R) ->
    lists:foldl(fun(N,A) ->
            [[{val, N}]|A] end,
            [], lists:seq(1,R)).

hello(<<"GET">>, []) ->
    {ok, [{message, "Hello world !!!"}]}.


event(Event) -> wf:info(?MODULE,"Unknown Event: ~p~n",[Event]).
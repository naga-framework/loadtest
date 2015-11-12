-module(index).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("naga/include/naga.hrl").


index(<<"GET">>, _, _) ->
    {A,B,C}=erlang:now(),
    random:seed(A,B,C),
    R = random:uniform(20),
    List = getList(R),
    {ok, [{list, List}]}.


hello(<<"GET">>, [], _) ->
    {ok, [{message, "Hello world !!!"}]}.



event(Event) -> 
	wf:info(?MODULE,"Unknown Event: ~p~n",[Event]).


%% --- internal function --
getList(R) ->
    lists:foldl(fun(N,A) ->
            [[{val, N}]|A] end,
            [], lists:seq(1,R)).

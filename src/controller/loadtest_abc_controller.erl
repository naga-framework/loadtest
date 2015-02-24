-module(loadtest_abc_controller, [Req]).
-compile(export_all).

-default_action(index).

index('GET', []) ->
    {A,B,C}=erlang:now(),
    random:seed(A,B,C),
    R = random:uniform(20),
    List = getList(R),
    {ok, [{list, List}]}.

getList(R) ->
    lists:foldl(fun(N,A) ->
            [[{val, N}]|A] end,
            [], lists:seq(1,R)).

hello('GET', []) ->
    {ok, [{message, "Hello world !!!"}]}.

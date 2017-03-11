-module(session).
-export([index/3,hello/3]).
-include_lib("n2o/include/wf.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("naga/include/naga.hrl").

-session(false).

index(<<"GET">>, _, _) ->
    {A,B,C}=os:timestamp(),
    random:seed(A,B,C),
    R = random:uniform(20),
    List = getList(R),
    {ok, [{body, body(List)}]}.

hello(<<"GET">>, _, _) ->
    #dtl{file={loadtest,index,hello,"html"}, bindings=[{message, "Hello world !!!"}]}.

%event(Event) -> wf:info(?MODULE,"Unknown Event: ~p~n",[Event]).

%% --- internal function --
getList(R) ->
    lists:foldl(fun(N,A) ->
            [{val, N}|A] end,
            [], lists:seq(1,R)).

body([]) -> "Nope";
body(L)  -> lists:foldl(fun({val,N}, Acc) -> 
                         [wf:to_list(N),#br{}|Acc]
                       end, [], L).
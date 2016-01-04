-module(loadtest_index).
-export([index/3,hello/3]).
-include_lib("n2o/include/wf.hrl").
-include_lib("nitro/include/nitro.hrl").
-include_lib("naga/include/naga.hrl").

index(<<"GET">>, _, _) ->
    {A,B,C}=os:timestamp(),
    random:seed(A,B,C),
    R = random:uniform(20),
    List = getList(R),
    #dtl{file={loadtest,index,index,"html"}, bindings=[{body, body(List)}]}.

hello(<<"GET">>, _, _) ->
    {ok, [{message, "Hello world !!!"}]}.


% event(Event) -> 
%     wf:info(?MODULE,"Unknown Event: ~p~n",[Event]).


%% --- internal function --
getList(R) ->
    lists:foldl(fun(N,A) ->
            [{val, N}|A] end,
            [], lists:seq(1,R)).


body([]) -> "Nope";
body(L)  -> lists:foldl(fun({val,N}, Acc) -> 
                         [wf:to_list(N),#br{}|Acc]
                       end, [], L).


% {% if list %}
%   {% for l in list %}
%     -{{ l.val }}<br/>
%   {% endfor %}
% {% else %}
%   Nope
% {% endif %}


-module(error).
-export(['404'/3]).
-actions(['404']).
-default_action('404').

-include_lib("n2o/include/wf.hrl").
-include_lib("nitro/include/nitro.hrl").

'404'(_, _, _)   -> {ok, [{msg, "404 Not Found"}]}.

event(Event) -> wf:info(?MODULE,"Unknown Event: ~p~n",[Event]).

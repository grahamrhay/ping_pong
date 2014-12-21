-module(ws_handler).

-export([init/2]).
-export([websocket_handle/3]).
-export([websocket_info/3]).

init(Req, Opts) ->
    {cowboy_websocket, Req, Opts}.

websocket_handle({text, <<"ping">>}, Req, State) ->
    Reply = {text, <<"pong">>},
    {reply, Reply, Req, State};

websocket_handle(Frame, Req, State) ->
    io:format("Unexpected frame: ~p~n", [Frame]),
    {ok, Req, State}.

websocket_info(_Info, Req, State) ->
    {ok, Req, State}.

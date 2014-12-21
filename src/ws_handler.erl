-module(ws_handler).

-export([init/2]).
-export([websocket_handle/3]).
-export([websocket_info/3]).

init(Req, Opts) ->
    {cowboy_websocket, Req, Opts}.

websocket_handle({text, <<"{\"type\":\"ping\",\"count\":", Count:1/binary, "}">>}, Req, State) ->
    Reply = #{type => <<"pong">>, count => list_to_integer(binary_to_list(Count)) + 1},
    {reply, {text, jiffy:encode(Reply)}, Req, State};

websocket_handle(Frame, Req, State) ->
    io:format("Unexpected frame: ~p~n", [Frame]),
    {ok, Req, State}.

websocket_info(_Info, Req, State) ->
    {ok, Req, State}.

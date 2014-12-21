-module(ping_pong_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([{'_', [
        {"/", cowboy_static, {priv_file, ping_pong, "static/index.html"}},
        {"/connect", ws_handler, []}
    ]}]),
    Port = 8080,
    cowboy:start_http(my_http_listener, 100, [{port, Port}], [{env, [{dispatch, Dispatch}]}]),
    ping_pong_sup:start_link().

stop(_State) ->
    ok.

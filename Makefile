PROJECT = ping_pong
DEPS = cowboy jiffy

dep_cowboy = git git@github.com:ninenines/cowboy.git master
dep_jiffy = git git@github.com:davisp/jiffy.git 0.13.3

include erlang.mk

-module(minshell_boot).

-export([start/0]).

start() -> user_drv:start(['tty_sl -c -e',{minshell_shell,start,[]}]).

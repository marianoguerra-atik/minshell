-module(minshell_shell).

-export([start/0]).

start() ->
    spawn(fun main/0).

main() ->
    io:format("minshell, write quit to exit, Ctrl+G for Erlang's JCL~n~n"),
    loop(i_am_state).

loop(State) ->
      case io:get_line(">>> ") of
          eof -> quit();
          "quit\n" -> quit();
          Input ->
              io:format("You entered: ~p~n", [Input]),
              loop(State)
      end.

quit() ->
    io:format("Bye!~n"),
    c:q(),
    timer:sleep(5000), % to avoid printing the next ">>>"
    ok.

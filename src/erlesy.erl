-module(erlesy).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main([]) ->
  io:format("Usage:~nerlesy FileName LibPath*~n"),
  erlang:halt(0);
main(Args) ->
  [FileName | IncludeFiles] = Args,
  otp_parser_app:start(),
%%  otp_parser_app:start(ok, ok),
  otp_parser:create_graph(FileName, IncludeFiles, dot),
  os:cmd(["dot -Tsvg -o graph.svg ", filename:rootname(FileName) ++ ".gv"]),
  io:format("done.~n"),
  erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================

-module(otp_parser).

-behaviour(gen_server).

%% API
-export([start_link/0, create_graph/3]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [],
			  []).

create_graph(FileName, IncludePaths, Mode) ->
    gen_server:call(?MODULE,
		    {create, FileName, IncludePaths, Mode}, infinity).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init([]) -> {ok, #state{}}.

handle_cast(_Request, State) -> {noreply, State}.

handle_call({create, FileName, IncludePaths, dot},
	    _From, State) ->
    TargetFile = filename:rootname(FileName) ++ ".gv",
    io:format("Writing to ~p~n", [TargetFile]),
    {ok, File} = file:open(TargetFile, [write]),
    {parsed, _, Digraph} =
	graph_builder:parse_file(FileName, IncludePaths),
    file:write(File,
	       dot:digraph_to_dot(filename:rootname(FileName),
				  Digraph)),
    file:close(File),
    {reply, ok, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

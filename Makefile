.PHONY: compile get-deps test clean shell

compile: get-deps
	rebar3 compile

get-deps:
	rebar3 get-deps

clean:
	rebar3 clean

test:
	rebar3 eunit

shell:
	erl -sname erlesy -setcookie erlesy -pa _build/default/lib/erlesy/ebin -pa _build/default/lib/jsx/ebin -s otp_parser_app

escript:
	rebar3 escriptize
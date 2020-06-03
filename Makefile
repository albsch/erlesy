REBAR ?= ./rebar3

.PHONY: deps test docs xref dialyzer format

all: compile


format: 
	${REBAR} format

test: compile
	${REBAR} eunit

coverage: compile
	${REBAR} cover --verbose

docs:
	${REBAR} edoc

xref: compile
	${REBAR} xref

dialyzer:
	${REBAR} dialyzer

lint:
	${REBAR} as lint lint

compile: get-deps
	${REBAR} compile

get-deps:
	${REBAR} get-deps

clean:
	${REBAR} clean


shell:
	erl -sname erlesy -setcookie erlesy -pa _build/default/lib/erlesy/ebin -pa _build/default/lib/jsx/ebin -s otp_parser_app

escript:
	${REBAR} escriptize

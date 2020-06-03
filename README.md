# erlesy


![Language](https://img.shields.io/badge/language-erlang-blue.svg)
![Release](https://img.shields.io/badge/release-R21+-9cf.svg)
![Formatter](https://img.shields.io/badge/formatter-erlang_otp-33d.svg)
![Build](https://img.shields.io/badge/build-rebar3%203.13.1-brightgreen.svg)

[![Build Status](https://api.travis-ci.org/albsch/erlesy.svg?branch=master)](https://api.travis-ci.org/albsch/erlesy.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/albsch/erlesy/badge.svg?branch=master)](https://coveralls.io/github/albsch/erlesy?branch=master)

ErlEsy is a simple graphing tool for Erlang. It allows for automatic generation of state machine diagrams out of Erlang source files. It works by parsing an .erl source file and building a digraph out of it. The digraph can be then transformed into any format that will allow for its graphical representation.


## Building


### rebar3

ErlEsy can be build by rebar3

    rebar3 escriptize

### make

You can also use the makefile, with these directives:

- `make compile` - fetches deps and compiles erlesy
- `make shell` - starts an erlesy shell
- `make escriptize` - compiles to escript

## Running

    _build/default/bin/erlesy ErlFile IncludeFiles*

`ErlFile` should be a path to the .erl file you want to graph.
`IncludeFiles*` is a list of paths towards include files.

## Running from Shell

To run ErlEsy open a shell with

`make shell`

Then you can create any file by using

    -spec create_graph(string(), [string()], dot) -> ok.
    otp_parser:create_graph(FileName, IncludeFiles, Mode).

* FileName should be a path to the .erl file you want to graph
* IncludeFiles is a list of paths towards include files
* Mode is dot

## Output and graphing

ErlEsy currently supports one form of output, a [DOT (.gv)](https://en.wikipedia.org/wiki/DOT_(graph_description_language)) formatted file.

### DOT

DOT file can be used e.g. at http://www.webgraphviz.com/

## Example

Suppose your project structure is

* `project/src/your_fsm.erl`: The FSM you want to graph
* `project/include/`: Path to include files used by the fsm

Then execute the following in the erlesy folder:

* `make shell`
* `otp_parser:create_graph("/absolute_path_to_project/project/src/your_fsm.erl",["/absolute_path_to_project/project/include/"], dot].`

This will create a `.gv` dot file in the same folder the source is located in.

#!/usr/bin/env escript
%%! -smp enable


-record(
   note, {
     name    :: string(),
     letters :: string(),
     input   :: [ string() ],
     freq    :: float(),
     flute   :: string()
    }).

-type bank() :: [ #note{} ].

-spec main(Args :: [string()]) -> ok.
main(Args) ->
    parse_args(Args).

-spec parse_args(Args :: [string()]) -> [string()].
parse_args([S | Tail]) ->
    [S | parse_args(Tail)];
parse_args([]) ->
    [].


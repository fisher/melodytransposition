#!/usr/bin/env escript
%%! -smp enable

%% git clone git@github.com:jcomellas/getopt.git

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

-spec note_bank() -> bank().
note_bank() ->
    [
     #note{
        name = "Do", letters = "C", freq = 261.626,
        input = [ "C", "His" ],
        flute = "(X) X X X  X X X X"},
     #note{
        name = "Do-diese", letters = "C#", freq = 277.180,
        input = [ "C#", "Cd", "Db" ],
        flute = "(X) X X X  X X X ."}
    ].

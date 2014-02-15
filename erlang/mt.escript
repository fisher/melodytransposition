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
        flute = "(X) X X X  X X X ."},
     #note{
        name = "Re", letters = "D", freq = 293.665,
        input = [ "D" ],
        flute = "(X) X X X  X X X O"},
     #note{
        name = "Re-diese", letters = "D#", freq => 311.127,
        input = [ "D#", "Dd", "Eb" ],
        flute = "(X) X X X  X X . O"},
     #note{
        name = "Mi", letters = "E", freq = 329.628,
        input = [ "E", "Fb" ],
        flute = "(X) X X X  X X O O"},
     #note{
        name = "Fa", letters = "F", freq = 349.228,
        input = [ "F", "Ed", "E#" ],
        flute = "(X) X X X  X O O O"},
     #note{
        name = "Fa-diese", letters = "F#", freq = 369.994,
        input = [ "F#", "Fd", "Gb" ],
        flute = "(X) X X X  O X X X"},
     #note{
        name = "Sol", letters = "G", freq = 391.995,
        input = [ "G" ],
        flute = "(X) X X X  O O O O"},
     #note{
        name = "Sol-diese", letters = "G#", freq = 415.305,
        input = [ "G#", "Gd", "Ab" ],
        flute = "(X) X X O  X X . O"},
     #note{
        name = "La", letters = "A", freq = 440.000,
        input = [ "A" ],
        flute = "(X) X X O  O O O O"},
     #note{
        name = "La-diese", letters = "A#", freq = 466.164,
        input = [ "A#", "Ad", "B", "Bb", "Hb" ],
        flute = "(X) X O X  X O O O"},
     #note{
        name = "Si", letters = "H", freq = 493.883,
        input = [ "Cb", "H" ],
        flute = "(X) X O O  O O O O"}
    ].

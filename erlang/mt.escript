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
        name = "Do", letters = "C", input = [ "C", "His" ],
        freq = 261.626, flute = "(X) X X X  X X X X"},
     #note{
        name = "Do-diese", letters = "C#", input = [ "C#", "Cd", "Db" ],
        freq = 277.180, flute = "(X) X X X  X X X ."},
     #note{
        name = "Re", letters = "D", input = [ "D" ],
        freq = 293.665, flute = "(X) X X X  X X X O"},
     #note{
        name = "Re-diese", letters = "D#", input = [ "D#", "Dd", "Eb" ],
        freq = 311.127, flute = "(X) X X X  X X . O"},
     #note{
        name = "Mi", letters = "E", input = [ "E", "Fb" ],
        freq = 329.628, flute = "(X) X X X  X X O O"},
     #note{
        name = "Fa", letters = "F", input = [ "F", "Ed", "E#" ],
        freq = 349.228, flute = "(X) X X X  X O O O"},
     #note{
        name = "Fa-diese", letters = "F#", input = [ "F#", "Fd", "Gb" ],
        freq = 369.994, flute = "(X) X X X  O X X X"},
     #note{
        name = "Sol", letters = "G", input = [ "G" ],
        freq = 391.995, flute = "(X) X X X  O O O O"},
     #note{
        name = "Sol-diese", letters = "G#", input = [ "G#", "Gd", "Ab" ],
        freq = 415.305, flute = "(X) X X O  X X . O"},
     #note{
        name = "La", letters = "A", input = [ "A" ],
        freq = 440.000, flute = "(X) X X O  O O O O"},
     #note{
        name = "La-diese", letters = "A#",
        input = [ "A#", "Ad", "B", "Bb", "Hb" ],
        freq = 466.164, flute = "(X) X O X  X O O O"},
     #note{
        name = "Si", letters = "H", input = [ "Cb", "H" ],
        freq = 493.883, flute = "(X) X O O  O O O O"}
    ].

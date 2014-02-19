#!/usr/bin/env escript
%%! -smp enable

%% git clone git@github.com:jcomellas/getopt.git

-record(
   note, {
     name    :: string(),     %% Full name of note
     letters :: string(),     %% Short printable name
     input   :: [ string() ], %% Possible values on input
     freq    :: float(),      %% frequency of the sound
     flute   :: string()      %% block-flute fingering chart
    }).

-type note_bank() :: [ #note{} ].

-spec main(Args :: [string()]) -> ok.
main([]) ->
    getopt:usage(optspecs(), "mt.escript", "<melody spec>");
main(Args) ->
    Rep = getopt:parse(optspecs(), Args),
    case Rep of
        {error, {invalid_option, Option}} ->
            io:format("Error, unknown option: ~p~n", [Option]),
            getopt:usage(optspecs(), "mt.escript", "<melody spec>");
        {ok, {Options, Melody}} ->
            io:format("options: ~p, melody: ~p~n", [Options, Melody]);
        _ ->
            io:format("~p~n", [Rep])
    end.

optspecs() ->
    [
     {verbose_flag, $v, "verbose", {boolean, false}, "be verbose"},
     {bias, $b, "bias", {integer, 0}, "bias in semitones"},
     {vertical_flag, $V, "vertical", {boolean, false}, "vertical arrange"},
     {output, $o, "output", {string, "flute"}, "output format"},
     {version_flag, undefined, "version", {boolean, false}, "show the version"}
    ].

%% known notes database
-spec bank() -> note_bank().
bank() ->
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
        name = "Re-diese", input = [ "D#", "Dd", "Eb" ],
        letters = "D#", freq = 311.127, flute = "(X) X X X  X X . O"},
     #note{
        name = "Mi", letters = "E", input = [ "E", "Fb" ],
        freq = 329.628, flute = "(X) X X X  X X O O"},
     #note{
        name = "Fa", letters = "F", input = [ "F", "Ed", "E#" ],
        freq = 349.228, flute = "(X) X X X  X O O O"},
     #note{
        name = "Fa-diese", input = [ "F#", "Fd", "Gb" ],
        letters = "F#", freq = 369.994, flute = "(X) X X X  O X X X"},
     #note{
        name = "Sol", letters = "G", input = [ "G" ],
        freq = 391.995, flute = "(X) X X X  O O O O"},
     #note{
        name = "Sol-diese", input = [ "G#", "Gd", "Ab" ],
        letters = "G#", freq = 415.305, flute = "(X) X X O  X X . O"},
     #note{
        name = "La", input = [ "A" ],
        letters = "A", freq = 440.000, flute = "(X) X X O  O O O O"},
     #note{
        name = "La-diese", input = [ "A#", "Ad", "B", "Bb", "Hb" ],
        letters = "A#", freq = 466.164, flute = "(X) X O X  X O O O"},
     #note{
        name = "Si", letters = "H", input = [ "Cb", "H" ],
        freq = 493.883, flute = "(X) X O O  O O O O"}
    ].

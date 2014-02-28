#!/usr/bin/env escript
%%! -smp enable

%% git clone git@github.com:jcomellas/getopt.git

-record(
   note, {
     name     :: string(),     %% Full name of note
     letters  :: string(),     %% Short printable name
     input    :: [ string() ], %% Possible values on input
     freq     :: float(),      %% frequency of the sound
     flute    :: string(),     %% block-flute fingering chart
     position :: integer()
    }).

-type note_bank() :: [ #note{} ].

debug(Options, Format, Args) ->
    case proplists:get_value(verbose_flag, Options) of
        true ->
            io:format(Format, Args);
        _ ->
            ignore
    end.

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
            debug(Options, "options: ~p, melody: ~p~n", [Options, Melody]),
            L = [ find(N) || N <- Melody ],
            io:format("L: ~p~n", [L]),
            case trans(L, proplists:get_value(bias, Options)) of
                {error, Reason} ->
                    io:format("Error: ~p~n", [Reason]),
                    getopt:usage(optspecs(), "mt.escript", "<melody spec>");
                KeysTransposed ->
                    debug(Options, "KeysTransposed: ~p~n", [KeysTransposed]),
                    Outputs =
                        lists:map(
                          fun(N) ->
                                  [ Note ] =
                                      lists:filter(
                                        fun(NR) when NR#note.position == N -> true;
                                           (_) -> false
                                        end, bank()),
                                  Note#note.letters
                          end,
                          KeysTransposed),
                    io:format("Output: ~p~n", [string:join(lists:reverse(Outputs), " ")])
            end;
        _ ->
            io:format("~p~n", [Rep])
    end.

%% transpose the notes
-spec trans( List :: [ {error, term()} | {found, N::integer()} ], Bias :: integer() ) ->
                   [ Position :: integer() ] | {error, Cause :: term()}.
trans(List, Bias) ->
    lists:foldl(
      fun(_, {error, Cause}) ->
              {error, Cause};
         ({error, Note}, _Acc) ->
              {error, Note};
         ({found, N}, Acc) ->
              [padding(N +Bias) |Acc]
      end,
      [],
      List).


%% compensate bias to stay in [-11, 11]
-spec padding( integer() ) -> integer().
padding(N) when N > 11 ->
    padding(N -12);
padding(N) when N < 0 ->
    padding(N +12);
padding(Norm) ->
    Norm.

%% find the note for each single input lexem
-spec find( Input::string() ) -> {found, N :: integer()} | {error, Input::string()}.
find(Note) ->
    lists:foldl(
      fun(_E, {found, F}) ->
              {found, F};
         (E, Accum) ->
              case lists:member(Note, E#note.input) of
                  true ->
                      {found, E#note.position};
                  _ ->
                      Accum
              end
      end,
      {error, Note},
      bank()).

%% options spec for getopt module
-spec optspecs() -> getopt:option_spec().
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
        name = "Do", letters = "C",
        position = 0, input = [ "C", "His" ],
        freq = 261.626, flute = "(X) X X X  X X X X"},
     #note{
        name = "Do-diese", letters = "C#",
        position = 1, input = [ "C#", "Cd", "Db" ],
        freq = 277.180, flute = "(X) X X X  X X X ."},
     #note{
        name = "Re", letters = "D",
        position = 2, input = [ "D" ],
        freq = 293.665, flute = "(X) X X X  X X X O"},
     #note{
        name = "Re-diese", letters = "D#",
        position = 3, input = [ "D#", "Dd", "Eb" ],
        freq = 311.127, flute = "(X) X X X  X X . O"},
     #note{
        name = "Mi", letters = "E",
        position = 4, input = [ "E", "Fb" ],
        freq = 329.628, flute = "(X) X X X  X X O O"},
     #note{
        name = "Fa", letters = "F",
        position = 5, input = [ "F", "Ed", "E#" ],
        freq = 349.228, flute = "(X) X X X  X O O O"},
     #note{
        name = "Fa-diese", letters = "F#",
        position = 6, input = [ "F#", "Fd", "Gb" ],
        freq = 369.994, flute = "(X) X X X  O X X X"},
     #note{
        name = "Sol", letters = "G",
        position = 7, input = [ "G" ],
        freq = 391.995, flute = "(X) X X X  O O O O"},
     #note{
        name = "Sol-diese", letters = "G#",
        position = 8, input = [ "G#", "Gd", "Ab" ],
        freq = 415.305, flute = "(X) X X O  X X . O"},
     #note{
        name = "La", letters = "A",
        position = 9, input = [ "A" ],
        freq = 440.000, flute = "(X) X X O  O O O O"},
     #note{
        name = "La-diese", letters = "A#",
        position = 10, input = [ "A#", "Ad", "B", "Bb", "Hb" ],
        freq = 466.164, flute = "(X) X O X  X O O O"},
     #note{
        name = "Si", letters = "H",
        position = 11, input = [ "Cb", "H" ],
        freq = 493.883, flute = "(X) X O O  O O O O"}
    ].

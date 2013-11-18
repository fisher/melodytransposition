package myNotes {

use v6;

# known notes database
our @bank =
  (
   { 'Input' => ['His', 'C'],
     'freq' => 261.626, 'letters' => 'C', 'name' => 'Do' },
   { 'Input' => ['C#', 'Cd', 'Db'],
     'freq' => 277.180, 'letters' => 'C#', 'name' => 'Do-diese' },
   { 'Input' => ['D'],
     'freq' => 293.665, 'letters' => 'D', 'name' => 'Re' },
   { 'Input' => ['D#', 'Dd', 'Eb'],
     'freq' => 311.127, 'letters' => 'D#', 'name' => 'Re-diese' },
   { 'Input' => ['E', 'Fb'],
     'freq' => 329.628, 'letters' => 'E', 'name' => 'Mi' },
   { 'Input' => ['F', 'Ed', 'E#'],
     'freq' => 349.228, 'letters' => 'F', 'name' => 'Fa' },
   { 'Input' => ['F#', 'Fd', 'Gb'],
     'freq' => 369.994, 'letters' => 'F#', 'name' => 'Fa-diese' },
   { 'Input' => ['G'],
     'freq' => 391.995, 'letters' => 'G', 'name' => 'Sol' },
   { 'Input' => ['G#', 'Gd', 'Ab'],
     'freq' => 415.305, 'letters' => 'G#', 'name' => 'Sol-diese' },
   { 'Input' => ['A'],
     'freq' => 440.000, 'letters' => 'A', 'name' => 'La' },
   { 'Input' => ['A#', 'Ad', 'B', 'Bb', 'Hb'],
     'freq' => 466.164, 'letters' => 'A#', 'name' => 'La-diese' },
   { 'Input' => ['Cb', 'H'],
     'freq' => 493.883, 'letters' => 'H', 'name' => 'Si' }
  );

};

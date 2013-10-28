#!/usr/bin/env perl6
#

use v6;

# hardcoded melody
my @melody = <C D F>;

# transposition
my $bias = -3;

############
# cseg

# known notes database
my %notes =
  'C'  => 0,   'C#' => 1,
  'Db' => 1,   'D'  => 2,  'D#' => 3,
  'Eb' => 3,   'E'  => 4,
  'F'  => 5,   'F#' => 6,
  'Gb' => 6,   'G'  => 7,  'G#' => 8,
  'Ab' => 8,   'A'  => 9,  'A#' => 10,
  'Hb' => 10,  'Bb' => 10,
  'H'  => 11,  'B'  => 11;

my @reverse;

for %notes.keys -> $note { @reverse[%notes{$note}] = $note };

my $trans;
my @tr;

for @melody -> $note
  {
   print "$note ";
   $trans = %notes{$note} + $bias;
   $trans -= 12 if ($trans > 11);
   $trans += 12 if ($trans < 0);
   @tr.push: @reverse[$trans];
  }

say;#something;
say @tr.join: " ";

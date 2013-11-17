#!/usr/bin/env perl6
#

use v6;

use lib "./";

use myOptions;

# known notes database
my %notes =
  'His'=> 0,   'C'  => 0,
  'Db' => 1,   'Cd' => 1,   'C#' => 1,
  'D'  => 2,
  'Eb' => 3,   'D#' => 3,
  'Fb' => 4,   'E'  => 4,
  'F'  => 5,
  'Gb' => 6,   'F#' => 6,
  'G'  => 7,
  'Ab' => 8,   'G#' => 8,
  'A'  => 9,
  'Hb' => 10,  'Bb' => 10,  'B'  => 10,  'A#' => 10,
  'Cb' => 11,  'H'  => 11;

my @reverse;

for %notes.keys -> $note { @reverse[%notes{$note}] = $note };

sub MAIN (
     Int :$bias = 0,
         :$output = 'letter',
     Bool:$verbose = False,
          *@input )
{

  if (@input.elems <1) {say "USAGE";}
  say "bias is $bias, output format is $output, input is {@input}" if $verbose;

my $trans;
my @tr;

for @input -> $note
  {
   print "$note ";
   if (defined %notes{$note}) {
     $trans = %notes{$note} + $bias;
     $trans -= 12 if ($trans > 11);
     $trans += 12 if ($trans < 0);
     @tr.push: @reverse[$trans];
   } else {
     @tr.push: "?";
   }
  }

say;#something;
say @tr.join: " ";
}

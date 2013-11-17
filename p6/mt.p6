#!/usr/bin/env perl6
#

use v6;

use lib "./";

use myNotes;

my @letters;

for %myNotes::notes.keys -> $note
  { @letters[%myNotes::notes{$note}] = $note };

my $output;

sub MAIN (
     Int :$bias = 0,
     :$output = 'letters',
     Bool:$verbose = False,
     *@input )
{

  if (@input.elems <1) { say "USAGE not implemented yet"; }
  say "bias is $bias, output format is $output, input is {@input}"
    if $verbose;

  my $trans;
  my @tr;

  for @input -> $note
    {
     print "$note ";
     if (defined %myNotes::notes{$note}) {
       $trans = %myNotes::notes{$note} + $bias;
       $trans -= 12 if ($trans > 11);
       $trans += 12 if ($trans < 0);
       @tr.push: @letters[$trans];
     } else {
       @tr.push: "?";
     }
    };

  say;
  say @tr.join: " ";
}

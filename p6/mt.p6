#!/usr/bin/env perl6
#

use v6;

use lib "./";

use myNotes;

my @reverse;

for %myNotes::notes.keys -> $note
  { @reverse[%myNotes::notes{$note}] = $note };

sub MAIN (
     Int :$bias = 0,
         :$output = 'letter',
     Bool:$verbose = False,
          *@input )
{

  if (@input.elems <1) {say "USAGE";}
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
       @tr.push: @reverse[$trans];
     } else {
       @tr.push: "?";
     }
    };

  say;
  say @tr.join: " ";
}

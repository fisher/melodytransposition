#!/usr/bin/env perl6
#

use v6;

use lib "./";

use myNotes;


my %known;
for @myNotes::bank.kv -> $idx, %rec
  {
   for 0..%rec{'Input'}.elems-1 -> $j
   {
    %known{ %rec{'Input'}[$j] } = $idx;
   }
  };

my $output;

sub MAIN (
     Int :$bias = 0,
     :$output = 'letters',
     Bool:$verbose = False,
     Bool:$vertical = False,
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
     if (defined %known{$note}) {
       $trans = %known{$note} + $bias;
       $trans -= 12 if ($trans > 11);
       $trans += 12 if ($trans < 0);
       @tr.push: @myNotes::bank[$trans]{$output};
     } else {
       @tr.push: "?";
     }
    };

  say;

  if ($vertical) {
    for @tr -> $str { say $str; }
  } else {
    say @tr.join: " ";
  }

}

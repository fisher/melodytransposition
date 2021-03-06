#!/usr/bin/env perl6
#
# tested against rakudo star 2013.10, 2013.11, 2013.12, 2014.01
# on the Parrot vm
# 2014.04 was found faster on moar vm (use !/usr/bin/env perl6-m)
#

use v6;

use lib "./";

use myNotes;


# will use this hash to determine pitch numbers for known notes
my %known;
for @myNotes::bank.kv -> $idx, %rec
  {
   for 0..%rec{'Input'}.elems-1 -> $j
   {
    %known{ %rec{'Input'}[$j] } = $idx;
   }
  };

multi sub MAIN ( Bool:$version! )
  {
    say "mt-console, perl6 version";
  }

multi sub MAIN (
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
       while ($trans > 11) { $trans -= 12 };
       $trans += 12 while ($trans < 0);
       @tr.push: @myNotes::bank[$trans]{$output};
     } else {
       @tr.push: "?";
     }
    };

  say;

  if ($vertical) { say $_ for @tr; }
  else { say @tr.join: " "; }

}


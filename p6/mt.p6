#!/usr/bin/env perl6
#

use v6;

my @notes = <C C# D D# E F F# G G# A A# B>;

my @melody = <0 2 5>;

my $trans;
my $bias = -3;
my @tr;

for @melody -> $note {
    $trans = $note + $bias;
    $trans -= 12 if ($trans > 11);
    $trans += 12 if ($trans < 0);
    print @notes[$note]; print " ";
    @tr.push: @notes[$trans];
}
say;#something;
say @tr.join: " ";


#!/usr/bin/env perl
#

use strict;
use warnings;

use Test::More tests => 7;

=pod

=head1 NAME

10_console.t - do basic test against console mt util

=head1 PLAN

look for console binary or script, run it with various params and
check the expected output.

=head1 STAGES

Doing this:

=head2 looking for utility file

in current directory by resolving symbolic link mt-console

=head2 executing it

running it with various parameters and check the expected output

=head2 measure timings

run with simple parameter a couple of times and measure average time

=cut

is ( -e "mt-console", 1, "looking for 'mt-console' in the current directory");
is ( -x "mt-console", 1, "'mt-console' is executable");

# will use it as a flag or counter
my $f = 0;

# first opening pipe is a subject to check
if ( open (PIPE, "mt-console |") ) {

  while (<PIPE>) {
    /usage/i and $f=1;
  }
  is ( $f, 1, "found usage when without any parameters");
  close PIPE;

} else {

  fail "can't open the pipe";

}


# -----------------------------------------
open PIPE, "mt-console C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /C D E F G A H/ and $f++;
}

is ( $f, 2, "melody repeated with zero transposition" );
close PIPE;


# -----------------------------------------
open PIPE, "mt-console --bias=2 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /D E F# G A H C#/ and $f++;
}

is ( $f, 1, "melody transposed by two" );
close PIPE;


# -----------------------------------------
open PIPE, "mt-console --bias=3 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /D# F G G# A# C D/ and $f++;
}

is ( $f, 1, "melody transposed by three" );
close PIPE;


# -----------------------------------------
open PIPE, "mt-console --bias=-1 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /H C# D# E F# G# A#/ and $f++;
}

is ( $f, 1, "melody transposed by minus one" );
close PIPE;

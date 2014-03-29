#!/usr/bin/env perl
#

use strict;
use warnings;

use Test::More tests => 12;

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


# --- 1 ----------------------------------------
is ( -e "mt-console", 1, "looking for 'mt-console' in the current directory");


# --- 2 ----------------------------------------
is ( -x "mt-console", 1, "'mt-console' is executable");


# --- 3 ----------------------------------------

# will use it as a flag or counter
my $f = 0;

# first opening pipe is a subject to check
if ( open (PIPE, "mt-console 2>&1 |") ) {

  while (<PIPE>) {
    /usage/i and $f=1;
  }
  is ( $f, 1, "looking for usage when no parameters are given");
  close PIPE;

} else {

  fail "can't open the pipe";

}


# --- 4 -----------------------------------------
open PIPE, "mt-console --unknown 2>&1 |";

$f = 0;
while (<PIPE>) { /usage/i and $f = 1; }
is ( $f, 1, "mt-console --unknown -> usage" );
close PIPE;


# --- 5 -----------------------------------------
open PIPE, "mt-console --unknown A B C 2>&1 |";

$f = 0;
while (<PIPE>) { /usage/i and $f = 1; }
is ( $f, 1, "mt-console --unknown A B C -> usage" );
close PIPE;


# --- 6 -----------------------------------------
open PIPE, "mt-console C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /C D E F G A H/ and $f++;
}

is ( $f, 2, "melody repeated with zero transposition" );
close PIPE;


# --- 7 -----------------------------------------
open PIPE, "mt-console --bias=2 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /D E F# G A H C#/ and $f++;
}

is ( $f, 1, "melody transposed by two" );
close PIPE;


# --- 8 -----------------------------------------
open PIPE, "mt-console --bias=3 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /D# F G G# A# C D/ and $f++;
}

is ( $f, 1, "melody transposed by three" );
close PIPE;


# --- 9 -----------------------------------------
open PIPE, "mt-console --bias=-1 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /H C# D# E F# G# A#/ and $f++;
}

is ( $f, 1, "melody transposed by minus one" );
close PIPE;

# --- 10 -----------------------------------------
open PIPE, "mt-console --bias=14 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /D E F# G A H C#/ and $f++;
}

is ( $f, 1, "melody transposed by fourteen");
close PIPE;

# --- 11 -----------------------------------------
open PIPE, "mt-console --bias=-13 C D E F G A H |";

$f = 0;
while (<PIPE>) {
  /H C# D# E F# G# A#/ and $f++;
}

is ( $f, 1, "melody transposed by minus thirteen");
close PIPE;

# --- 12 -----------------------------------------
open PIPE, "mt-console --output=flute E |";

$f = 0;
while (<PIPE>) {
  /\(X\) X X X  X X O O/ and $f++;
}

is ( $f, 1, "output=flute for E");
close PIPE;

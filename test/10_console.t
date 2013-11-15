#!/usr/bin/env perl
#

use strict;
use warnings;

use Test::More tests => 1;

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

is ('universe', "universe", "am I right");

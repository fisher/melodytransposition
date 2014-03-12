#!/usr/bin/env python3
#
#

import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('notes', metavar='N', nargs='+',
                   help='a note for the melody')
parser.add_argument('--sum', dest='accumulate', action='store_const',
                   const=sum, default=max,
                   help='sum the integers (default: find the max)')

args = parser.parse_args()
print(args.accumulate(args.integers))



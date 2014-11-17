#!/usr/bin/env python
#


"""
Just a reminder how multiline comments are made.
It's something like that
"""

# NB: getopt.getopt can't handle options given _after_ melody spec

import getopt, sys
from notebank import bank

# defaults
verbose = False
vertical = " "
bias = 0
output = "letters"
args = None

# just a debug to show the variables
def qert(args, known):
    if verbose:
        print "verbose: ", verbose
        print "vertical:", vertical
        print "bias   : ", bias
        print "output : ", output
        print "melody : ", args
        print "bank   : ", bank
    print " ".join(args)
    #print "known:", known
    melody = []
    for l in args:
        if l in known:
            biased = known[l] +int(bias)
            while biased > 11:
                biased = biased -12
            while biased <0:
                biased = biased +12
            melody.append(biased)
        else:
            print "Unknown note, ", l
            usage()
            sys.exit()
    #print " ".join([str(n) for n in melody])
    print vertical.join([bank[n][output] for n in melody])

def check_bank():
    keys = bank[0].keys()
    for i in bank:
        if i.keys() != keys:
            print "Something wrong with this bank record: ", i
            sys.exit(1)
    del keys[keys.index("input")]
    known = {}
    for i in range(len(bank)):
        for j in bank[i]["input"]:
            known[j] = i
    return (keys, known)

def main():
    if len(sys.argv) <2:
        usage()
        sys.exit(2)
    try:
        opts, args = getopt.getopt(
            sys.argv[1:], "ho:vVb",
            ["help", "output=", "verbose", "vertical", "bias=", "version"])
    except getopt.GetoptError as err:
        print str(err) # will print something like "option -a not recognized"
        usage()
        sys.exit(3)
    global verbose, vertical, output
    (available_outputs, known_inputs) = check_bank()

    for o, a in opts:
        if o == "-v":
            verbose = True
        elif o == "--verbose":
            verbose = True
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            if a in available_outputs:
                output = a
            else:
                print "Unknown output spec: ", a
                usage()
                sys.exit(3)
        elif o in ("-b", "--bias"):
            global bias
            bias = a
        elif o in ("-V", "--vertical"):
            vertical = "\n"
        elif o in ("--version"):
            print sys.argv[0], "x, python2/getopt version (python)"
            sys.exit()
        else:
            assert False, "FIXME: unhandled option " + o
    if len(args) <1:
        usage()
        sys.exit(4)
    qert(args, known_inputs)

def usage():
    print "usage: ", sys.argv[0], " [options] <melody spec>"

if __name__ == "__main__":
    main()

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
vertical = False
bias = 0
output = None
args = None

# just a debug to show the variables
def qert():
    print "verbose: ", verbose
    print "vertical:", vertical
    print "bias   : ", bias
    print "output : ", output
    print "melody : ", args
    print "bank   : ", bank

def main():
    if len(sys.argv) <2:
        usage()
        sys.exit(2)
    try:
        opts, args = getopt.getopt(sys.argv[1:], "ho:vVb",
                                   ["help", "output=", "verbose", "vertical", "bias=", "version"])
    except getopt.GetoptError as err:
        # print help information and exit:
        print str(err) # will print something like "option -a not recognized"
        usage()
        sys.exit(2)
    global verbose, vertical, output
    for o, a in opts:
        if o == "-v":
            verbose = True
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            output = a
        elif o in ("-b", "--bias"):
            global bias
            bias = a
        elif o in ("-V", "--vertical"):
            vertical = True
        elif o in ("--version"):
            print sys.argv[0], "x, python2/getopt version (python)"
            sys.exit()
        else:
            assert False, "FIXME: unhandled option"
    qert()

def usage():
    print "usage: ", sys.argv[0], " [options] <melody spec>"

if __name__ == "__main__":
    main()

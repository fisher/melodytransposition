#!/usr/bin/env python
#


# NB: getopt.getopt can't handle options given _after_ melody spec

import getopt, sys

verbose = False
vertical = False
bias = 0
output = None
args = None

def qert():
    print "verbose: ", verbose
    print "vertical:", vertical
    print "bias   : ", bias
    print "output : ", output
    print "melody : ", args

def main():
    try:
        opts, args = getopt.getopt(sys.argv[1:], "ho:vVb",
                                   ["help", "output=", "verbose", "vertical", "bias=", "version"])
    except getopt.GetoptError as err:
        # print help information and exit:
        print str(err) # will print something like "option -a not recognized"
        usage()
        sys.exit(2)
    for o, a in opts:
        if o == "-v":
            verbose = True
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            output = a
        elif o in ("-b", "--bias"):
            bias = a
        elif o in ("-V", "--vertical"):
            vertical = True
        elif o in ("--version"):
            print sys.argv[0], ", python2/getopt version (python)"
            sys.exit()
        else:
            assert False, "FIXME: unhandled option"
    qert()

def usage():
    print "usage: ", sys.argv[0], " <melody spec>"

if __name__ == "__main__":
    main()


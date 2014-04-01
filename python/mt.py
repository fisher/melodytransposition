#!/usr/bin/env python
#


# NB: getopt.getopt can't handle options given _after_ melody spec

import getopt, sys

def main():
    try:
        opts, args = getopt.getopt(sys.argv[1:], "ho:v", ["help", "output="])
    except getopt.GetoptError as err:
        # print help information and exit:
        print str(err) # will print something like "option -a not recognized"
        usage()
        sys.exit(2)
    output = None
    verbose = False
    for o, a in opts:
        if o == "-v":
            verbose = True
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            output = a
        else:
            assert False, "unhandled option"
    print "verbose: ", verbose
    print "output : ", output
    print "melody : ", args

def usage():
    print "usage: ", sys.argv[0], " <melody spec>"

if __name__ == "__main__":
    main()

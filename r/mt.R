#!/usr/bin/env Rscript
#

## doc for this module:
## http://cran.r-project.org/web/packages/argparser/argparser.pdf
if(!require("argparser", quietly=TRUE)) {
    install.packages("argparser")
    require("argparser")
}

args <- commandArgs(trailingOnly = TRUE)

parser <- arg.parser("Melody transposition programm in R language")
parser <- add.argument(parser, "--verbose", help="show details", flag=TRUE)
parser <- add.argument(parser, "--bias", help="bias in semitones", default=0)
parser <- add.argument(parser, "--vertical", help="vertical alignment", flag=TRUE)
parser <- add.argument(parser, "--version", help="show the version", flag=TRUE)
parser <- add.argument(parser, "--output", help="output format", default="letters")


options = parse.args(parser, argv= args);

if ( options$version ) {
    print ("r script version")
    q(status=0)
}

if ( length(args) ==0 ) { ## no melody specified
    print(parser)
    q(status=1)
}

print (args)

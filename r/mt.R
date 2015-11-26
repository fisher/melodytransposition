#!/usr/bin/env Rscript
#

## doc for this module:
## http://cran.r-project.org/web/packages/argparser/argparser.pdf
if(!require("argparser", quietly=TRUE)) {
    install.packages("argparser")
    require("argparser")
}

#' parse command line options
#'
#' This will parse command-line options and should return an options object, class list
#'
#' @param args command-line arguments as it comes from commandArgs(trailingOnly = TRUE)
#' @import argparser
#' @return opts a list containing all the available options
#'
get.options <- function (args) {
    parser <- arg.parser("Melody transposition programm in R language")
    parser <- add.argument(parser, "--verbose", help="show details", flag=TRUE)
    parser <- add.argument(parser, "--bias", help="bias in semitones", default=0)
    parser <- add.argument(parser, "--vertical", help="vertical alignment", flag=TRUE)
    parser <- add.argument(parser, "--version", help="show the version", flag=TRUE)
    parser <- add.argument(parser, "--output", help="output format", default="letters")


    opts = parse.args(parser, argv= args);

    if ( opts$version ) {
        print ("r script version")
        q(status=0)
    }

    if ( length(args) ==0 ) { ## no melody specified
        print(parser)
        q(status=1)
    }

    return(opts)
}

#' main function
#'
#' This is the starting point for the program
#'
#' @param args command-line arguments as it comes from commandArgs(trailingOnly = TRUE)
#'
main <- function (args) {

    opts <- get.options(args)

    if(opts$verbose) {
        print(str(opts))
    }
}

## main function call
main(commandArgs(trailingOnly = TRUE))

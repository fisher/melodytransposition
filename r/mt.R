#!/usr/bin/env Rscript
#

## doc for this module:
## http://cran.r-project.org/web/packages/argparser/argparser.pdf
if(!require("argparser")) {
    install.packages("argparser")
    require("argparser")
}

spec = matrix(
    c(
      'help', 'h', 0, "logical", "Usage information",
	  'array_id', 'a', 1, "integer", "Value of the var"
	), ncol=5, byrow=TRUE);

opt = getopt(spec);

if (!is.null(opt$help)) {
    cat(getopt(spec, usage=TRUE));
	#writeLines("Usage: mt.R [options]");
	#writeLines("\t--help,h\tPrint usage options");
	#writeLines("\t--array_id,a\tValue of var");

	q(status=1);
}

print (opt$array_id);

n<-opt$array_id;


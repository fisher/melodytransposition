#!/usr/bin/env Rscript
#

# spec contains at least 4 columns, as many as 5 columns.
#
# column 1: long name of flag
# column 2: short name of flag
# column 3: argument flag. 0=no argument, 1=required argument, 2=optional argument
# column 4: mode of argument. one of "logical", "integer", "double", "complex", "character"
# column 5 (optional): description of option.
#
# Examples:
# $./example.R --array_id 42
# $./example.R --array_id $SLURM_ARRAYID

library(getopt);

opt = getopt(matrix(c(
	'help', 'h', 0, "logical", "Usage information",
	'array_id', 'a', 1, "integer", "Value of the var"
	), ncol=5, byrow=TRUE));

if (!is.null(opt$help)) {
	writeLines("Usage: mt.R [options]");
	writeLines("\t--help,h\tPrint usage options");
	writeLines("\t--array_id,a\tValue of var");

	q(status=1);
}

print (opt$array_id);

n<-opt$array_id;


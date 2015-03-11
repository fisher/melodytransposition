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

# can't use it:
#6. No support for mixing in positional arguments or extra arguments
# that don’t match any options.  For example, you can’t do
# "my.R –arg1 1 foo bar baz" and recover "foo", "bar", "baz" as a list.
# Likewise for "my.R foo –arg1 1 bar baz".
library(getopt);

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


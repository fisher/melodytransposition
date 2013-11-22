#!/usr/bin/guile -s
!#

(use-modules (ice-9 getopt-long))
(use-modules (ice-9 format))

(define (main args)
  (let* ((option-spec '((version (single-char #\v) (value #f))
			(bias    (single-char #\b) (value 0))
			(output  (single-char #\o) (value 'letters))
			(verbose                   (value #f))
			(vertical                  (value #f))
                        (help    (single-char #\h) (value #f))))
         (options (getopt-long args option-spec))
	 (bias (option-ref options 'bias 0))
	 (output-format (option-ref options 'output 'letters))
         (help-wanted (option-ref options 'help #f))
	 (verbose-wanted (option-ref options 'verbose #f))
         (version-wanted (option-ref options 'version #f))
	 (vertical-layout (option-ref options 'vertical #f)))
    (if (or version-wanted help-wanted)
        (begin
          (if version-wanted
              (display "mt-console, guile version (scheme)\n"))
          (if help-wanted
              (display "\
Usage: mt.scm [options] [<input> ...]

  -v, --version    Display version
  -h, --help       Display this help
  -b, --bias       Bias for melody transposition, an integer
  -o, --output     Output format, letters|names|freq|flute
      --verbose    Be more noisy
      --vertical   Format the output vertically (for flute)
")))
        (begin
          (display "Hello, World!") (newline)
	  (format #t "~:[~;verbose, ~]bias=~c" verbose-wanted bias)
	  (newline)
	  ) )))

(main (command-line))

#!/usr/bin/guile -s
!#

(use-modules (ice-9 getopt-long))
(use-modules (ice-9 format))
(use-modules (ice-9 regex))

(define (help)
              (display "\
Usage: mt.scm [options] [<input> ...]

  -v, --version    Display version
  -h, --help       Display this help
  -b, --bias       Bias for melody transposition, an integer
  -o, --output     Output format, letters|names|freq|flute
      --verbose    Be more noisy
      --vertical   Format the output vertically (for flute)
"))

(define (is-output? string)
;  '(begin
    (display "is-output? yes for now!")
    (format #t "\nthe option is ~s\n" string)
    #t)
;    ))

(define option-spec
  '(
    (version (single-char #\V) (value #f))
    (bias    (single-char #\b) (value #t))
    (output  (single-char #\o) (value #t)
             (predicate ,(lambda (x)
                           (string-match "^[0-9]+$" x))))
    (verbose (single-char #\v) (value #f))
    (vertical                  (value #f))
    (help    (single-char #\h) (value #f))))


(define (main args)
  (let ((options (getopt-long (command-line) option-spec)))
    (when (option-ref options 'help #f) (help))
    (format #t "asdf: ~s\n" options)))

(define (mdain args)
  (let (;(options (getopt-long args option-spec #:stop-at-first-non-option #t))
        (options (getopt-long (command-line) option-spec)))
         (bias (option-ref options 'bias 0))
         (output-format (option-ref options 'output 'letters))
         (help-wanted (option-ref options 'help #f))
         (verbose-wanted (option-ref options 'verbose #f))
         (version-wanted (option-ref options 'version #f))
         (vertical-layout (option-ref options 'vertical #f)) )

    (if (or version-wanted help-wanted)
        (begin
          (if version-wanted
              (display "mt-console, guile version (scheme)\n"))
          (if help-wanted (help)))
        (begin
          (display "Hello, World!") (newline)
          (format #t "~:[~;verbose, ~]bias=~b\n2" verbose-wanted (string->number bias))
          (format #t "return is: \"~s\"" (is-output? "blia"))
          (newline)
          ) ))

(if (eq? (length (command-line)) 1) (help) (main (command-line)))

;;(main (command-line))

.PHONY: clean

all: mt-console

mt-console: mt.scm
	# if it fails the target itself will fail
	# and if not we just see the version of interpreter
	@guile --version
	@ln -s mt.scm mt-console

test: ../test/10_console.t mt-console
	@../test/10_console.t

clean:
	rm mt-console

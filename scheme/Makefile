.PHONY: clean

all: mt-console

mt-console: mt.scm
	@guile --version
	@ln -s mt.scm mt-console

test: ../test/10_console.t mt-console
	@../test/10_console.t

clean:
	rm mt-console

.PHONY: clean

all: mt-console

mt-console: mt.p6
	@perl6 --version
	@ln -s mt.p6 mt-console

test: ../test/10_console.t mt-console
	@../test/10_console.t

clean:
	rm mt-console

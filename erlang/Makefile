ESCRIPT:=$(shell which escript)

.PHONY: clean

all: mt-console

mt-console: mt.escript
	@[ -n $(ESCRIPT) ]
	@ln -s mt.escript mt-console

test: ../test/10_console.t mt-console
	@../test/10_console.t

clean:
	rm mt-console

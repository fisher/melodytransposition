PYTHON:=$(shell which python)

.PHONY: clean

all: mt-console

mt-console: mt.py
	@python --version
	@ln -s mt.py mt-console

test: ../test/10_console.t mt-console
	@../test/10_console.t

clean:
	rm mt-console

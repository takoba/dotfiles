.PHONY: all init clean

all: init

init:
	@./setup.sh init
clean:
	@./setup.sh cleanup
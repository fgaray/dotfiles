PROGRAMS:=$(wildcard *)
PROGRAMS:=$(filter-out Makefile README.md, $(PROGRAMS))


all:
	stow $(PROGRAMS) -t $(HOME)

delete:
	stow -D $(PROGRAMS) -t $(HOME)

PROGRAMS:=$(wildcard *)
PROGRAMS:=$(filter-out Makefile, $(PROGRAMS))


all:
	stow $(PROGRAMS) -t $(HOME)

delete:
	stow -D $(PROGRAMS) -t $(HOME)

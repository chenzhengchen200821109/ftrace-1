CFLAGS ?= -ggdb -Wall -W -O
CC ?= gcc
LIBS ?=
LDFLAGS ?=
PREFIX ?= /usr/local
VERSION = 1.0
TMPDIR = /tmp/ftrace-$(VERSION)

all: ftrace tags

tags: *.c
	-ctags *.c

install: ftrace
	install -s ftrace $(DESTDIR)$(PREFIX)/bin
	install -m 644 ftrace.1 $(DESTDIR)$(PREFIX)/man/man1
	install -d $(DESTDIR)$(PREFIX)/share/doc/ftrace

ftrace: ftrace.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o ftrace ftrace.o $(LIBS)

clean:
	-rm -f *.o ftrace *~ core *.core tags

.PHONY: clean install all 

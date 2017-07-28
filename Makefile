#
# tcl library path for brew - needs to be parameterized somehow
#

# OS X 
# version for TCL brew package
#TCLVERSION=8.6.6_2
#BREWROOT=/usr/local/Cellar
#TCLINCPATH=$(BREWROOT)/tcl-tk/$(TCLVERSION)/include
#CFLAGSS=-I$(TCLINCPATH) 
#TCLLIBPATH=$(BREWROOT)/tcl-tk/$(TCLVERSION)/lib
#LDFLAGS=-L$(TCLLIBPATH)
#SWIFT_LDFLAGS="-Xlinker -L$(TCLLIBPATH) -Xlinker -ltcl8.6"

# Linux
SWIFT_LDFLAGS=-Xlinker -ltcl8.6

.PHONY: SwiftTcl8_6

all: tclrefcount.a SwiftTcl8_6

tclrefcount.a: tclrefcount.o
	ar -r libtclrefcount8.6.a tclrefcount.o 

tclrefcount.o: c/tclrefcount.c c/include/tclrefcount.h
	$(CC) -Ic/include -c -o tclrefcount.o c/tclrefcount.c

SwiftTcl8_6:
	@echo Ignore this: warning: module 'SwiftTcl8_6' does not contain any sources.
	swift build $(SWIFT_LDFLAGS)

install:
	cp libtclrefcount8.6.a /usr/lib/x86_64-linux-gnu

clean:
	rm -rf tclrefcount.o libtclrefcount8.6.a .build

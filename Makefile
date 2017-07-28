#
# Build the helper C library for the Tcl8_6 Swift package
# 

all: tclrefcount.a

tclrefcount.a: tclrefcount.o
	ar -r libtclrefcount8.6.a tclrefcount.o 

tclrefcount.o: c/tclrefcount.c c/include/tclrefcount.h
	$(CC) -Ic/include -c -fPIC -o tclrefcount.o c/tclrefcount.c

install:
	cp libtclrefcount8.6.a /usr/lib/x86_64-linux-gnu

clean:
	rm -rf tclrefcount.o libtclrefcount8.6.a .build

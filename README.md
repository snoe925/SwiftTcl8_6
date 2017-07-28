# SwiftTcl8_6

A Swift modulemap for libtcl8.6 support in Swift

### SwiftTcl needs helpers

The Tcl reference counting APIs are C macros.  Swift's modulemap support cannot transform C macros into Swift functions.
Therefore, we create a helper library to be statically linked, libtclrefcount8.6.a.

On Linux you will need to link Tcl and this helper to make a functioning SwiftTcl Tcl extension.

```
swift build -Xswiftc -emit-library -Xswiftc -o -Xswiftc libBanana.so -Xlinker -ltcl8.6 -Xlinker -ltclrefcount -Xlinker -ltclstub8.6 -Xlinker -lz
```

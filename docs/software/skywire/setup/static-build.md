# Static Build

A statically build binary has all the required library code built in and, it runs on about any system of the same type it was compiled on. Static binaries eliminate the dependency on external libraries.  
You can build static binaries in Linux
=== "Debian"
    !!! Install
        To install musl, run:
        ```
        $ apt-get install musl
        ```
        ---
=== "Arch Linux"
    !!! Install
        To install musl, run:
        ```
        $ sudo pacman -S musl
        ```
        --- 


To compile and install the binaries run:

```
$ make build-static && make install-static
```
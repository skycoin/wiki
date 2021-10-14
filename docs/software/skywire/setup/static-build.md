# Static Build

A statically built binary has all the required library code built in and it runs on about any system having same OS specifications as it was compiled on. Static binaries eliminate the dependency on external libraries.  
You can build static binaries on Linux
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
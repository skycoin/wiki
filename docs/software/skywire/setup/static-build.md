# Static Build

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
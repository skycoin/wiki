# Static Build

You can statically compile all Skywire binaries. Install musl-tools with a package manager of your choice.  

musl ports for Mac are not supported.  

To compile and install the binaries run:

```
# Installs all dependencies, build binaries and skywire apps
$ make build-static 
```

```
# Install statically compiled skywire-visor, skywire-cli and app CLI execs.
$ make install-static
```
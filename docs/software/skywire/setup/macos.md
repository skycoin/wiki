# **Build**
Skywire requires a Golang version of 1.17 or higher.

=== "macOS"
    !!! Install
        To install the required dependencies if they were not installed before, run:
        ```
        $ brew install go git make
        ```
    ---

## Clone
```
$ git clone https://github.com/skycoin/skywire.git
$ cd skywire
```

## Build and Install
make install will install binaries to `GOBIN`. Hence it requires `PATH` to be set correctly.  
Follow the GO installation guide [here](https://golang.org/doc/install).
```
$ make build && make install
```

# **Configure Skywire**  
To generate a default config file, run:
```
$ ./skywire-cli config gen
```
Start the visor with:
```
$ ./skywire-visor -c skywire-config.json
```
Use `-f` flag to run visor with hypervisor UI config.  
For more details check out the [configuration](../../configuration/hypervisor-mode/) section.
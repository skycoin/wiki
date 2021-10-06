# **Build**
Skywire requires a Golang version of 1.16 or higher.

=== "Debian"
    !!! Install
        To install the required dependencies if they were not installed before, run:
        ```
        $ sudo snap install go --classic git make
        ```
    ---

=== "Arch Linux"
    !!! Install 
        To install the required dependencies if they were not installed before, run:
        ```
        $ sudo pacman -S go git make
        ```
    ---

## Clone
```
$ git clone https://github.com/skycoin/skywire.git
$ cd skywire
```

## Build and Install
make install will install binaries to `GOBIN`. Hence it requires path to be set correctly.
```
$ make build; make install
```

# **Configure Skywire**  
To generate a default config file, run:
```
$ ./skywire-cli visor gen-config --is-hypervisor
```
Start the visor with:
```
$ ./skywire-visor -c skywire-config.json
```
For more details check out the [configuration]() section.



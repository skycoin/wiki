!!! Note
    `public visor` needs to be run on a `public IP`.  

## Hardware Requirements
- It is recommended for server to have minimum RAM of 2GB, if the connections go above 2500, RAM should be increased appropriately.
- `fs.inotify.max_user_watches` needs to be set relatively high.

## Install Skywire

Skywire requires a Golang version of 1.16 or higher.

=== "Debian"
    !!! Install
        To install the required dependencies if they were not installed before, run:
        ```
        $ sudo apt install git make
        ```
        To install GO, follow the installation guide [here](https://www.cloudbooklet.com/how-to-install-go-on-debian-10/) 
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
make install will install binaries to `GOBIN`. Hence it requires `PATH` to be set correctly.
Follow the GO installation guide [here](https://golang.org/doc/install).
```
$ make build && make install
```

## Configure Skywire  
To generate a default config file, run:
```
$ ./skywire-cli visor gen-config --is-hypervisor
```

## Make visor public
To make the visor public, change `"is_public": false` to `"is_public": true` in the `skywire-config.json` file.
```
"is_public": true
```
Save the changes.  
Start the visor with:
```
$ ./skywire-visor -c skywire-config.json
```
!!! Note
    Skywire visor may run on Windows, but this process requires some manual operations at the moment.

## Install Dependencies
<!-- - Skywire requires a Golang version of 1.16 or higher. Follow the GO installation guide [here](https://golang.org/doc/install).
- Download and install git from [here](https://git-scm.com/downloads).
 -->

=== "Windows"
    !!! Install 
        To install `make` and `gcc`, run:
        ```
        mingw-get install mingw32-make gcc
        ```
        Requires `mingw-get` to be installed.  
- Skywire requires a Golang version of 1.16 or higher. Follow the GO installation guide [here](https://golang.org/doc/install).  
- Download and install git from [here](https://git-scm.com/downloads).  

## Clone

```
git clone https://github.com/skycoin/skywire.git
cd skywire
```

## Build 
To run the skywire visor on Windows, you will need to build it first:
```
make build-windows 
```
Apps should be declared in the config without `.exe` extension.

## Configure Skywire
To generate a config file, run:
```
.\skywire-cli.exe config gen -t --is-hypervisor -r -o .\skywire-config.json
```
`skywire-config.json` file will be created in the root directory of the project.

To start the visor, run:
```
.\skywire-visor.exe -c .\skywire-config.json
``` 
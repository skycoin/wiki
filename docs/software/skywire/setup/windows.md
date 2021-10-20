!!! Note
    Skywire visor is only supported by Windows 10 and Windows Server 2019. This process requires some manual operations at the moment.  
    Run all the commands using `Powershell`(Administrator).

## Install Dependencies

=== "Windows"
    !!! Install 
        To install `make` and `gcc`, run:
        ```
        mingw-get install mingw32-make gcc
        ```
        Requires `mingw-get` to be installed. Follow the guide [here](http://www.codebind.com/cprogramming/install-mingw-windows-10-gcc/).
- Skywire requires a Golang version of 1.16 or higher. Follow the GO installation guide [here](https://golang.org/doc/install).  
- Download and install git from [here](https://git-scm.com/downloads).  

## Clone

```
git clone https://github.com/skycoin/skywire.git
cd skywire
```

## Build 
To run the skywire visor on windows, you will need to build it first:
```
make build-windows 
```

## Configure Skywire
To generate a config file, run:
```
.\skywire-cli.exe config gen -i -r -o .\skywire-config.json
```
`skywire-config.json` file will be created in the root directory of the project.

To start the visor, run:
```
.\skywire-visor.exe -c .\skywire-config.json
``` 
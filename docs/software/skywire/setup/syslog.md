
## Install
=== "Debian"
    !!! Install
        To install syslog-ng, run:
        ```
        $ sudo apt-get install syslog-ng
        ``` 
    ---

=== "Arch Linux"
    !!! Install 
        To install syslog-ng, run:
        ```
        $ sudo pacman -S syslog-ng
        ```
    ---

## Build

In skywire uncomment `replace github.com/skycoin/dmsg => ../dmsg` in go.mod and run
```
$ make dep
```
Run
```
$ make build
```
Run syslog-ng
```
$ sudo syslog-ng -f ./init/syslog-ng.conf -edv
```

In a new terminal, run
```
$ ./skywire-visor -c skywire-config.json --syslog localhost:514
```
Check the logs in a new terminal via
```
$ sudo cat /var/log/skywire
```
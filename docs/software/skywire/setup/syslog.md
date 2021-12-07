
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
!!! Note
    If the above command does not work, host may need to be changed to the correct interface.

Check the logs in a new terminal via
```
$ sudo cat /var/log/skywire
```
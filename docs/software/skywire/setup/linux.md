# **Build**
Skywire requires a Golang version of 1.16 or higher.
=== "Debian"
    - Install GO with the following command:
    ```
    $ sudo apt install golang-go
    ```
    - Install git with the following command:
    ```
    sudo apt install git
    ```
    - Install make:
    ```
    sudo apt-get install make
    ```
    ---

=== "Arch Linux"
    - Install GO with the following command:
    ```
    $ sudo pacman -S go
    ```
    - Install git with the following command:
    ```
    sudo pacman -S git
    ```
    - Install make:
    ```
    sudo pacman -S make
    ```
    ---

## Clone
```
$ git clone https://github.com/skycoin/skywire.git
$ cd skywire
```

## Build and Install
```
# Make install will install binaries to GOBIN. Hence it requires path to be set correctly.
$ make build; make install
```

# **Configure Skywire**  
User can generate default config file with:
```
$ ./skywire-cli visor gen-config --is-hypervisor
```
And then run it with:
```
$ ./skywire-visor -c skywire-config.json
```
For more details check out the [configuration]() section.



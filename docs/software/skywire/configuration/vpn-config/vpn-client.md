# Skywire VPN Client

## Introduction

This guide explains the setup procedure and includes operating instructions of the Skywire VPN Client. Please refer to the [Skywire VPN Server](vpn-server.md) guide in case you want to setup your own Skywire VPN Server.

## Installation

!!! Note
    To use Skywire VPN, it is necessary to install Skywire on your computer.  
    To install skywire follow the guide:  
    - [macOS](../../../setup/macos)  
    - [Linux](../../../setup/linux)  

    The rest of this guide assumes that you have installed the Skywire Visor and generated configuration file.

## Setup

Open `skywire-config.json` file and insert the `public key` of the server into the `vpn-client` field:
```
{	
    "name": "vpn-client",
    "args": [
        "-srv",
        "033e4804bb27ad717aabb406afbb938edb2bd41d1d1485db1b68540bebdeb7c910"
    ],
	"auto_start": false,
	"port": 43
}
```
You can find a list of publically available VPN servers [here](http://sd.skycoin.com/api/services?type=vpn).  

!!! Note
    Skywire VPN Client requries root privileges to run.

To start the visor, run
```
sudo ./skywire-visor skywire-config.json
```
Enter the password if prompted.  

!!! info "Run Skywire VPN Client without root"
    === "Linux"
        To set capabilities, run:
        ```
        sudo setcap 'cap_net_admin+p' ./apps/vpn-client
        ```
        Start the visor:
        ```
        ./skywire-visor ./skywire-config.json
        ```
        ---
    === "macOS"
        !!! Note
            Binary has to be owned by root and have permissions like 4755
        To change owner of binary to root, run:
        ```
        sudo chown root ./apps/vpn-client
        ```
        To provide permissions, run:
        ```
        sudo chmod 4755 ./apps/vpn-client
        ```
        Start the visor:
        ```
        ./skywire-visor ./skywire-config.json
        ```
        ---

To establish a transport to the VPN server, replace the values below with the remote public key you selected:
```
./skywire-cli visor add-tp 033e4804bb27ad717aabb406afbb938edb2bd41d1d1485db1b68540bebdeb7c910 --type stcpr
```

!!! Note
    The `stcpr` and `sudph` transports are the most performant. It is recommended to try to setup these transports first. If these are not available, setup a `dmsg` transport.  

After setting up the transport, run the VPN: 
```
./skywire-cli visor start-app vpn-client
```

To stop the VPN Server, run:
```
./skywire-cli visor stop-app vpn-server
```


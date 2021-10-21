# Skywire VPN Client

## Introduction

This guide explains the setup procedure and includes operating instructions of the Skywire VPN Client. Please refer to the [Skywire VPN Server](vpn-server.md) guide in case you want to use Skywire VPN Server for Skywire VPN.

## Installation

To use Skywire VPN, it is necessary to install Skywire on your computer.  
To install skywire follow the guide:  
- [macOS](../../../setup/macos)  
- [Linux](../../../setup/linux)  

The rest of this guide assumes that you have installed the Skywire Visor and generated configuration files.

## Setup

Open `skywire-config.json` file and insert the `public key` of the server into the `vpn-client` field:
```
{	
    "name": "vpn-client",
    "args": ["-srv","033e4804bb27ad717aabb406afbb938edb2bd41d1d1485db1b68540bebdeb7c910"],
	"auto_start": false,
	"port": 43
}
```
Find the list of available VPN servers [here](http://sd.skycoin.com/api/services?type=vpn).  

To start the visor, run
```
sudo ./skywire-visor skywire-config.json
```
Enter the password if prompted.  

Replace the values below with the remote public key you selected:
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


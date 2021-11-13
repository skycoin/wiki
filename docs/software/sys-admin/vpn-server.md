# Skywire VPN Server

!!! Note 
    For ease of setting up a connection to your VPN server, it is recommended to deploy the VPN server on a machine with a public IP. This will allow clients to establish `stcpr` transports which use a simple TCP connection instead of relayed connections over `dmsg`.

## Introduction

This guide explains the setup procedure and includes operating instructions of the Skywire VPN Server.

!!! Note
    The configuration & starting/stopping of the Skywire VPN Server can also be performed using the Skywire HypervisorUI via the Apps page of the respective Visor.

## Installation

### **Dependencies**

Skywire VPN Server requires Golang v1.16 or higher.  

=== "Debian"
    !!! Install
        To install the dependencies required by Skywire VPN Server, run:
        ```
        $ sudo apt install git iproute2
        ```
        To install GO, follow the installation guide [here](https://www.cloudbooklet.com/how-to-install-go-on-debian-10/) 
    ---

=== "Arch Linux"
    !!! Install 
        To install the dependencies required by Skywire VPN Server, run:
        ```
        $ sudo pacman -S go git iproute2
        ```
    ---

### **Skywire Visor**

Skywire VPN Server requires Skywire Visor to be installed, follow the guide [here](../skywire/setup/linux.md).

## Configure

The Skywire VPN server can be configured to require a passcode for authentication of clients or can be freely accessible without passcode.
!!! Note 
    VPN server needs to be freely accessible without passcode to be publicly advertised in Skycoin's service discovery.

To set a passcode, edit the `skywire-config.json` file and pass the following arguments:
```
    {
		"name": "vpn-server",
		"auto_start": false,
		"port": 44,
		"args":["-passcode","<your-passcode>", "-secure", "true"]
    }
```
VPN server needs to be started manually after the Visor was started. To start the VPN server automatically upon the startup of Skywire Visor, set `"auto_start": false` to `"auto_start": true`.  
The `"-secure"` flag prevents VPN client users from SSH'ing into the VPN-server's machine. It defaults to true. 

## Operating Skywire VPN Server

*The following assumes that you take care of detaching processes from the terminal yourself.*

In order to run the Skywire VPN server, first run the Visor:
```
$ sudo ./skywire-visor skywire-config.json
```
!!! Note
    The VPN server requires root privileges to setup a TUN interface and configure the systems routing rules.

To start the VPN Server, run:
```
$ ./skywire-cli visor start-app vpn-server
```

To stop the VPN Server, stop the visor or run:
```
$ ./skywire-cli visor stop-app vpn-server
```

# Networking Guide Official Skyminer

*This guide assumes that you have read and understood the readme.md, downloaded the official images and do every step exactly the way it is described. Misconduct will lead to the inability to connect and to potential reflashing. It is very important that there is no IP collision with your existing home router subnet. The default settings of the official images, as well as the router of the Skyminer, are using the 192.168.0.0/24 subnet while deviating IP configurations may work.*

## Introduction

After finishing off all the steps in this guide you will be able to access the *hypervisorUI* from within your home network, access the devices in the subnet of the Skyminer router via SSH and of course, capable of using the SOCKS5 Skywire proxy.

The Skyminer router has 8 LAN ports, so during this guide, you will need to unplug one from the router to gain access with your computer, later on, you will have to plug it back in. 
Before you're starting with this guide please turn off all pi's, none of them need to run until you are being told to turn them on.

## Requirements in Hardware & Software

* Official Skyminer router. You are advised to flash the sd cards of the orange pi prime's with the official images, refer to the [Skyimager Guide](https://github.com/skycoin/skywire/wiki/Skyimager-User-Guide) for instructions or [build Skywire from source](/software/skywire/setup/linux.md). Manual installation of Skywire works just as fine but needs manual adjustments of setting up systemd services etc.
* Computer/laptop with LAN port
* LAN cable

***

## Setup
Before you do the following steps make sure that there is no cable attached to the WAN port of the Skyminer router. Restart both the Skyminer router and your computer. 

![network_topology](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/network_topology_access_skyminer.png)


### Accessing the interface of the router
Connect your computer to a LAN port of the Skyminer router, it doesn't matter which one. Then open a browser window and type:
```
192.168.0.1
```
The router interface should come up, looking like this: 
![welcome_page](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/router_welcome_page.png)

If you are queried to type in a password it is 'admin'.
As you can see the default language is in Chinese, to proceed we need to change it to English. To accomplish this go the rightmost tab:
![default_login_language](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/login_default_language.png)

Choose the 2nd option in the drop-down menu and click on the right button. 

![change_language_dropdown](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/change_language.png)

After that refresh the page, it should look like this:

![changed_language](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/changed_language.png)

### Port Forwarding rules
Now that the language is changed we can proceed and set up the necessary port forwarding rules to access the Skywire manager from outside the subnet of the Skyminer router (i.e. when you're not connected to one of its LAN ports).

Change to the port forwarding menu:

![choose_port_forwarding](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/choose_portforwarding.png)

Turn Port Forwarding on:

![port_forwarding_offon](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/port_forwarding_offon.png)

The screen you are now looking at looks like this:

![port_forwarding_empty](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/port_forwarding_empty.png)

Now you need to add four port forwarding rules.
Rule 1 will allow you to access the manager pi via ssh connection:
```
IP Address: 192.168.0.2
Protocol: TCP+UDP
Internal Port: 22
External Port: 22
Description: SSH
```
Click on 'Add', then proceed with rule 2.

Rule 2 will allow you to access the *hypervisorUI*:
```
IP Address: 192.168.0.2
Protocol: TCP+UDP
Internal Port: 8000
External Port: 8000
Description: Manager
```

<div align="center"><br>
<strong><em>Rule 3 and rule 4 will only allow access to the SOCKS5 proxy & Skychat app of the board with IP address 192.168.0.4</em><br>
If you decide to use a board with a different IP address for using the SOCKS5 proxy or the Skychat app later on you must adjust these rules accordingly.
</strong><br><br>
</div>

Click on 'Add' and proceed with rule 3.

Rule 3 will allow you to use the SOCKS5 proxy of the board with IP address `192.168.0.4` after establishing a connection within the Skywire network:
```
IP Address: 192.168.0.4
Protocol: TCP+UDP
Internal Port: 1080
External Port: 1080
Description: SOCKS5
```

Click on 'Add' and proceed with rule 4.

Rule 4 will allow you to use the Skychat app of the board with IP address `192.168.0.4` after establishing a connection within the Skywire network.
```
IP Address: 192.168.0.4
Protocol: TCP+UDP
Internal Port: 8001
External Port: 8001
Description: Skychat
```

Once all rules are added it should look like this:

![port_forwarding_rules](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/portforwarding.png)

This part is finished, disconnect your computer from the LAN port and plug the remaining pi back in. 
Now please turn off the Skyminer router.

### Optional: assign static IP address for the Skyminer router
Now that the configuration of the Skyminer router is finished you can specify a static IP for it inside your home router. This will add convenience once you want to view the manager and access the nodes during the testnet. 
To do this, you need to log into your home router (if you're not sure how to do this read this https://www.lifewire.com/how-to-find-your-default-gateway-ip-address-2626072). 

Once you're in you can go to static leases or a similar term (located somewhere in LAN settings; highly dependent on your router model, this is a very broad description. Please download the manual of your router to get a detailed guide how to accomplish this) 
and assign the static IP lease for the Skyminer router. 
You will need the MAC address of the Skyminer router for this, you can find it on the 'Home'-page of the router interface or in your home router's web interface: 

![mac_address](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/mac_address.png)

***

## Usage
Please refer to the 
- [Run HypervisorUI on local machine](https://github.com/skycoin/skywire/wiki/Run-HypervisorUI-on-local-machine) guide or 
- [Run HypervisorUI on manager board](https://github.com/skycoin/skywire/wiki/Run-HypervisorUI-on-manager-board) (official images)

dependent on where the *hypervisorUI* is running.

### Obtain IP Address within your home network

Now you need to plug in a cable into the WAN port of the Skyminer router going into a LAN port of your home router and turn on your Skyminer router.

![network_topology](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/network_topology.png)

To access the manager or any device within the subnet of the Skyminer router you need the IP that it got assigned by your home router. To obtain it you have 3 options (they increase in difficulty from one to three):
1) Visit the Skyminer router interface and obtain the IP address from the 'Home'page. The IP is displayed under 'Internet -> Status', if you connected a LAN cable to the WAN port of the Skyminer router it will be displayed inside the red rectangle:

![ip_address_skyminer](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/macaddress.png)

**To do the following two steps you need to disconnect your computer from the Skyminer router and connect it to your home router.**

2) Login to your home router and go to 'Connected Devices', you'll see a device called 'myap', this is the Skyminer router.
3) Use network scan software like for example nmap to scan the subnet of your home router. The following is an example for the 192.168.1.1/24 subnet
```
nmap -sP 192.168.1.1/24
```
Will give you all active devices within the subnet. 
If you aren't familiar with using the command line you can use the multi-platform tool Zenmap, which provides a UI for [nmap](https://nmap.org/zenmap/).

Please note down the IP address, we'll need it to access the *hypervisorUI*.

### Viewing the HypervisorUI
Please refer to:
- [this guide](https://github.com/skycoin/skywire/wiki/Run-HypervisorUI-on-manager-board) if you setup the hypervisor to be executed on one of the boards
- [this guide](https://github.com/skycoin/skywire/wiki/Run-HypervisorUI-on-local-machine) if you setup the hypervisor to run locally on your own machine


## Troubleshooting

### Reset Router
Several different issues may require you to reset the router. 
An example would be if the language doesn't change immediately don't panic, numerous people experienced this. 
<br>
Try the following steps:
* Refresh the page
* Switch the language back and forth multiple times
* Clean your browser cache
* Try a different browser
* Reset the router with the factory reset button by pressing it for ~ 20 seconds
<div align="center">
<em>Keep in mind that resetting the router removes any port forwarding rules you put in place!</em>
</div>

![reset_button](https://raw.githubusercontent.com/Asgaror/skywire/binary_data_storage/networking_guide_pictures/reset_button.png)
!!! warning
    On Windows 10 you only can interface your visors via the hypervisor.<br>
    It is not possible to install a visor on Windows 10 at the moment.

## Installing the Hypervisor

In order to run the hypervisor on Windows 10 we choose to take advantage of the available Linux Subsystem. Just follow the next steps to setup Ubuntu 18 Linux Subsystem and configure the hypervisor.

!!! note
    The following commands can be pasted directly in Powershell using the right click on the mouse.

### 1. Enable Linux Subsystem

Press WIN + X and then A to open Powershell as administrator<br>
``` sh
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```
Save your work on the pc and confirm with ```Y``` and press ```Enter``` when asked to reboot.

### 2. Install Ubuntu 18 Linux Subsystem

Press WIN + X and then A to open Powershell as administrator<br>
Create a folder on partition C:\ named Ubuntu18
``` sh
mkdir C:\Ubuntu18
cd C:\Ubuntu18
```
Download Ubuntu 18 Linux Subsystem
``` sh
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu18.appx -UseBasicParsing
```
Install
``` sh
Add-AppxPackage .\Ubuntu18.appx
```

### 3. Run Ubuntu 18 Linux Subsystem

Press WIN and type 
```sh
Ubuntu
```
Open the top result and the terminal to your Linux Subsystem will start.<br>
Set a username and the password, which needs to be written twice (the password will not be shown as you write it).

### 4. Make Installation Directories in Linux Subsystem

!!! note
    The next commands you can copy and paste into the terminal using the right click in the terminal.
    
``` sh
sudo mkdir -p /var/skywire-hypervisor
sudo mkdir -p /etc/skywire-hypervisor
sudo mkdir -p /tmp/{bin,log,run}
```

### 5. Download the latest skywire-mainnet release

Go to [https://github.com/skycoin/skywire/releases](https://github.com/skycoin/skywire/releases)<br> 
and search for the latest release with the ending ```amd64.tar.gz```<br>
Right click on the hyperlink and save the link location.<br>

!!! warning
    Now you have to update the example with the saved link. Don't copy and paste or you will install an old version

!!! example
    ``` sh
    sudo wget -c https://github.com/skycoin/skywire/releases/download/v0.2.3/skywire-v0.2.3-linux-amd64.tar.gz -O /tmp/skywire.tar.gz
    ```
### 6. Extract and move extracted files

``` sh
sudo tar xvzf /tmp/skywire.tar.gz -C /tmp/bin
```
``` sh
sudo mv /tmp/bin/hypervisor /tmp/bin/skywire-hypervisor
```
``` sh
sudo cp -rf /tmp/bin/* /usr/bin/
```

### 7. Generate the hypervisor config and adjust it to enable password authentication.

``` sh
sudo /usr/bin/skywire-hypervisor gen-config -o /etc/skywire-hypervisor.json
```
``` sh
sudo sed -i 's+"enable_auth": false+"enable_auth": true+g' /etc/skywire-hypervisor.json
```
``` sh
sudo sed -i 's+.*"db_path".*+"db_path": "/var/skywire-hypervisor/users.db",+' /etc/skywire-hypervisor.json
```

### 8. Download and enable skywire service

``` sh
sudo wget -c https://raw.githubusercontent.com/asxtree/skywire-mainnet/asxtree-patch-1/static/skywire-manager-src/skywire.service -O /etc/init.d/skywire.service
```
Enable the service to run when we start the Linux Subsystem
``` sh
sudo chmod a+x /etc/init.d/skywire.service
```
``` sh
sudo update-rc.d skywire.service defaults 97 03
```

### 9. First start and restart of the service

``` sh
sudo service skywire.service start && sudo service skywire.service restart
```

### 10. Get the public key of the hypervisor

!!! note
    Copy the public key that will be printed.<br>
    Then you can add this public key to all the visor configs named ```skywire-config.json``` you want to interface with
    via the hypervisor.
    See [Configure, Run and Control Visor](../installation-linux#Configure, Run and Control Visor)

``` sh
cat /etc/skywire-hypervisor.json | grep "public_key" | awk '{print substr($2,2,66)}'
```


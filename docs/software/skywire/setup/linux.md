## From Source

### Requirements

Skywire requires a version of golang with go modules support.

=== "apt"

    ```
    apt-get install golang
    ```
    check your version with
    ```
    go version
    ```

=== "manually"

    ``` 
    TODO: Add commands
    ```


### Build

Follow the steps by copy & paste-ing all the commands into your terminal.

=== "Installation Directory"
    Move into the folder where you want to install skywire with the command ```cd```   
    For example:
    ``` sh
    cd $HOME/apps
    ```    
=== "Clone"
    Clone the repository.
    ``` sh
    git clone https://github.com/skycoin/skywire.git
    ```
=== "Move To Directory"
    Move into the directory of the cloned repository.
    ``` sh
    cd skywire
    ```
=== "Build"
    Build skywire
    ``` sh
    make build 
    ```
    This command installs all dependencies, builds binaries and skywire apps
=== "Install"
    Install skywire-visor, skywire-cli, hypervisor and app CLI execs.
    ``` sh
    make install
    ```   
=== "All Steps"
    ```sh
    cd $HOME/apps
    git clone https://github.com/skycoin/skywire.git
    cd skywire
    make build
    make install
    ```

## Package Repository

### Debian

!!! warning
    These packages are made from Skyfleet and are not officially maintained by Skycoin

!!! danger
    When you use this way to install Skywire never use the Update Button inside the hypervisor, as this
    will cause problems with the packages. Only update as described here.

!!! note 
    Either use the command ```sudo su``` to run all the following commands as root, or insert a ```sudo``` before each of them.

=== "Add Repository"
    Add the Skyfleet repository to your apt sources
    ``` sh
    add-apt-repository 'deb http://skyfleet.github.io/armbian sid main'
    ```

    !!! note
        If ```add-apt-repository``` is not available, either use the command
        ``` sh
        apt install software-properties-common
        ```
        or manually edit your sources with
        ```sh
        nano /etc/apt/sources.list
        ```
        and add
        ```
        deb http://skyfleet.github.io/armbian sid main
        # deb-src http://skyfleet.github.io/armbian sid main
        ```

=== "Add Signing Key"
    Add the repository signing key with
    ``` sh
    curl -L http://skyfleet.github.io/armbian/KEY.asc | sudo apt-key add -
    ```
=== "Install"
    Resync the package database with
    ``` sh
    apt update
    ```
    Install skywire with
    ``` sh
    apt install skywire
    ```
=== "Update"
    To update your skywire installation just use
    ``` sh
    sudo -s
    apt update
    apt upgrade
    ```

    !!! danger
        Don't use the update button inside the hypervisor

### Archlinux

!!! todo
    TODO: source: [https://skyfleet.github.io/archlinuxarm](https://skyfleet.github.io/archlinuxarm)

## Configure and Run Hypervisor

=== "Installed From Source"

    !!! info
        First make sure you are in the directory of your skywire installation.
        The command to move into the directory of the example above would be:
            ``` sh
            cd $HOME/apps/skycoin/skywire
            ```

    === "Configure"
        In order to run the hypervisor, generate a hypervisor config file with
        ``` sh
        ./hypervisor gen-config
        ```
        The output of this command is the generated hypervisor config file.
        Scroll until you find the entry ```pubkey``` and copy this key.
        We will need this later to configure our visor to accept our hypervisor.

    === "Run"
        You can start the hypervisor with
        ``` sh
        ./hypervisor
        ```
        Now move to [http://localhost:8000](http://localhost:8000) if you installed it on your local machine.<br>
        If you have installed the hypervisor on another machine in your network just replace localhost with the ip of the device.

=== "Installed via Packet Manager"

    TODO: See github.com/skyfleet/armbian


## Configure, Run and Control Visor

=== "Installed from Source"

    !!! info
        If your hypervisor is running in the terminal we need another terminal to configure the visor.<br>
        Press Ctrl + Alt + T to open another terminal.<br>
        Then make sure you are in the directory of your skywire installation.

    === "Configure"
        To run the visor we also have to generate a config file for it with
        ``` sh
        ./skywire-cli visor gen-config
        ```
        The output of this command is the generated visor config file.<br>
        Now open this config file with
        ``` sh
        nano skywire-config.json
        ```
        Search for the entry ```hypervisors``` and paste the ```pubkey``` of the hypervisor.<br>
        It should then look like this:
        
        !!! example
            v0.2.3
            ``` sh
            "hypervisors":[{
                "public_key":"02b72766f0ebade8e06d6969b5aeedaff8bf8efd7867f362bb4a63135ab6009775",
                    "address":"127.0.0.1:7080"
            }],
            ```
            later versions
            ``` sh
            "hypervisors": ["035feb3654daa9ceede16da44ada97c1503087d5c41f2651ec15b8294d8a11130d"]
            }],
            ```

    === "Run"
        You can start the hypervisor with
        ``` sh
        ./skywire-visor skywire-config.json
        ```
    === "Control"
        You can control the visor with ```skywire-cli```<br>
        Refer to the help menu for usage:
        ``` sh
        ./skywire-cli -h
        ```

=== "Installed via Packet Manager"

    TODO: See github.com/skyfleet/armbian

## Systemd Service

!!! info
    You can use systemd services to auto start your visors and hypervisors

=== "Installed from Source"

    === "Hypervisor"

        1. Copy the text below and make changings to the `ExecStart` line depending on your installation directory
            and where you have your config file.

            !!! note
                You can move the config file to a position of your choice but you have to edit the path to it in the systemd service file

            ``` go
            [Unit]
            Description=Skywire Hypervisor
            After=network.target

            [Service]
            Type=simple
            User=root
            Group=root
            ExecStart=/usr/bin/hypervisor -c /etc/hypervisor-config.json
            Restart=on-failure
            RestartSec=20
            TimeoutSec=30

            [Install]
            WantedBy=multi-user.target
            ```
        2. Create a file by typing the follwing command into the terminal

            ```go
            sudo nano /etc/systemd/system/skywire-hypervisor.service
            ```
        
        3. Paste your edited text from Step 1 into this file, press CTRL + X to save, then Y and ENTER to accept.

        4. Enable the systemd service with

            ```go
            sudo systemctl daemon-reload
            sudo systemctl enable skywire-hypervisor.service
            ```
        5.  Start the systemd service with

            ```go
            sudo systemctl start skywire-hypervisor.services
            ```
    
    === "Visor"

        1. Copy the text below and make changings to the `ExecStart` line depending on your installation directory
            and where you have your config file.

            !!! warning
                Check inside your skywire-config.json file that the entry<br> 
                'bin_path' is set to your-installation-directory/apps<br>
                'local_path' is set to /var/skywire-visor/apps 

            !!! note
                You can move the config file to a position of your choice but you have to edit the path to it in the systemd service file

            ``` go
            [Unit]
            Description=Skywire Hypervisor
            After=network.target

            [Service]
            Type=simple
            User=root
            Group=root
            ExecStart=/usr/bin/skywire-visor -c /etc/skywire-config.json
            Restart=on-failure
            RestartSec=20
            TimeoutSec=30

            [Install]
            WantedBy=multi-user.target
            ```
        2. Create a file by typing the follwing command into the terminal

            ```go
            sudo nano /etc/systemd/system/skywire-visor.service
            ```
        
        3. Paste your edited text from Step 1 into this file, press CTRL + X to save, then Y and ENTER to accept.

        4. Enable the systemd service with

            ```go
            sudo systemctl daemon-reload
            sudo systemctl enable skywire-visor.service
            ```
        5.  Start the systemd service with

            ```go
            sudo systemctl start skywire-visor.services
            ```

    !!! note "Helpful systemctl commands" 
        
        ```go
        systemctl start name.service
        systemctl stop name.service   
        systemctl restart name.service
        systemctl reload name.service  

        systemctl status name.service

        systemctl list-unit-files --type=service

        journalctl -u service-name.service -e
        ```
=== "Installed via Packet Manager"

    The systemd services are already in place. You just have to type in

    ```go
    sudo systemctl daemon-reload
    sudo systemctl start skywire-visor      //for the visor
    sudo systemctl start skywire-hypervisor //for the hypervisor
    ```

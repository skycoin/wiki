# Setup VPN

=== "VPN Client"

    This guide explains the setup procedure and includes operating instructions of the Skywire VPN Client.
    Please refer to the **VPN Server** guide in case you want to run a Skywire VPN Server for <em>Skywire VPN</em>.

    !!! warning 
        Setting up a Skywire VPN Client is currently only documented for Linux und MacOS. A guide for setting up Skywire VPN on Windows will follow. Installers and a more streamlined UI for setting up VPN connections will be available with the next release.

    !!! note
        In order to use Skywire VPN, you need to install Skywire on your computer. Follow [this guide](../installation-overview.md) to install Skywire. The rest of this guide assumes that you have installed both the Skywire Visor and Skywire Hypervisor and generated configuration files.

    Once you have Skywire installed, you can either continue setting up the Skywire VPN Client through the Hypervisor UI or via CLI (terminal).

    === "Hypervisor UI"

        1. Open your hypervisor on [http://localhost:8000](http://localhost:8000)
        2. Inside the hypervisor, click on the visor you just connected and access the `Apps` tab.
        ![vpn-app-tab](img/vpn-app-tab.png)
        3. In order to browse for available VPN servers, click on the `gear` icon next to the VPN client and select `Search`.
        ![vpn-gear](img/vpn-gear-icon.png)
        ![vpn-search-remote](img/vpn-search-remotes.png)
        4. To select a remote VPN server, click on the public key and select `Yes` in the popup. Afterwards copy the public key you selected.
            ![vpn-copy-remote](img/vpn-copy-remote.png)
        5. Return to the `Routing` tab and establish a transport to the remote visor you selected as VPN server.
            ![vpn-add-tp](img/vpn-add-tp.png)
            ![vpn-input-pk-for-tp](img/vpn-input-pk-for-tp.png)
        
            !!! note
                The `stcpr` and `sudph` transport types will have the best performance. Try to establish these transport types first.<br> If these are not available (red circle appears next to the transport) establish a `dmsg` transport.

        6. After establishing a transport to the remote, return to the `App` tab and click the `Start` button next to the VPN client.
            ![vpn-start-vpn-client](img/vpn-start-vpn-client.png)
            If the connection was established successfully, the circle next to the `vpn-client` will turn green. If the connection is setup and live, the up- and download windows in the bottom right corner will show constant increases in data sent and received.

            !!! note
                After starting the VPN client successfully, **all the network traffic will be routed through the VPN connection** until the connection is shutdown.
        
        7. You can close the Skywire VPN by clicking the stop button.
            ![vpn-stop-vpn-client](img/vpn-stop-vpn-client.png)
    
    === "CLI (terminal)"
        <em>This section outlines the installation steps by using a regular command-line interface/terminal.</em>

        After installing Skywire, open up `skywire-config.json` with your prefered editor. Insert the public key of the VPN server into the `vpn-server` field in the following way:

        ``` go
            {
                        "name": "vpn-client",
                        "args": ["-srv","02f9c5ebd8e480d33b0de67555089bcd85cc1d70c70a17fa5827159c0fcf0a755c"],
                        "auto_start": false,
                        "port": 43
                    }
        ```

        In order to obtain a list of available VPN servers, you can use the following link:

        `https://service.discovery.skycoin.com/api/services?type=vpn`

        Continue by starting the Skywire visor with

        `sudo skywire-visor`

        Enter your password if prompted. Afterwards, replace the values below with the remote public key you selected: 

        `skywire-cli visor add-tp 02f9c5ebd8e480d33b0de67555089bcd85cc1d70c70a17fa5827159c0fcf0a755c --type stcpr`

        !!! note
            The `stcpr` and `sudph` transports are the most performant. It is recommended to try to setup these transports first. If these are not available, setup a `dmsg` transport.

        After you setup the transport, start the VPN by running:

        `skywire-cli visor start-app vpn-client`

        In order to stop the VPN, run:

        `skywire-cli visor stop-app vpn-client`

=== "VPN Server"

    This guide explains the setup procedure and includes operating instructions of the Skywire VPN Server.

    !!! info
        For ease of setting up a connection to your VPN server, it is recommended to deploy the VPN server on a machine with a public IP. This will allow clients to establish `stcpr` transports which use a simple TCP connection instead of relayed connections over `dmsg`.
    
    === "Hypervisor UI"

        > TODO
    
    === "CLI (terminal)"
    
        1. Configure VPN Server
            The Skywire VPN server can be configured to require a passcode for authentication of clients or be freely accessible but in order to be publicly advertised in Skycoin's service discovery, it is required for the VPN server to be freely accessible without passcode! 

            If you wish to set a passcode, you can pass the following argument to the `skywire-config.json`

            ``` go
                {
                    "name": "vpn-server",
                    "auto_start": false,
                    "port": 44,
                    "args":["-passcode","123456"]
                }
            ```



            In order to automatically start the VPN server upon startup of the Skywire Visor, set `auto_start` to `true`. Otherwise, the VPN server needs to be started manually after the Visor was started. 

        2. Operating Skywire VPN Server
            <em>The following assumes that you either use multiple terminals or take care of detaching processes from the terminal yourself.</em>

            In order to run the Skywire VPN server, first run the Visor

            ``` 
            sudo skywire-visor
            ```

            **Note:** The VPN server requires root privileges to setup a TUN interface and configure the systems routing rules. 

            Afterwards, start the VPN server with 

            ```
            skywire-cli visor start-app vpn-server
            ```

            In order to stop the VPN server you can either stop the Visor or run

            ``` 
            skywire-cli visor stop-app vpn-server
            ```

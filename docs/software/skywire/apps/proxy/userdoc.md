## Introduction

This guide will teach you how to use the Skywire SOCKS5 proxy utilizing a proxy app of your choice, the example is made with [FoxyProxy](https://getfoxyproxy.org/).<br>
You can use the Skywire SOCKS5 proxy to circumvent geo-blocking as an example use case.  

## Requirements

* Running Skywire hypervisor & visors(s)
* Prepared port forwarding rules dependent on your network topology
* Network connection
* [Firefox](https://www.mozilla.org), [Chrome](https://www.google.com/chrome/) or other browsers capable of using a proxy service

## Prepare Visor

1. Open your local hypervisor by visiting [http://localhost:8000](localhost:8000) in a webbrowser.

2. In order to setup a proxy connection, start by clicking on one of the visors that appear in your *hypervisorUI*. This will open up an overview page for the specific visor you chose.

    ![visor list](img/hypervisor-visor-list.png)

3. Click onto the `+` button next to the transport field. Input the `PublicKey` of the remote  *visor* and select `dmsg` as the transport type. This should setup a `transport` to a remote *visor*.

    ![add tp](img/hypervisor-add-tp.png)

4. Switch to the `Apps` tab of the UI and click on the gear icon next to the `skysocks-client` application and input the `PublicKey` of the remote visor again. Afterwards, start the `skysocks-client` by clicking on the triangle next to `skysocks-client `.

    ![skysocks client](img/hypervisor-skysocks-client.png)

The proxy connection should now be succesfully setup. You can use the proxy by configuring your browser to use the connection exposed on `localhost:1080`.

## Setup FoxyProxy Settings

By now you have:

* obtained the IP address of your visor, the following examples based on the IP `10.0.0.31`, yours might be different and **you have to adjust it**.
* installed [FoxyProxy](https://getfoxyproxy.org/) plugin

Click on `Options`:

![Options](img/foxyproxy-options.png)

`Add` a new rule:

![Add](img/foxyproxy-add.png)

You have to change the following depending on your visor:

=== "remote visor"
    * Proxy Type to `SOCKS5`
    * Title or description as you prefer, we suggest using `SkywireSOCKS5`
    * IP address to the IP address of your visor, in this example `10.0.0.31`
    * Port to the displayed port of the connection, use `1080`
    * Enter the password of the remote `skysocks-server` is password protected. If the remote is password protected, you will also need to "Skywire" into the `Username` field.

=== "local visor"
    * Proxy Type to `SOCKS5`
    * Title or description as you prefer, we suggest using `SkywireSOCKS5_locally`
    * IP address to the IP address of your visor, in this example `127.0.0.1`
    * Port to the displayed port of the connection, use `1080`
    * Enter the password of the remote `skysocks-server` is password protected. If the remote is password protected, you will also need to "Skywire" into the `Username` field.

!!! note
    The Skywire SOCKS5 proxy uses always port `1080` for establishing the connection.

Should look like this:

![Settings](img/foxyproxy-local.png)

That's it for now with FoxyProxy.

## Troubleshooting

### Websites are loading very slowly, slow connection

Some nodes may not have the fastest network connection, or they may be using a free VPN service to tunnel their traffic.
Both cases would result in a slow connection for you. As you can't change anything about the two causes you can only disconnect and try out another node.

### Establishing connections works but websites aren't loading

This could have several reasons:

* The wrong rule in FoxyProxy, double check the settings you set up in the FoxyProxy plugin and ask in the community if you can't find the mistake.
* Highly restricted website access on the connected node because it is using OpenDNS or similar services which results in a blocked connection to certain services on your end. Nothing you can do about that.
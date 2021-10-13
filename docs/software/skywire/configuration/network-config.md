# Network Configuration

## Add persistent transports
The visor will always try to establish a transport with the public keys defined in the `"persistent_transports"` field.  
  
To add the public keys edit the `"persistent_transports"` in the `skywire-config.json` file.  
```
"persistent_transports": [{
    "pk" : "<public-key>"
    "type" : "<transport-type>"
}]
```
Save the changes and [Start](/software/skywire/configuration/network-config/#start) the visor.

## Make visor public
!!! Note
    A visor that is made public will be broadcasting data to other visors and may be eligible for extra rewards.
    
If the visor is deployed on public IP, it can be made public to other visors, to connect automatically via stcpr transport. 
   
To make the visor public, change `"is_public": false` to `"is_public": true` in the `skywire-config.json` file.
```
"is_public": true
```
Save the changes and [Start](/software/skywire/configuration/network-config/#start) the visor.

## Public Autoconnect
It is a network configuration option, when enabled it will search for public visors (those with `"is_public": true`) and connect them on startup via `stcpr`. By default, it is disabled in the config file.  
  
To enable public autoconnect, make the following changes in `skywire-config.json`:
```
"public_autoconnect": true,
```
Save the changes and [Start](/software/skywire/configuration/network-config/#start) the visor.

## Hops
The number defined in `"min_hops"` influences the route creation through the network. If the number is higher than 0 the visor will only establish routes with at least one intermediary visor.  

To change the number of hops, edit `"min_hops"` field in `skywire-config.json`
```
"min_hops": <number-of-hops>
```
Save the changes and [Start](/software/skywire/configuration/network-config/#start) the visor.

# Start
To start the visor, run:
```
$ ./skywire-visor -c skywire-config.json
```
To start the visor with docker, run:
```
$ docker run --rm -p 8000:8000 -v <YOUR_CONFIG_DIR>:/opt/skywire --name=skywire skycoin/skywire:latest skywire-visor
```
# **Build**
Skywire requires a Golang version of 1.13 or higher.
## Clone
```
$ git clone https://github.com/skycoin/skywire.git
$ cd skywire
```

## Build and Install
```
$ make build; make install
```

Skywire can be statically built. For instructions check [the docs.](https://github.com/skycoin/skywire/blob/develop/docs/static-builds.md)

# **Configure Skywire**
## Expose hypervisorUI
In order to expose the hypervisor UI, generate a config file with `--is-hypervisor` flag:
```
$ ./skywire-cli visor gen-config --is-hypervisor
```

After starting up the visor, the UI will be exposed by default on `localhost:8000`.

## Add remote hypervisor
Every visor can be controlled by one or more hypervisors. To allow a hypervisor to access a visor, the PubKey of the hypervisor needs to be specified in the configuration file. You can add a remote hypervisor to the config with:
```
$ skywire-cli visor update-config --hypervisor-pks <public-key>
```

# **Run skywire-visor**
skywire-visor hosts apps and is an applications gateway to the Skywire network.
skywire-visor requires a valid configuration to be provided. If you want to run a VPN client locally, run the visor as sudo.
```
$ sudo skywire-visor -c skywire-config.json
```
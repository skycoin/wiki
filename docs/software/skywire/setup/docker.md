# **Run**
To run the visor from docker image without custom config file:
```
$ docker run --rm -p 8000:8000 --name=skywire skycoin/skywire:latest skywire-visor
```

# **Configure Visor**
## Generate Config
- To generate config file manually for visor and expose hypervisorUI, run:
    ```
    $ docker run --rm -v <YOUR_CONFIG_DIR>:/opt/skywire \
      skycoin/skywire:latest skywire-cli visor gen-config --is-hypervisor
    ```
    After starting up the visor, the UI will be exposed by default on `localhost:8000`.

- To generate the config manually for the visor without UI, run:
    ```
    $ docker run --rm -v <YOUR_CONFIG_DIR>:/opt/skywire \
      skycoin/skywire:latest skywire-cli visor gen-config
    ```
- To add hypervisor public key to the list of hypervisors, run:
    ```
    $ docker run --rm -v <YOUR_CONFIG_DIR>:/opt/skywire \
      skycoin/skywire:latest skywire-cli update-config hypervisor-pks <public-key>
    ```
# **Run skywire-visor**
To start visor from docker image with custom config file, run:  
```
$ docker run --rm -p 8000:8000 -v <YOUR_CONFIG_DIR>:/opt/skywire --name=skywire skycoin/skywire:latest skywire-visor
```
    
    
   <!-- # **Build**
## Clone
```
$ git clone https://github.com/skycoin/skywire.git
$ cd skywire
```
   
## Build docker image
```
$ ./ci_scripts/docker-push.sh -t $(git rev-parse --abbrev HEAD) -b
```   --> 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<!-- Write the section on how to run visor in Docker. Explain how to generate the config for the dockerized visor.
    Explain how to configure visor. For that we need to go over

    how to generate config so visor exposes hypervisorUI

    what can be configured about the UI

    how to run in visor mode (without UI)

    how to add hypervisor PK to the list of hypervisors

    explain networking configuration options for the visor
 -->

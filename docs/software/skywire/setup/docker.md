!!! Note
    The docker setup instructions are beyond the scope of this article. Please refer to Docker documentation for installing it on your system.

# **Run**

To run the visor from docker image without custom config file:
```
$ docker run --rm -p 8000:8000 --name=skywire skycoin/skywire:latest skywire-visor
```
!!! Note
    Using `latest` tag will pull and built an image from `master` branch, while using `test` tag will pull and built an image from `develop` branch.

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
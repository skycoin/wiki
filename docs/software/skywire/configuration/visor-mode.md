# Configuration for visor

To generate config file manually for visor, run:
```
./skywire-cli config gen
```
To generate config file manually for visor with docker, run:
```
$ docker run --rm -v <YOUR_CONFIG_DIR>:/opt/skywire \
  skycoin/skywire:latest skywire-cli config gen
```
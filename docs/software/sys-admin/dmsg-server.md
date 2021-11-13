# dmsg

!!! Note
    `dmsg-server` needs to be run on a `public IP`.  

## Hardware Requirements
- It is recommended for server to have minimum RAM of 2GB, if the connections go above 2500, RAM should be increased appropriately.   
- `fs.inotify.max_user_watches` needs to be set relatively high.  

To check `fs.inotify.max_user_watches` value, run:
```
cat /proc/sys/fs/inotify/max_user_watches
```
To set `fs.inotify.max_user_watches` value, run:
```
sudo sysctl -w fs.inotify.max_user_watches=<value>
```

## Clone
```
$ git clone https://github.com/skycoin/dmsg.git
```
```
$ cd dmsg
```

## Install
!!! note "Install redis and GO" 
    === "Debian"
        To install redis:
        ```
        $ sudo apt install redis-server
        ```
        To install GO, follow the installation guide [here](https://www.cloudbooklet.com/how-to-install-go-on-debian-10/)
        ---
    === "Arch Linux"
        To install redis:
        ```
        $ sudo pacman -S redis go
        ```
        ---

## Build
To build `dmsg-discovery` and `dmsg-server` binaries, run:
```
$ make build
```

Start `redis` and ensure it is listening on port 6379:
```
$ redis-server
```

To start `dmsg-discovery`, run:
```
$ ./bin/dmsg-discovery
```

Edit config file (integration/configs/dmsgserver1.json) to add public ip 

```JSON
{
  "public_key": "<public-key>",
  "secret_key": "<secret-key>",
  "discovery": "<discovery-address>",
  "public_address": "<public-IP>:<port>",
  "local_address": ":<port>",
  "log_level": "info",
  "max_sessions": 10
}
```

To start `dmsg-server`, run.
```
$ ./bin/dmsg-server ./integration/configs/dmsgserver1.json
```

## Run dmsg server using docker

!!! Note
    The docker setup instructions are beyond the scope of this article. Please refer to Docker documentation for installing it on your system.


## Build
To build `dmsg-server` and `dmsg-discovery` images, run:
```
$ ./docker/scripts/docker-push.sh -t develop -b
```

To create a new docker network, run:
```
$ docker network create -d bridge br-dmsg0
```

## Run

Run redis
```
$ docker run --network="br-dmsg0" --rm --name=redis -d -p 6379:6379 redis:alpine
```

Run `dmsg-discovery`:
```
$ docker run --rm --network="br-dmsg0" --name=dmsg-discovery skycoinpro/dmsg-discovery:test --redis redis://redis:6379
```

To run `dmsg-server` with default config:
```
$ docker run --network="br-dmsg0" --rm --name=dmsg-server skycoinpro/dmsg-server:test
```

To run `dmsg-server` with custom config:
```
$ docker run -v <YOUR_CONFIG_PATH>:/etc/dmsg --network="br-dmsg0" --rm --name=dmsg-server skycoinpro/dmsg-server:test /etc/dmsg/<YOUR_CONFIG_FILE_NAME>
```

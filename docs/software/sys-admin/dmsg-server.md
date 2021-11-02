# DMSG

!!! Note
    `dmsg-server` needs to be run on a `public IP`.  

## Hardware Requirements
- It is recommended for server to have minimum RAM of 2GB, if the connections go above 2500, RAM should be increased appropriately.  
- `fs.inotify.max_user_watches` needs to be set relatively high.

## Clone
```
$ git clone https://github.com/skycoin/dmsg.git
```
```
$ cd dmsg
```

## Install
!!! note "Install redis"
    === "Debian"
        To install redis:
        ```
        $ sudo apt install redis-server
        ```
        ---
    === "Arch Linux"
        To install redis:
        ```
        $ sudo pacman -S redis
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

Edit config file (integration/configs/dmsgserver1.json) to add `public IP`:

```JSON
{
  "public_key": "035915c609f71d0c7df27df85ec698ceca0cb262590a54f732e3bbd0cc68d89282",
  "secret_key": "6eddf9399b14f29a60e6a652b321d082f9ed2f0172e02c9d9c1a2a22acf4bee3",
  "discovery": "http://localhost:9090",
  "public_address": "<public-IP>:8081",
  "local_address": ":8081",
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

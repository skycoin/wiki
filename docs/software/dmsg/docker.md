!!! Note
    The docker setup instructions are beyond the scope of this article. Please refer to Docker documentation for installing it on your system.


## Build
To build `dmsg-server` and `dmsg-discovery` images, run:
```
$ ./docker/scripts/docker-push.sh -t develop -b
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
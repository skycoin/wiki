# Dmsgget

`dmsgget` is a utility which can download from HTTP servers hosted over the `dmsg` network (similar to a simplified `wget` over `dmsg`).

Build `dmsg` binaries 
```
$ make build
```

To know more about `dmsgget` command, run:
```
$ ./bin/dmsgget --help
```

### Example usage

In this example, we will use the `dmsg` network where the `dmsg.Discovery` address is `http://dmsgd.skywire.skycoin.com`. However, any `dmsg.Discovery` would work.

Create a folder where files will be hosted to serve over `dmsg` and create a `hello.txt` file within.  
To create a serving folder, run:
```
$ mkdir /tmp/dmsghttp -p
```
To create a file inside the folder, run:
```
$ echo 'Hello World!' > /tmp/dmsghttp/hello.txt
```

Next, let's serve this over `http` via `dmsg` as transport. We have an example exec for this located within `/example/dmsgget/dmsg-example-http-server`.  

To generate public/private key pair, run:
```
$ go run ./examples/dmsgget/gen-keys/gen-keys.go
```
To run dmsg http server, run:
```
$ go run ./examples/dmsgget/dmsg-example-http-server/dmsg-example-http-server.go --dir /tmp/dmsghttp --sk <sk-returned-from-above-command>
```

Now we can use `dsmgget` to download the hosted file. Open a new terminal and run the following.
```
$ dmsgget dmsg://<pk-generated>:80/hello.txt
```

To check downloaded file, run:
```
$ cat hello.txt
```

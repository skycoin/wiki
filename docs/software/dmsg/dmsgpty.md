# Dmsgpty
`dmsgpty` is a remote shell utility over `dmsg` (similar concept to SSH) to connect to the servers hosted over the `dmsg` network.

Build `dmsg` binaries 
```
$ make build
```

To know more about `dmsgpty-host` commands and flags, run:
```
$ ./bin/dmsgpty-host --help
```

To know more about `dmsgpty-cli` commands and flags, run:

```
$ ./bin/dmsgpty-cli --help
```
   

## Example usage
In this example, we will use the `dmsg` network where the `dmsg.Discovery` address is `http://dmsgd.skywire.skycoin.com`. However, any `dmsg.Discovery` would work.

### Example 1
Setting up remote command execution over dmsg.

To generate a config file for the dmsgpty-host, run:
```
$ ./bin/dmsgpty-host confgen
```

`config.json` file will be generated.
```JSON
{
    "dmsgdisc": "http://dmsgd.skywire.skycoin.com",
    "dmsgsessions": 1,
    "dmsgport": 22,
    "clinet": "unix",
    "cliaddr": "/tmp/dmsgpty.sock",
    "sk": "8770be1ae64aa22a6d442086dc5870339a4d402c10e30499fa8a53d34413d412",
    "pk": "03d3d3744f7d6a943b3d467fce8477ccc580b7568160346b8d8bbd95e343ad6be4",
    "wl": null
}
```
To start the `dmsgpty-host`, run:
```
$ ./bin/dmsgpty-host
```
!!! Note
    `dmsgpty-cli` can be used to interact with the host as well as to view, add or remove whitelist.

To view the whitelist run the following in a new terminal.
```
$ ./bin/dmsgpty-cli whitelist
```

To add a whitelist use the following command with a Public key of a node you want to whitelist.
```
$ ./bin/dmsgpty-cli whitelist-add <pk-of-a-node>
```

To remove a whitelist use the following command with a Public key of a node you want to remove.
```
$ ./bin/dmsgpty-cli whitelist-remove <pk-of-a-node>
```

To start the `dmsgpty-ui`, run:

```
$ ./bin/dmsgpty-ui
```

And open the browser at [http://127.0.0.1:8080/](http://127.0.0.1:8080/)

### Example 2
Connect two remote machines with each other via DMSGPTY

#### Step 1: Config Generation
To generate a config file for the `dmsgpty-host` on both machines if its not already generated, run following command on `host-1` & `host-2`:
```
$ ./bin/dmsgpty-host confgen
```

Config file will be generated on both machines for the `dmsgpty-host`.  

`config.json` generated on `host-1`:
```
{
    "dmsgdisc": "http://dmsgd.skywire.skycoin.com",
    "dmsgsessions": 1,
    "dmsgport": 22,
    "clinet": "unix",
    "cliaddr": "/tmp/dmsgpty.sock",
    "sk": "8770be1ae64aa22a6d442086dc5870339a4d402c10e30499fa8a53d34413d412",
    "pk": "03d3d3744f7d6a943b3d467fce8477ccc580b7568160346b8d8bbd95e343ad6be4",
    "wl": null
}
```

`config.json` generated on `host2`:
```JSON
{
  "dmsgdisc": "http://dmsgd.skywire.skycoin.com",
  "dmsgsessions": 1,
  "dmsgport": 22,
  "clinet": "unix",
  "cliaddr": "/tmp/dmsgpty.sock",
  "sk": "76cc80ea9dcc8cbbb54d5463cea8797dd4ed27693daf176878a8d0929a4466d3",
  "pk": "024e804f8e8fc3c4fc8562a5e58c4897323e527dace63ec36badfb66b65d4606d7",
  "wl": null
}
```

#### Step 2: Start `dmsgpty-host`

To start the `dmsgpty-host` on both machines, run following command on `host-1` & `host-2`:  
```
./bin/dmsgpty-host
```

#### Step 3: Start whitelist with `dmsgpty-cli`

!!! Note
    `dmsgpty-cli` can be used to interact with the host as well as to view, add or remove whitelist.  

Now whitelist the Public key of `dmsgpty-host-1` on `dmsgpty-host-2`.  
So that `dmsgpty-host-2` will accept connection request from `dmsgpty-host-1`.  

Run following command on `host-2`
```
$ ./bin/dmsgpty-cli whitelist-add <pk-of-host1>
```

#### Step 4: Connect to `dmsgpty-host-2` from `dmsgpty-host-1`
Now connect to the shell of `dmsgpty-host-2` FROM `dmsgpty-host-1`.  
Run following command on `host-1`
```
$ ./bin/dmsgpty-cli --addr <pk-of-host-2>
```

To exit from the shell of `dmsgpty-host-2` simply run
```
$ exit
```

!!! note "Same machine for both hosts"
    If you are using the same machine for both hosts, there are some changes for the second host.
    
    #### Step 1: Config Generation
    
    Change the cliaddress of `dmsgpty-host-2` since both the hosts are on the same machine, and the same cliaddr will clash.
    
    To generate a config with different cliaddress, run following on `host-2`:
    ``` 
    $ ./bin/dmsgpty-host confgen config2.json --cliaddr /tmp/dmsgpty2.sock
    ```
    
    Config file will be generated for the `dmsgpty-host-2`.
    ```JSON
    {
      "dmsgdisc": "http://dmsgd.skywire.skycoin.com",
      "dmsgsessions": 1,
      "dmsgport": 22,
      "clinet": "unix",
      "cliaddr": "/tmp/dmsgpty2.sock",
      "sk": "76cc80ea9dcc8cbbb54d5463cea8797dd4ed27693daf176878a8d0929a4466d3",
      "pk": "024e804f8e8fc3c4fc8562a5e58c4897323e527dace63ec36badfb66b65d4606d7",
      "wl": null
    }
    ```

    #### Step 2: Start `dmsgpty-host`
    To start the `dmsgpty-host-2`, run the following in a new terminal on `host-2`.
    ```
    $ ./bin/dmsgpty-host -c ./config2.json
    ```

    #### Step 3: Start whitelist with `dmsgpty-cli`
    
    To interact with the hosts, use `dmsgpty-cli` in a new terminal.<br>
    `dmsgpty-cli` can be used to view, add or remove whitelist.

    Whitelist the Public key of `dmsgpty-host-1` in `dmsgpty-host-2`.<br>
    So that `dmsgpty-host-2` will accept connection request from `dmsgpty-host-1`
    
    #### Step 3: Start whitelist with `dmsgpty-cli`
    To whitelist public key of `dmsgpty-host-1`, run following on `host-2`:
    ```
    $ ./bin/dmsgpty-cli whitelist-add <pk-of-host-1> --cliaddr /tmp/dmsgpty2.sock
    ```

    #### Step 4:Connect to `dmsgpty-host-2` from `dmsgpty-host-1`
    Now connect to the shell of `dmsgpty-host-2` FROM `dmsgpty-host-1`.  
    Run following command on `host-1`
    ```
    $ ./bin/dmsgpty-cli --addr <pk-of-host-2>
    ```

    To exit from the shell of `dmsgpty-host-2` simply run
    ```
    $ exit
    ```
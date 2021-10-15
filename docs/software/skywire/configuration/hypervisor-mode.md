# Configuration for HypervisorUI

The hypervisorUI allows user to monitor skywire visors. These visors run the Skywire protocol and applications that users can run on top of the Skywire network. The hypervisorUI facilitates and aggregates the management of the nodes into one user interface.  

To generate config file manually for visor and expose hypervisorUI, run:
```
./skywire-cli visor gen-config --is-hypervisor
```
To generate config file manually for visor and expose hypervisorUI with docker, run:
```
$ docker run --rm -v <YOUR_CONFIG_DIR>:/opt/skywire \
  skycoin/skywire:latest skywire-cli visor gen-config --is-hypervisor
```

### **TLS**
TLS (Transport Layer Security) is a security protocol, which encrypts the communication between web applications and the server. It ensures that the data transmitted over the internet is safe from hackers and eavesdroppers.  

To enable `TLS` it is necessary to create required certificate/key file.
To create the certificate/key file, run:
```
$ sh static/skywire-manager-src/ssl/generate-1.sh
```
from the skywire repo.  

To enable `TLS` in hypervisor, edit the hypervisor section in config file generated:
```
"hypervisor": {
		"db_path": "/root/skywire/users.db",
		"enable_auth": true,
		"cookies": {
			"hash_key": "4755bd30c056cb50d1e3e679e91f71414a89a157e296309feeffc40ee0441574a068a698b1156aba0240a28d6b878d29b74dbed75b540e3ab3431f58f0b813f7",
			"block_key": "c76e98c8431a2a7c03460661965fe5917cf945b79fd90a622489d04c930a9557",
			"expires_duration": 43200000000000,
			"path": "/",
			"domain": ""
		},
		"dmsg_port": 46,
		"http_addr": ":8000",
		"enable_tls": false,
		"tls_cert_file": "./cert.pem",
		"tls_key_file": "./key.pem"
	}
```
Change `"enable_tls": false` to `"enable_tls": true`  
Assign the path of files generated to `"tls_cert_file":` and `"tls_key_file":`    
Save the changes and [Start](/software/skywire/configuration/hypervisor-mode/#start) the visor.

### **Auth**

Authentication helps to prove the identity of the user accessing the HypervisorUI. It can be used to prevent unauthorized users from accessing the HypervisorUI.

To change authentication settings in HypervisorUI, edit the hypervisor section in config file generated:
```
"hypervisor": {
		"db_path": "/root/skywire/users.db",
		"enable_auth": true,
		"cookies": {
			"hash_key": "4755bd30c056cb50d1e3e679e91f71414a89a157e296309feeffc40ee0441574a068a698b1156aba0240a28d6b878d29b74dbed75b540e3ab3431f58f0b813f7",
			"block_key": "c76e98c8431a2a7c03460661965fe5917cf945b79fd90a622489d04c930a9557",
			"expires_duration": 43200000000000,
			"path": "/",
			"domain": ""
		},
		"dmsg_port": 46,
		"http_addr": ":8000",
		"enable_tls": false,
		"tls_cert_file": "./cert.pem",
		"tls_key_file": "./key.pem"
	}
```
To enable or disable authentication, change `"enable_auth":` to `true` or `false` respectively.  
Save the changes and [Start](/software/skywire/configuration/hypervisor-mode/#start) the visor.

# Start
To start the visor, run:
```
$ ./skywire-visor -c skywire-config.json
```
To start the visor with docker, run:
```
$ docker run --rm -p 8000:8000 -v <YOUR_CONFIG_DIR>:/opt/skywire --name=skywire skycoin/skywire:latest skywire-visor
```
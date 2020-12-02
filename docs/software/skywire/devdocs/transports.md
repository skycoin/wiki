
A Transport represents a bidirectional line of communication between two Skywire Visors (or Transport Edges). Skywire can use different implementations of a transport for different purposes. Currently **dmsg** is used for communication with the control plane of the network. The **stcp** transport is the default transport for the data plane. Skywire supports custom transport implementations.

Each Transport is represented as a unique 16 byte (128 bit) UUID value called the Transport ID and has a Transport Type that identifies a specific implementation of the Transport.

## stcpr

stcpr transport automatically resolves the Skywire addresses of two visors and establishes a transport using a single underlying TCP connection. It is the most performant transport type at the moment. It requires at least one of the two edges of the transport to be deployed on a public IP.

## sudph

sudph transport is a holepunched transport between two Visors. It uses an underlying reliable UDP transport. It uses a negotiation server to negotiate the details of the holepunched connection and then opens up a direct connection between two Visors. Due to the restrictions Symmetric NATs impose, this transport type does not work with Symmetric NATs.

## dmsg

dmsg transport connects two visors with the help of an intermediary relay server. It is the least performant transport. It is available between any two Visors with an internet connection however.

## stcp

stcp transport is a simple TCP based transport. It does not use any negotiation or address resolution servers but relies on a local Pubkey to IP mapping that needs to be generated manually.

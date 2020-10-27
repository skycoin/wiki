# CXO
[![Build Status develop][build-status-branch-develop]][build-status-url-develop]
[![GitHub release][github-release-image]][github-release-url]
[![last-release-date][release-date-image]][releases-url]<br>
[![contributor-count][contributor-count-image]][contributor-count-url]
![commits-per-year][commit-activity-one-year-image]
![last-commit][commit-last-image]

CXO (CX Object Systems) is the Skycoin immutable object system, previously called Aether. Designed to replace current conventional methods of peer-to-peer sharing, CXO creates a robust storage system that supersedes services like BitTorrent, Dropbox, and Google Drive. Data is replicated peer-to-peer utilizing the Skycoin CXO library.<br>
CXO incorporates and expands on the protocols utilized in other blockchain-based storage networks. CXO is an IPLD, with a built-in schema that sets constraints to classify relatable databases. InterPlanetary File Systems (IPFS) can be built on top of CXO. CXO provides data distribution over the Skywire network and is useful for data that must be secure and verifiable yet doesn't need storage on the blockchain.<br>
Simply, it is a low-level library designed to house applications for sharing objects. CXO acts as Content Addressable Storage (CAS) for Content Distribution Networks (CDNs).

**Data Sharing:**<br>
Useful for data owners who want to share information, as it can share many feeds like public keys. CXO nodes can subscribe to a feed to receive updates and can connect using the discovery server, interconnecting data based on interests.

**Privacy:**<br>
CXO data exists collectively over the network. Once data is published, it cannot be destroyed, and data feeds are downloaded from peer subscribers. For privacy, the publisher’s location cannot be tracked as the publisher becomes merely a peer on the decentralized network

**Security:**<br>
CXO exists within a self-contained standard ecosystem that is mathematically strict and is implemented from the ground up. The owners sign data using private keys, and users who receive the data can audit the signature through the use of public key feeds to be sure the data comes from the desired owner. Security is ensured because nodes cannot alter data without the use of the owner’s private keys.

**CXO Applications:**<br>
Applications on CXO are currently being tested with light use. SkyBBS is a social network similar to Facebook, Steemit, and Twitter, and is built on top of CXO, with many more to come.

## Getting Started

> TODO

<!--* [Installation of CXO 2](./installation)-->

<!-- TODO:
## Basics

* [Base](./base)
* [Deep](./deep)
* [Data Encoding](./data-encoding)
* [References Encoding](./references-encoding)-->

## Tutorials

[Medium: How to use skycoins cxo 2.0](https://medium.com/@bksquared1024/how-to-use-skycoins-cxo-2-0-43754d3564ac)

## Open-Source Projects

> Here we will link Projects that use CXO 2 in the future.

### Apps

<!--* [Skycoin BBS](https://github.com/SkycoinProject/bbs)-->


## Social Networks

### Telegram

* [SkycoinCXO](https://t.me/SkycoinCXO)
* [Skycoincxorus](https://t.me/skycoincxorus)

[build-status-branch-develop]: https://travis-ci.com/SkycoinProject/cxo-2.svg?branch=develop
[build-status-url-develop]: https://travis-ci.com/SkycoinProject/cxo-2
[github-release-image]: https://img.shields.io/github/release/SkycoinProject/cxo-2.svg?style=flat-square
[github-release-url]: https://github.com/SkycoinProject/cxo-2/releases/latest
[release-date-image]: https://img.shields.io/github/release-date/SkycoinProject/cxo-2.svg?style=flat-square
[releases-url]: https://github.com/SkycoinProject/cxo-2/releases

[contributor-count-image]: https://img.shields.io/github/contributors/SkycoinProject/cxo-2.svg?style=social
[contributor-count-url]: https://github.com/SkycoinProject/cxo-2/graphs/contributors
[commit-activity-one-year-image]: https://img.shields.io/github/commit-activity/y/SkycoinProject/cxo-2.svg?style=social
[commit-last-image]: https://img.shields.io/github/last-commit/SkycoinProject/cxo-2.svg?style=social
[commit-last-url]: https://github.com/SkycoinProject/cxo-2/graphs/commit-activity?branch=develop

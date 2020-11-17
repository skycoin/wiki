# Skycoin

## Skycoin (SKY)

### What is Skycoin?

Skycoin is a next-generation cryptocurrency.

Skycoin was written from scratch and designed over four years to realize the ideal of Bitcoin and represents the apex of cryptocurrency design. Skycoin is not designed to add features to Bitcoin, but rather improves Bitcoin by increasing simplicity, security and stripping out everything non-essential.

Some people have hyped the Skycoin Project as leading into "Bitcoin 3.0". The coin itself is not "Bitcoin 3.0", but is rather "Bitcoin 1.0". Bitcoin is a prototype crypto-coin. Skycoin was designed to be what Bitcoin would look like if it were built from scratch, to remedy the rough edges in the Bitcoin design.

* no duplicate coin-base outputs
* enforced checks for hash collisions
* simple deterministic wallets
* no transaction malleability
* no signature malleability
* removal of the scripting language
* CoinJoin and normal transactions are indistinguishable
* elimination of edge-cases that prevent independent node implementations
* <=10 second transaction times
* elimination of the need for mining to achieve blockchain consensus

### Consensus

Medium Article: [A comprehensive guide to the consensus and skycoin obelisk](https://medium.com/@bksquared1024/a-comprehensive-guide-to-consensus-and-skycoins-obelisk-ed8b768749ff)

Medium Article Audio Version: [Telegram Message Link](https://t.me/SkyfleetNews/2757)

## CoinHours (SCH)

### What are coin hours?

Coin hours are a parallel currency within the Skycoin blockchain, alongside skycoins.  Coin hours are used to pay transaction fees in the network.  In the future, coin hours will be used in other applications beyond the Skycoin cryptocurrency, such as [Skywire](../../Skywire/wiki).

Coin hours are generated based upon the age of coins in a transaction output.

### What is a transaction output?

A Skycoin transaction consumes one or more outputs and creates one or more outputs.  Each output has an owner address, an amount of coins and an amount of hours.

When you send coins to someone, you destroy some outputs that are owned by addresses in your wallet and you create some new outputs.

### How are coin hours generated?

For every 1 coin in an output, 1 coin hour is created after 1 hour elapses.  Time is measured between the blockchain's current head block timestamp and the timestamp of the block in which the output was created.

Internally, the value is calculated as "coin seconds", then rounded down to the nearest whole coin hour. This implies that:

* A 0.1 skycoin output generates 1 coin hour every 10 hours (36000 seconds)
* A 1 skycoin output generates 1 coin hour every 1 hour (3600 seconds)
* A 10 skycoin output generates 1 coin hour every 6 minutes (360 seconds)

Generated coin hours are calculated at the time that the output is spent, and are added to the output's initial coin hours.  The elapsed time is the timestamp of the previous block, not a computer's clock time.

### How are coin hours used for transaction fees?

A transaction must destroy a percent of its total input coin hours in order to be valid.  It can optionally destroy more, to prioritize the transaction in a congested network.  Currently, the percent that must be destroyed is 10%. The value is always rounded up (i.e., if there are 5 input coin hours, 3 must be destroyed).  A transaction must destroy at least 1 coin hour.

Transactions are prioritized for inclusion in a block by their coin hour burn fee per byte.  Larger transactions (measured in bytes) require a higher amount of coin hours burned to achieve a higher priority.  

## Wallets

There are three options to hold Skycoin and generate SCH while holding.

### Software

Desktop: Windows, MacOS, Linux<br>
Mobile:Android, iOS<br>

Download your wallet from the official Website [here](https://www.skycoin.com/downloads/)

### Hardware

At the moment you can hold SKY only on the Skywallet.<br>
Read more [here](../../hardware/skywallet/index.md)<br>
Buy it from the [offical store](https://store.skycoin.com/products/skywallet)


## Exchanges

See [here](../../exchanges.md) on what exchanges you can buy SKY or SCH
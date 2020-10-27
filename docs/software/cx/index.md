# CX
[![Build Status develop][build-status-branch-develop]][build-status-url-develop]
[![GitHub release][github-release-image]][github-release-url]
[![last-release-date][release-date-image]][releases-url]<br>
[![issues-open][issues-open-image]][issues-open-url]
[![issues-closed][issues-closed-image]][issues-closed-url]<br>
[![contributor-count][contributor-count-image]][contributor-count-url]
![commits-per-year][commit-activity-one-year-image]
![last-commit][commit-last-image]

CX is Skycoin's original programming language. CX is a **general purpose programming language** that focuses on the design of distributed, blockchain-based applications. CX provides developers with high-level meta-programming features, such as **affordances**, **runtime stepping** and a **REPL** capable of modifying running programs at a low granularity level.<br>
CX is:

* deterministic
* integrates with blockchains
* works with immutable data structures
* incorporates our **new paradigm of affordances**
* is compiled and interpreted
* uses garbage collection
* has a strict typing system
* has other valuable tools built in

CX has multiple powerful libraries including **CXO** for immutable objects sharing, **CXFX** for its graphics engine, and more being developed. CX is written with Go's syntax to ensure professionals can quickly switch over and newcomers can easily learn it. CX will eventually be written entirely in CX.

Here you find a collection of all the knowledge you need to start with CX.<br>
If you have further questions, you are always welcomed on [Telegram](https://t.me/Skycoin_CX]) and [Reddit](https://reddit.com/r/CX_Language).

[Roadmap for the Development of CX](./Roadmap)

## Getting Started

* [Windows](./installation-windows)
* [macOS](./installation-macos)
* [Linux](./installation-linux)

## Basics & Documentation

=== "Basics"
    + [Syntax](./basics-syntax)
    + [Runtime](./basics-runtime)
    + [Native Functions](./basics-native-functions)
    + [Running CX](./basics-running-cx)
    + [REPL](./basics-repl)

=== "Documentation"
    * [CX Documentation & Book](https://www.skycoin.com/cx/)

## Native Packages

|Package|Purpose|more Info|
|:--|:--|:--|
|[time](./package-time)|time measuring & code pausing||
|[os](./package-os)|operating system||
|[gl](./package-gl)|graphics|[opengl.org](https://www.opengl.org/resources/libraries/)|
|[glfw](./package-glfw)|windows handling|[glfw.org](https://www.glfw.org/)|
|[gltext](./package-gltext)|font rendering|[github.com/go-gl/gltext](https://github.com/go-gl/gltext)

## Libraries

|Library|Purpose|Website|Telegram|Github|More|
|:--|:--|:--:|:--:|:--:|:--:|
|[CXFX](../../CXFX/wiki)|3D Graphics/Gaming Engine|| [Telegram](https://t.me/SkyCXFX)|[Github](https://github.com/SkycoinProject/cxfx)|[Twitter](https://twitter.com/skycoincxfx)|
|[CXChains](../../CXChains/wiki)|Blockchain Apps|
|PumpCX|User Interface|||[Github](https://github.com/asahi3g/pumpcx)|

<!--|[CXSL](../../CXSL/wiki)|General Utilities||[Telegram](https://t.me/CXLibraries)|[Github](https://github.com/ReewassSquared/CXSL)|
|SkyML|Math & Machine Learning||[Telegram](https://t.me/CXLibraries)||-->

## Compatible Products

|Products|Purpose|Website|Telegram|Github|More|
|:--|:--|:--:|:--:|:--:|:--:|
|[CXO](/software/cxo)|Immutable Objects System|<a href="https://www.skycoin.com/cxo/"> <img src="https://cdn.freebiesupply.com/logos/thumbs/1x/skycoin-logo.png" width="50"></a>|<a href="https://t.me/SkycoinCXO"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/512px-Telegram_2019_Logo.svg.png" width="30"></a>|<a href="http://github.com/SkycoinProject/cxo"> <img src="https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.flaticon.com%2Ficons%2Fpng%2F512%2F25%2F25231.png&f=1" width="30"></a>|
|[dmsg](/software/dmsg)|Distributed messaging system|


## Programming Tools

> TODO:
<!--
||Name|OS|Description|
|:--:|:--|--|--|
|<a href="./PT-Visual-Studio-Code"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Visual_Studio_Code_1.18_icon.svg/1200px-Visual_Studio_Code_1.18_icon.svg.png" width="30"></a>|[Visual Studio Code](./PT-Visual-Studio-Code) |Windows / macOS / Linux|
||Vim|Windows / macOS / Linux|
|<a href="./PT-Emacs"> <img src="https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png" width="30"></a>|[Emacs](./PT-Emacs)|Windows / macOS / Linux|
||Sublime Text|Windows / macOS / Linux|
||GoLand|Windows / macOS / Linux|
|<a href="./PT-Atom"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Atom_editor_logo.svg/1118px-Atom_editor_logo.svg.png" width="30"></a>|[ATOM](./PT-Atom)|Windows / macOS / Linux|
-->
## Tutorials

<!--### General Programming-->
<!--#### Youtube-->
* [Intro to Skycoin's CX for complete beginners: 1 [VOD]](https://www.youtube.com/watch?v=9V0T8axf4FQ)
* [A closer look at "Hello, world!" in CX](https://www.youtube.com/watch?v=6KdEIpD3RgU)
<!--### App-Design-->
<!--### Game-Design-->

## Open-Source-Projects

### Apps
|Name|Description|...|
|:--|:--|:--|
|[CxStratus](https://github.com/ReewassSquared/cx/tree/cxtweet)|Twitter Clone| |
|Unknown|4chan Clone|source: [Youtube](https://www.youtube.com/watch?v=QmRV3edG1cE&feature=youtu.be) |
|Unknown|Telegram clone|source: [Youtube](https://www.youtube.com/watch?v=QmRV3edG1cE&feature=youtu.be) |
|Unknown|Trello clone|source: [Youtube](https://www.youtube.com/watch?v=QmRV3edG1cE&feature=youtu.be) |

### Games
|Name|Description|...|
|:--|:--|:--|
|[Slot-Machine](https://github.com/galah4d/casino-cx)|
|[CrappyBall](https://github.com/atang152/crappyBall-cx)|Flappy-Bird Clone|
|[Pac Man CX](https://github.com/SkycoinProject/cx-games/tree/master/Pac-Man-CX-by-Galah4d)|Pacman 2D Clone|
|[Pacman 3D](https://github.com/galah4d/pacman-3d)|Pacman 3D Clone
|[Snake by Lunier](https://github.com/SkycoinProject/cx-games/tree/master/Snake-by-Lunier)|Snake Clone|
|[SynthCat Brick Breaker](https://github.com/SkycoinProject/cx-games/tree/master/SynthCat-Brick-Breaker-by-RedCurse)
|[Whacky Stack](https://github.com/SkycoinProject/cx-games/tree/master/Whacky-Stack)|Tetris Clone|
|[Ridge Blaster](https://github.com/SkycoinProject/cx-games/tree/master/ridge-blaster)|Dig-N-Rig Clone|
|[Space Invaders](https://github.com/taekwondouglas/space-invaders)|Space Invaders Clone|using CX-Chains|
|[CX Asteroids](https://github.com/0pcom/cx-asteroids)|Asteroids Clone|Documentation in wiki|
|[Skylight](https://github.com/SkycoinProject/cxfx/tree/master/games/skylight)|Goldeneye Clone|uses CXFX|

## Social Networks

Here are all available groups for the cx programming language
### Telegram
* [CX:Blockchain Programming Language](https://t.me/skycoin_cx)
* [CX-Labs](https://t.me/CXLabs)
* [Code Bootcamp](https://t.me/SkyfleetAcademy)
### Reddit
* [CX_Language](https://www.reddit.com/r/CX_Language/)

[build-status-branch-develop]: https://travis-ci.com/SkycoinProject/cx.svg?branch=develop
[build-status-url-develop]: https://travis-ci.com/SkycoinProject/cx
[github-release-image]: https://img.shields.io/github/release/SkycoinProject/cx.svg?style=flat-square
[github-release-url]: https://github.com/SkycoinProject/cx/releases/latest
[release-date-image]: https://img.shields.io/github/release-date/SkycoinProject/cx.svg?style=flat-square
[releases-url]: https://github.com/SkycoinProject/cx/releases
[issues-open-feature-url]: https://github.com/commonality/readme-inspector/labels/type%3A%20feature
[issues-open-image]: https://img.shields.io/github/issues/SkycoinProject/cx.svg?style=flat-square&colorB=249D3D
[issues-open-url]: https://github.com/SkycoinProject/cx/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc
[issues-closed-image]: https://img.shields.io/github/issues-closed/SkycoinProject/cx.svg?style=flat-square&colorB=D23240
[issues-closed-url]: https://github.com/SkycoinProject/cx/issues?q=is%3Aissue+sort%3Aupdated-desc+is%3Aclosed

[contributor-count-image]: https://img.shields.io/github/contributors/SkycoinProject/cx.svg?style=social
[contributor-count-url]: https://github.com/SkycoinProject/cx/graphs/contributors
[commit-activity-one-year-image]: https://img.shields.io/github/commit-activity/y/SkycoinProject/cx.svg?style=social
[commit-last-image]: https://img.shields.io/github/last-commit/SkycoinProject/cx.svg?style=social
[commit-last-url]: https://github.com/SkycoinProject/cx/graphs/commit-activity?branch=develop

This tutorial explains how to set up a visor on a raspberry pi from scratch.

Follow all steps and there shouldn't pop up any problems.

## Requirements

* Raspberry Pi 3 or 4 (or any other [supported SBC](#supported-sbcs))
* SD-Card (at least ?? GB storage)
* SD-Card reader
* [Balena Etcher](https://www.balena.io/etcher/)

## Installation

=== "Install Skyimager"

    === "MacOS"
        1.  Go to the [Skybian release page](https://github.com/SkycoinProject/skybian/releases).<br>
        2.  Download the binary that contains the word "darwin".
        3.  Unzip the file by double clicking on it.
        4.  Open the binary

        Now a Graphic User Interface should be opened automatically. <br>
        If you do not see any UI, open [http://127.0.0.1:8080/](http://127.0.0.1:8080/) within your browser.

        !!! info
            The system may display a security warning. If that is the case, open your system settings and go to security. There you should find the option to open the binary.

    === "Linux"
        1.  Go to the [Skybian release page](https://github.com/SkycoinProject/skybian/releases).<br>
        2.  Download the latest "linux"-binary
        3.  Unzip the file with:
            ```sh
            unxz $PATH_TO_BINARY ;tar -xf $PATH_TO_BINARY
            ```
        4. Open the binary
            ``` sh
            ./fyne-cross/bin/.../skyimager-gui binary
            ```
        Now a Graphic User Interface should be opened automatically. <br>
        If you do not see any UI, open [http://127.0.0.1:8080/](http://127.0.0.1:8080/) within your browser.

    === "Windows"
        1.  Go to the [Skybian release page](https://github.com/SkycoinProject/skybian/releases).<br>
        2.  Download the "windows"-binary
        3.  Unzip the file with an unzipping tool such as [7zip](https://www.7-zip.org/).
        4.  Open the binary

        Now a Graphic User Interface should be opened automatically. <br>
        If you do not see any UI, open [http://127.0.0.1:8080/](http://127.0.0.1:8080/) within your browser.

=== "Generating images"

    TODO

=== "Flashing images"

    TODO

## Helpful Links

[Configure wlan via command line](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md)

## Supported SBCs

TODO: add list
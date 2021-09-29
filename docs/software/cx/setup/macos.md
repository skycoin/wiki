# CX Installation on macOS

!!! info
    To install cx on macOS the best way is to use **Homebrew**.

??? info "Homebrew-Install"

    Download and install Homebrew by pressing <kbd>&#8984;</kbd> + <kbd>Space</kbd> and typing in `Terminal` to start Terminal, then type in the following command:

    ``` sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”
    ```

## Installation

1. Press <kbd>&#8984;</kbd> + <kbd>Space</kbd> and type in `Terminal` to start Terminal.

2. Type in the following lines to install **CX**:
    ``` sh
    brew tap skycoin/homebrew-skycoin
    brew install skycoin-cx
    ```

3. To update use the following command:
    ``` sh
    brew update skycoin-cx
    ```

## Hello, World!

To check our Installation with something more than a version output we will now make a cx-file to print out 'Hello World!'

1. Make a new text-file and rename it to hello-world.cx

2. Open the file with a text editor and type in the following:
    ``` go
    package main

    func main () {
         str.print("Hello, World!")
    }
    ```
3. Save and close

4. Press <kbd>&#8984;</kbd> + <kbd>Space</kbd> and type in **Terminal** to start Terminal.

5. Move to the direction where your hello-world.cx is and type in cx hello-world.cx or just drag and drop your file into the terminal after typing in `cx` followed by a Space

<put in screenshot of macOS Terminal with the hello-world.cx printed>

## Next Step

The next step should be to search for a development environment that fits you to code as easy as possible. Have a look into [Programming Tools](../overview#programming-tools) to find and setup your favorite Code Editor.
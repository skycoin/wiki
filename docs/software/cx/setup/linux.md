# CX Installation on Linux

!!! info
    You have got two options to install CX on Windows.

    1. **Binary Releases** - Fast and safe Installation
    2. **Compiling from Source** - better to customize your cx-options, also necessary for CX-Chains

=== "Binary Releases"
    1. Download the latest version of cx from [https://github.com/skycoin/cx/releases](https://github.com/skycoin/cx/releases)
        ``` sh
        TODO: terminal command
        ```

    2. Unzip into the destination folder you want to have your CX-files.
        ``` sh
        TODO: terminal command
        ```

    3. Setup the Environmental Variable $PATH so it knows your destination folder.
        ``` sh
        TODO: terminal command
        ```

=== "Compiling from Source"

    !!! Requirements
        To compile cx from source you need golang installed!

    ??? todo "Install Go"
        > Source: https://raw.githubusercontent.com/skycoin/skycoin/develop/INSTALLATION.md

        === "Installation Packet Manager"
            We need to install linux dependencies on the correct distribution.

            === "Ubuntu and Debian"
                ```sh
                sudo apt-get update && sudo apt-get upgrade -y
                sudo apt-get install -y curl git mercurial make binutils gcc bzr bison libgmp3-dev screen gcc build-essential
                ```

            === "Centos and Fedora"
                ```sh
                sudo yum update -y && sudo yum upgrade -y
                sudo yum install -y git curl make gcc mercurial binutils bzr bison screen
                if [[ "$(cat /etc/redhat-release | grep -o CentOS)" == "CentOS" ]]; then sudo yum install -y build-essential libgmp3-dev; else sudo yum groupinstall -y "Development Tools" "Development Libraries" && sudo yum install -y gmp; fi;
                ```
            === "Archlinux"
                First update the system and ensure the dependancies are met
                ```sh
                sudo pacman -Syy && sudo pacman -Syu
                sudo pacman -S base-devel
                ```

                Install the latest version of go on Archlinux with:
                ```sh
                sudo pacman -S go
                ```

        === "Install Go From Source"
            Let's go to home directory and declare `go`'s version that you want to download.

            ``` sh
            cd ~
            export GOV=1.11.1 # golang version
            ```

            After that, let's download and uncompress golang source.

            ``` sh
            curl -sS https://storage.googleapis.com/golang/go$GOV.linux-amd64.tar.gz > go$GOV.linux-amd64.tar.gz
            tar xvf go$GOV.linux-amd64.tar.gz
            rm go$GOV.linux-amd64.tar.gz
            ```

            lastly, let's install `go`.

            ``` sh
            sudo mv go /usr/local/go
            sudo ln -s /usr/local/go/bin/go /usr/local/bin/go
            sudo ln -s /usr/local/go/bin/godoc /usr/local/bin/godoc
            sudo ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt
            ```

            !!! note
                Find any golang source version at [Go Website](https://golang.org/dl/)

        === "Setup your GOPATH"
            The $GOPATH environment variable specifies the location of your workspace. It defaults to a directory named `go` inside your home directory, so $HOME/go on Unix.

            Create your workspace directory with it's respective inner folders:

            ``` sh
            mkdir -p $HOME/go
            mkdir -p $HOME/go/bin
            mkdir -p $HOME/go/src
            mkdir -p $HOME/go/pkg
            ```

            Setup $GOPATH variable, add it to ~/.bashrc. After editing, run `source ~/.bashrc` or open a new tab.

            ``` sh
            export GOROOT=/usr/local/go
            export GOPATH=$HOME/go
            export GOBIN=$GOPATH/bin
            export PATH=$PATH:$GOBIN
            ```

        === "Test your Go installation"
            Create and run the hello.go application described [here](https://golang.org/doc/install#testing) to check if your Go installation is working.

    1. Make sure you have got **go1.10+** installed. If not follow the guide above.

    2. Download CX's respository with:
        ``` sh
        go get github.com/skycoin/cx/cx/...
        ```

    3. Navigate to CX's repository and run:
        ``` sh
        make install
        ```

    4. Test your installation by running:
        ``` sh
        make test
        ```

        !!! note
            If you intend to develop games with CX test by running:

            ```bash
            make test-full
            ```

    5. To update your CX-Installation just run `make install` again.

## Hello, World!

> TODO

## Next Step

The next step should be to search for a development environment that fits you to code as easy as possible. Have a look into [Programming Tools](../#programming-tools) to find and setup your favorite Code Editor.
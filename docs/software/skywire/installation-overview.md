# Install Skywire

To install you have got different options depending on your hardware and your os.<br>

!!! info "Installation problems"
    If you ever run into troubles with you installation post your problem in the Telegram group [Skywire Mainnet](https://t.me/skywire).


=== "Linux"

    If you want to install skywire on linux distributions please follow the tutorial [here](../installation-linux).<br>

=== "macOS"

    For the tutorial on macOS please read through [this](../installation-macos).<br>

=== "Windows 10"

    !!! warning
        At the moment on Windows 10 you only can install a hypervisor to remotely configure your visors.
    
    To install a hypervisor on windows have a look at the tutorial [here](../installation-windows).

=== "Raspberry Pi & SBCs"

    !!! info "Skybian recommended"
        Although you could run a linux distribution on a Raspberry Pi (or a similar SBC) and install skywire via the linux distribution tutorial,
        it is recommended to use official skybian images. Those images already have all needed packages and requirements installed.

        So in short skybian is raspberryOS with: 

        *   skywire installed
        *   ssh enabled
        *   video enabled
        *   tty enabled
        *   network-manager installed.

    To set up a skywire visor from scratch on a raspberry pi follow the tutorial [here](../installation-raspberrypi).
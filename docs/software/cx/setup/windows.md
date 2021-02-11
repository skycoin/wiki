# Windows 10 Installation

## Installation

!!! info
    You have got two options to install CX on Windows.

    1. **Binary Releases** - Fast and safe Installation
    2. **Compiling from Source** - better to customize your cx-options, also necessary for CX-Chains

=== "Binary Releases"
    1. Download the latest version of cx.exe from [https://github.com/skycoin/cx/releases](https://github.com/skycoin/cx/releases)
    2. Unzip into the destination folder you want to have your CX-files.<br>
    *For example:  D:\Programs\CX*
    3. Setup Environment Variables to get access to your cx.exe through the terminal:

        Press <kbd>WIN</kbd> + <kbd>R</kbd>, type in **C:\Windows\System32\systempropertiesadvanced.exe** and hit <kbd>ENTER</kbd><br>
        Search for *Path* in 'User variables for User', select it and press Edit.<br>
        Make a new environment variable with the path, depending on your destination folder.<br> Here *D:\Programs\CX*
        <img src="https://raw.githubusercontent.com/SkycoinWikis/CX/master/Tutorials/Windows/Environment%20Variables.jpg"         width="900">

    4. Check your installation like [described here](#check-installation)

    5. To update your CX-Installation just get the latest cx.exe and replace the old one.
    
=== "Compiling from Source"

    !!! Requirements
        To compile cx from source you need golang installed!

    ??? todo "Install Go"
        > Source: https://skywug.net/forum/Thread-Skywire-node-on-Windows

        **Installation**<br>
        Download Go from https://golang.org/dl/ and install it.

        **Setup Environment Variables**<br>
        1. Press <kbd>WIN</kbd> + <kbd>R</kbd> to open **run** and type in<br>
            ```sh
            C:\Windows\System32\systempropertiesadvanced.exe
            ```
        2. Select the GOPATH variable and change it's value to:
            ``` sh
            %USERPROFILE%\go
            ```
        3. Make a new variable called GOBIN with the value:
            ``` sh
            %USERPROFILE%\go\bin
            ```
    
    1. First make sure you have got **GO** installed and set up your **Environment Variables**.<br>
       If not follow the guide above.

    2. You also need **git** to copy github repos. You can download it from <br> 
        [https://git-scm.com/downloads](https://git-scm.com/downloads).

    3. After the installation make a new Environment Variable like described in the next steps:

        3.1  Press <kbd>WIN</kbd> + <kbd>R</kbd> to open **run** and type in<br>
            ```sh
            C:\Windows\System32\systempropertiesadvanced.exe
            ```
        3.2 Make a new variable called **CXPATH** with the value: 
            ``` sh
            %USERPROFILE%\go\src\github.com\skycoin\cx
            ```
        3.3 Make sure the Environment Variables from Step 1 are also set:
            ``` sh
            GOPATH = %USERPROFILE%\go
            GOBIN  = %USERPROFILE%\go\bin
            ```

    4. Get the latest version of the github cx-repository

        4.1 Press <kbd>WIN</kbd> + <kbd>R</kbd>, type in cmd.exe and hit <kbd>ENTER</kbd>

        4.2 get github repo by typing in:
        ``` sh
        mkdir -p %GOPATH%\src\github.com\skycoin\
        cd %GOPATH%\src\github.com\skycoin\
        git clone https://github.com/skycoin/cx.git
        ```

        4.2 To install cx type in:
        ``` sh
        cd %CXPATH%
        cx-setup.bat
        ```

    5. Check your installation by typing in:
    ``` sh
    cd %CXPATH%
    cx tests\main.cx ++wdir=tests ++disable-tests=issue
    ```

    6. To update your CX-Installation just run ```cx-setup.bat``` again

## Check Installation

1. Open Terminal with <kbd>WIN</kbd> + <kbd>R</kbd> and type in 
    ``` sh
    cmd.exe
    ```
2. In Terminal type in
    ``` sh
    cx -v
    ```

3. The output should look like this:
   ``` sh
   CX version X.X.X
   ``` 
   (the X represent the version you have installed)

## Hello, World!

To check our Installation with something more than a version output we will now make a cx-file to print out 'Hello World!'

1. Make a **new text-file** in the location where your cx.exe is and rename it to **hello-world.cx**

2. Open the file with Editor and type in the following:
   ```go
   package main

   func main () {
        str.print("Hello, World!")
   }
   ```
   Press <kbd>Ctrl</kbd> + <kbd>S</kbd> and close

3. Open a terminal with <kbd>WIN</kbd> + <kbd>R</kbd> and type in
    ```sh
    cmd.exe
    ```

4. Move to the direction where your **hello-world.cx** is and type in **cx hello-world.cx**
   or just drag and drop your file into the terminal after typing in **cx** followed by a **Space**
   <img src="https://raw.githubusercontent.com/SkycoinWikis/CX/master/Tutorials/Windows/Hello-World.jpg"         width="900">

## Next Step
The next step should be to search for a development environment that fits you to code as easy as possible.
Have a look into [Programming Tools](../overview#programming-tools) to find your favorite Code Editor.
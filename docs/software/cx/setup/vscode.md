# Setup Visual Studio Code for CX

The most important thing in writing code is to easy identify the keywords of the language.
In the next steps you get to know how to setup VS Code for writing CX code.

## Setup keyword highlighting

1. Download the latest version of VS Code from [https://code.visualstudio.com/Download](https://code.visualstudio.com/Download)

2. After the installation open your CX-Directory: *File -> Open Folder..*

3. Activate your hello-world.cx file or another and then press <kbd>Ctrl</kbd> + <kbd>K</kbd>, release and press <kbd>M</kbd>

4. Click on **Configure File Association for '.cx'...**

5. Select **Go**

6. Now the keywords known from Go will be highlighted in every **.cx file** 
   <img src="https://raw.githubusercontent.com/SkycoinWikis/CX/master/Tutorials/Programming%20Tools/VS_Code_Highlighting.jpg">

## Setup Terminal

To run your code directly from VS Code you have to setup the Terminal depending on your operating system

=== "Windows"

    1. If you haven't got open the terminal in VS Code, go to *Terminal -> New Terminal*

    2. To change your default Shell press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> and search for command **Terminal: Select Default Shell**

    3. Select **Command Prompt**

    4. Now you can use the Windows Command Prompt inside VS Code:

    Move to the direction where your **hello-world.cx** is and type in **cx hello-world.cx**
    or just drag and drop your file into the terminal after typing in **cx** followed by a **Space**

    <img src="https://raw.githubusercontent.com/SkycoinWikis/CX/master/Tutorials/Programming%20Tools/VS_Code_Terminal.jpg"         width="500">

=== "macOS"

    **TODO**

=== "Linux"

    **TODO** 

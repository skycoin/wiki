# Setup Emacs for CX

The most important thing in writing code is to easy identify the keywords of the language.
In the next steps you get to know how to setup Emacs for writing CX code.

ATM we will use a golang mode to recognize .cx files, but hopefully we will see a cx-mode in the future.

## Setup keyword highlighting

1. Download the latest version of emacs from https://www.gnu.org/software/emacs/

2. After the installation run your emacs version.

3. Git clone or download the following repo: https://github.com/dominikh/go-mode.el and save it/unizip it to your prefered directory.

4. Press <kbd>Ctrl</kbd> + <kbd>x</kbd>, then <kbd>Ctrl</kbd> + <kbd>f</kbd> and type `~/.emacs.d/init.el` and press <kbd>Enter</kbd>\
   *emacs command syntax: `C-x C-f ~/.emacs.d/init.el`*

5. Now add the following lines:

    ```elisp
    (add-to-list 'load-path "directory/of/the/cloned/repository")
    (autoload 'go-mode "go-mode" nil t)
    (add-to-list 'auto-mode-alist '("\\.cx\\'" . go-mode))
    ```

6. Save and exit the file by pressing <kbd>Ctrl</kbd> + <kbd>x</kbd> and then <kbd>Ctrl</kbd> + <kbd>s</kbd>.

7. Close emacs by pressing <kbd>Ctrl</kbd> + <kbd>x</kbd> and then <kbd>Ctrl</kbd> + <kbd>c</kbd>

8. Now emacs will show all known keywords of golang when you edit cx-files.

## Setup Terminal

To run your code directly from emacs you have to setup the Terminal depending on your operating system.

=== "Windows"

    1. Open the init file with by pressing <kbd>Ctrl</kbd> + <kbd>x</kbd>, then <kbd>Ctrl</kbd> + <kbd>f</kbd> and typing `~/.emacs.d/init.el` and pressing <kbd>Enter</kbd>

    2. Add the following lines:

        ```elisp
        (defun run-cmdexe ()
            (interactive)
            (let ((shell-file-name "cmd.exe"))
                    (shell "*cmd.exe*")))
        ```

    3. Save and exit the file by pressing <kbd>Ctrl</kbd> + <kbd>x</kbd> and then <kbd>Ctrl</kbd> + <kbd>s</kbd>.

    4. Close emacs by pressing <kbd>Ctrl</kbd> + <kbd>x</kbd> and then <kbd>Ctrl</kbd> + <kbd>c</kbd>

    5. Restart emacs

    6. Now you can run cmd.exe in emacs by pressing <kbd>Alt</kbd> + <kbd>x</kbd> and then typing `run-cmdexe`\
    *emacs command syntax: M-x run-cmdexe*

    **hello-world.cx**

    1. Open emacs and make a new file called **hello-world.cx** by pressing <kbd>Ctrl</kbd> + <kbd>x</kbd>, then <kbd>Ctrl</kbd> + <kbd>f</kbd> and typing `~/.emacs.d/hello-world.cx`

    2. Type in the following code:

        ```go
        package main

        func main(){
            str.print("Hello, World!")
        }
        ```

    3. Save and exit the file by pressing <kbd>Ctrl</kbd> + <kbd>x</kbd> and then <kbd>Ctrl</kbd> + <kbd>s</kbd>.

    4. Start cmd.exe in emacs by pressing <kbd>Alt</kbd> + <kbd>x</kbd> and then typing `run-cmdexe`
    *emacs command syntax: M-x run-cmdexe*
    
    5. Run the file by changing into the file direction and then typing the cx command:
    
        ```cmd
        cd %USERPROFILE%/AppData/Roaming/.emacs.d
        cx hello-world.cx
        ```

=== "macOS"

    **TODO**

=== "Linux"

    **TODO**

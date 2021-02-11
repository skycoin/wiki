# Setup Atom for CX

The most important thing in writing code is to easy identify the keywords of the language.
In the next steps you get to know how to setup Atom for writing CX code.

## Setup keyword highlighting

1. Download the latest version of Atom from https://atom.io/ and install it.

2. Move to `~/.atom` and open `config.cson`\
   *For Windows: `C:\Users\Username\.atom`*

3. add the following lines:

    ```json
    core:
        customFileTypes:
            "source.go": [
            "cx"
            ]
    ```

4. Now Atom will use the golang syntax highlighting for every cx file.

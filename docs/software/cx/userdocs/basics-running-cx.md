## Running CX 

To run a CX program, you have to type, for example, `cx
the-program.cx`. Let's try to run some examples from the `examples`
directory in this repository. In a terminal, type this:

``` sh
cd $GOPATH/src/github.com/skycoin/cx/
cx examples/hello-world.cx
```

This should print `Hello World!` in the terminal. Now try running `cx
examples/opengl/game.cx`.

## Other Options

If you write `cx --help` or `cx -h`, you should see a text describing
CX's usage, options and more.

Some interesting options are:

* `--base` which generates a CX program's assembly code (in Go)
* `--compile` which generates an executable file
* `--repl` which loads the program and makes CX run in REPL mode
(useful for debugging a program)
* `--web` which starts CX as a RESTful web service (you can send code
  to be evaluated to this endpoint: http://127.0.0.1:5336/eval)
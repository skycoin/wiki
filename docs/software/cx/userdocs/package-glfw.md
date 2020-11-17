# Using glfw in CX
To use the glfw-Functions you first have to import it:
```go 
import "glfw" 
```
[Source Code](https://github.com/skycoin/cx/blob/develop/cx/op_glfw.go)

If you can't find any documentation on your problem have a look at the official [glfw.org-documentation](https://www.glfw.org/documentation.html)

> TODO

* glwf.PollEvents
* glfw.SwapBuffers
* glfw.GetFramebufferSize
* glfw.GetWindowPos
* glfw.GetWindowSize
* glfw.SwapInterval
* glfw.SetKeyCallback
* glfw.SetKeyCallbackEx
* glfw.GetTime
* glfw.SetMouseButtonCallback
* glfw.SetMouseButtonCallbackEx
* glfw.SetCursorPosCallback
* glfw.SetFramebufferSizeCallback
* glfw.SetWindowPosCallback
* glfw.SetWindowSizeCallback
* glfw.GetCursorPos
* glfw.SetInputMode
* glfw.SetWindowPos
* glfw.GetKey
* glfw.Fullscreen

## Functions
### glfw.Init
Initializes the glfw-library
```go
glfw.Init()
```
```go
Example -> see glfw.CreateWindow
```
### glfw.WindowHint
A function to save all setups for the next call of the function glfw.CreateWindow
```go
glfw.WindowHint(hint i32, value i32)
```
```go
Example -> see glfw.CreateWindow
```

!!! note "hints i32"
    see the [glfw.org-documentation](https://www.glfw.org/docs/latest/window_guide.html#window_hints)

### glfw.CreateWindow
```go
glfw.CreateWindow(window_identifier str, window_width i32, window_height i32, window_caption str)
```
<details>
<summary>Example</summary>

```go
//glfw.Init, glfw.WindowHint, glfw.CreateWindow (,glfw.MakeContextCurrent)
////inputs
var window_identifier str = "Window1"
var window_widht i32 = 1920  //pixles
var window_height i32 = 1000 //pixles
var window_caption str = "window-caption-example"
////function call
glfw.Init()
glfw.WindowHint(glfw.Resizable, glfw.False)
glfw.WindowHint(glfw.ContextVersionMajor, 2)
glfw.WindowHint(glfw.ContextVersionMinor, 1)

glfw.CreateWindow(window_identifier, window_width, window_height, window_caption)
glfw.MakeContextCurrent(window_identifier)
```
</details>

### glfw.MakeContextCurrent
Activates the given window
```go
glfw.MakeContextCurrent(window_identifier str)
```

```go
example -> see glfw.CreateWindow
```
### glfw.ShouldClose
Returns if the given window should be closed
```go
glfw.ShouldClose(window_identifier str)(should_close bool)
```
<details>
<summary>Example</summary>

```go
//glfw.ShouldClose
////input
var window_identifier str = "Window1"
////output
var should_close bool
////function call
should_close = glfw.ShouldClose(window_identifier str)
for bool.not(should_close){
    //do something
}
////function call alternative
for bool.not(glfw.ShouldClose(window_identifier str)){
    //do something
}
```
</details>

### glfw.SetShouldClose
Sets the ShouldClose of the given window to the given bool value
```go
glfw.SetShouldClose(window_identifier str, should_close bool)
```
<details>
<summary>Example</summary>

```go
//glfw.SetShouldClose
////input
var window_identifier str = "Window1"
var should_close bool = true
////function call
glfw.SetShouldClose(window_identifier, should_close)
```
</details>

> TODO: put constants into the functions where they are used

## Constants
* .False
* .True
* .Press
* .Release
* .Repeat
* .KeyUnknown
* .Cursor
* .StickyKeys
* .StickyMouseButtons
* .CursorNormal
* .CursorHidden
* .CursorDisabled
* .Resizable
* .ContextVersionMajor
* .ContextVersionMinor
* .Opengl.Coreprofile
* .Opengl.Profile
* .Opengl.ForwardCompatible
* .MouseButtonLast
* .MouseButtonLeft
* .MouseButtonRight
* .MouseButtonMiddle

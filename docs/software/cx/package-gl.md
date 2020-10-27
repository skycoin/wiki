# Using gl in CX
To use the gl-Functions you first have to import it:
```go 
import "gl" 
```
[Source Code](https://github.com/skycoin/cx/blob/develop/cx/op_opengl.go)

Until the documentation on this page is finished please refer to the [official opengl documentation](https://www.khronos.org/registry/OpenGL-Refpages/gl4/)

## TODO

> gogl

* gl.Init
* gl.Strs
* gl.Free
* gl.NewTexture
* gl.NewGIF
* gl.FreeGIF
* gl.GIFFrameToTexture

> gl 0.0

* gl.MatrixMode
* gl.Rotatef
* gl.Translatef
* gl.LoadIdentity
* gl.PushMatrix
* gl.PopMatrix
* gl.EnableClientState
* gl.Color3f
* gl.Color4f
* gl.Begin
* gl.End
* gl.Normal3f
* gl.Vertex2f
* gl.Vertex3f
* gl.Lightfv
* gl.Frustum
* gl.TexEnvi
* gl.Ortho
* gl.Scalef
* gl.TexCoord2d
* gl.TexCoord2f

> gl 1.0

* gl.CullFace
* gl.Hint
* gl.Scissor
* gl.TexParameteri
* gl.TexImage2D
* gl.Clear
* gl.ClearColor
* gl.ClearStencil
* gl.StencilMask
* gl.ColorMask
* gl.DepthMask
* gl.Disable
* gl.Enable
* gl.BlendFunc
* gl.StencilFunc
* gl.StencilOp
* gl.DepthFunc
* gl.GetError
* gl.GetTexLevelParameteriv
* gl.DepthRange
* gl.Viewport
> gl 1.1
* gl.DrawArrays
* gl.BindTexture
* gl.DeleteTextures
* gl.GenTextures
> gl 1.3
* gl.ActiveTexture
> gl 1.5
* gl.BindBuffer
* gl.DeleteBuffers
* gl.GenBuffers
* gl.BufferData
* gl.BufferSubData
> gl 2.0
* gl.StencilOpSeparate
* gl.StencilFuncSeparate
* gl.StencilMaskSeparate
* gl.AttachShader
* gl.BindAttribLocation
* gl.CompileShader
* gl.CreateProgram
* gl.CreateShader
* gl.DeleteProgram
* gl.DeleteShader
* gl.DetachShader
* gl.EnableVertexAttribArray
* gl.GetAttribLocation
* gl.GetShaderiv
* gl.GetUniformLocation
* gl.LinkProgram
* gl.ShaderSource
* gl.UseProgram
* gl.Uniform1f
* gl.Uniform1i
* gl.VertexAttribPointer
* gl.VertexAttribPointerI32
> gl 3.0
* gl.BindRenderbuffer
* gl.DeleteRenderbuffers
* gl.GenRenderbuffers
* gl.RenderbufferStorage
* gl.BindFramebuffer
* gl.DeleteFramebuffers
* gl.GenFramebuffers
* gl.CheckFramebufferStatus
* gl.FramebufferTexture2D
* gl.FramebufferRenderbuffer
* gl.BindVertexArray
* gl.DeleteVertexArrays
* gl.GenVertexArrays
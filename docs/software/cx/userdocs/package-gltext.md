# Using gltext in CX
To use the gltext-Functions you first have to import it:
```go 
import "gltext" 
```
[Source Code](https://github.com/skycoin/cx/blob/develop/cx/op_gltext.go)

## gltext.LoadTrueType
This Function saves your font settings. You then can access your settings by the **font_setting_identifier** *string* you have given to the function.
```go
gltext.LoadTrueType(font_setting_identifier str,font_file_directory str,scaleToPixelHeight i32,low i32,high i32,direction i32)()
```
<details>
<summary>Example</summary>

```go
//gltext.LoadTrueType
////input
var font_setting_identifier str = "Roboto100"
var font_file_directory str = str.concat(os.GetWorkingDirectory(), "fonts/skycoin_light.ttf")
var scaleToPixelHeight i32 = 100
var direction i32 = gltext.LeftToRight
////function call
os.Open(font_file_directory)
gltext.LoadTrueType(font_setting_identifier, font_file_directory , scaleToPixelHeight, 32, 127, direction)
os.Close(font_file_directory)
```
low and high are the lower and upper rune limits, for standard ASCII low = 32, high = 127

</details>

**directions i32:**
```go
gltext.LeftToRight
gltext.RightToLeft
gltext.TopToBottom
```

## gltext.GlyphBounds
Returns the width and height of the biggest rune of the given, loaded font setting
```go
gltext.GlyphBounds(font_setting_identifier str)(width i32, height i32)
```
<details>
<summary>Example</summary>

```go
//gltext.GlyphBounds
////input
var font_setting_identifier str = "Roboto100"
////output
var width i32
var height i32
////function call
width, height = gltext.GlyphBounds(font_setting_identifier)
```
</details>

## gltext.GlyphMetrics
Returns the width and height of the given glyph texture
```go
gltext.GlyphMetrics(font_setting_identifier str, glyph_texture i32)(width i32, height i32)
```
<details>
<summary>Example</summary>

```go
//gltext.Metrics
////input
var font_setting_identifier str = "Roboto100"
var glyph_texture i32 = gl.NewTexture(sprintf("%s%s%s", os.GetWorkingDirectory(), "fonts/glyphs/", "test-glyph.png"))
////output
var width i32
var height i32
////function call
width, height = gltext.Metrics(font_setting_identifier, glyph_texture)
```
</details>

## gltext.GlyphInfo
Returns all possible infos of the given glyph_texture
```go
gltext.GlyphInfo(font_setting_identifier str, glyph_texture i32)(x i32,y i32, width i32, height i32, advanced_size i32)
```
<details>
<summary>Example</summary>

```go
//gltext.GlyphInfo
////input
var font_setting_identifier str = "Roboto100"
var glyph_texture i32 = gl.NewTexture(sprintf("%s%s%s", os.GetWorkingDirectory(), "fonts/glyphs/", "test-glyph.png"))
////output
var x i32     //the x location of the glpyh on a sprite sheet
var y i32     //the y location of the glpyh on a sprite sheet
var width i32
var height i32
var advanced_size i32 //the distance to the next glyph
////function call
x, y, width, height, advanced_size = gltext.Metrics(font_setting_identifier, string_to_analyze)
```
</details>

## gltext.Metrics
Returns the width and the height of the given string
```go
gltext.Metrics(font_setting_identifier str, string_to_analyze str) (width i32, height i32)
```
<details>
<summary>Example</summary>

```go
//gltext.Metrics()
////input
var font_setting_identifier str = "Roboto100"
var string_to_analyze str = "Hello World"
////output
var width i32
var height i32
////function call
width, height = gltext.Metrics(font_setting_identifier, string_to_analyze)
```
</details>

## gltext.NextGlyph
Returns all infos of the indexed char-glyph of the given string
```go
gltext.NextGlyph(font_setting_identifier str, string_to_analyze str, index i32) 
                (glyph_texture i32, width_in_bytes i32, x i32, y i32, width i32, height i32, advanced_size i32)
```
<details>
<summary>Example</summary>

```go
//gltext.NextGlyph
////input
var font_setting_identifier str = "Roboto100"
var string_to_analyze str = "Hello World"
var index i32 = 2
////output
var glyph_texture i32
var width_in_bytes i32
var x i32               //the x location of the glpyh on a sprite sheet
var y i32               //the y location of the glpyh on a sprite sheet
var width i32
var height i32
var advanced_size i32   //the distance to the next glyph
////function call
glyph_texture, width_in_bytes, x, y, width, height, advanced_size = gltext.NextGlyph(font_setting_identifier, string_to_analyze, index)
```
</details>

## gltext.Printf
Prints the given string on the absolute pixel position of the screen
```go
gltext.Printf(font_setting_identifier str, x_position f32, y_position f32, string_to_print str)
```
<details>
<summary>Example</summary>

```go
//gltext.Printf
////input
var font_setting_identifier str = "Roboto100"
var x_position f32 = 0.0
var y_position f32 = 0.0
var string_to_print str = "Hello World"
////function call
gl.Color4f(0.5, 0.3, 0.8, 1.0) //With this function call you can setup the color of your text
gltext.Printf(font_setting_identifier , x_position, y_position, string_to_print)
```
</details>

## gltext.Texture
Returns the number/index of the loaded font
```go
gltext.Texture(font_setting_identifier str)(number_of_loaded_font i32)
```
<details>
<summary>Example</summary>

```go
//gltext.Texture
////input
var font_setting_identifier str = "Roboto100"
////output
var number_of_loaded_font i32 
////function call
number_of_loaded_font  = gltext.Texture(font_setting_identifier)
```
</details>
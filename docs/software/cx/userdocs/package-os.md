# Using os in CX
To use the time-Functions you first have to import it:
```go 
import "os" 
```
[Source Code](https://github.com/skycoin/cx/blob/develop/cx/op_os.go)

## os.GetWorkingDirectory
This function returns the directory of your running program
```go
os.GetWorkingDirectory()(working_directory str)
```
<details>
<summary>Example</summary>

```go
//os.GetWorkingDirectory
////output
var working_directory str
////function call
working_directory = os.GetWorkingDirectory()
```
</details>

## os.Open
This function opens the given file. Don't forget to close it, after you used it.
```go
os.Open(file_directory str)
```
<details>
<summary>Example</summary>

```go
//os.Open
////input
var file_directory str = "C:/Files/testfile.txt"
////function call
os.Open(file_directory)
```
</details>

## os.Open
This function closes the given and open file
```go
os.Close(file_directory str)
```
<details>
<summary>Example</summary>

```go
//os.Close
////input
var file_directory str = "C:/Files/testfile.txt"
////function call
os.Close(file_directory)
```
</details>
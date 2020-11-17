# Using time in CX
To use the time-Functions you first have to import it:
```go 
import "time" 
```
[Source Code](https://github.com/SkycoinProject/cx/blob/develop/cx/op_time.go)

## time.Sleep
By calling this function you force the code to pause the given amount of milliseconds

```go
time.Sleep(milliseconds_to_pause i32)
```
<details>
<summary>Example</summary>

```go
//time.Sleep
////input
var milliseconds_to_pause i32 = 1000
////function call
time.Sleep(milliseconds_to_pause)
```
</details>

## time.UnixMilli
This function returns the elapsed milliseconds since 01.01.1970 UTC
```go
time.UnixMilli()(milliseconds_since_01011970 i64)
```
<details>
<summary>Example</summary>

```go
//time.UnixMilli
////output
var milliseconds_since_01011970 i64
////function call
milliseconds_since_01011970  = time.UnixMilli()
```
</details>

## time.UnixNano
This function returns the elapsed nanoseconds since 01.01.1970 UTC
```go
time.UnixNano()(nanoseconds_since_01011970 i64)
```
<details>
<summary>Example</summary>

```go
//time.UnixNano
////output
var nanoseconds_since_01011970 i64
////function call
nanoseconds_since_01011970  = time.UnixNano()
```
</details>
 
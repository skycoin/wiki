# Native Functions

## Type-inferenced Functions

CX has a small set of functions that are not associated to a single
type signature. For example, instead of using `i32.add` to add two
32-bit integers, you can use the generalized `add`
function. Furthermore, whenever you use arithmetic operators, such as
`+`, `-` or `%`, these are translated to their corresponding
"type-inferenced" function, e.g. `num = 5 + 5` is translated to `num =
i32.add(5, 5)`. These native functions still follow CX's philosophy of
having a strict typing system, as the types of the arguments sent to
these native functions must be the same.

Note that after listing a group of similar "type-inferenced" functions
below, we list the compatible types for the corresponding functions.

### `eq`
### `uneq`

Note: the preceding functions only work with arguments of type
*bool*, *byte*, *str*, *i32*, *i64*, *f32* or *f64*.

#### Example

``` go
package main

func main () {
	bool.print(eq(5, 5))
	bool.print(5 == 5) // alternative
	
	bool.print(uneq("hihi", "byebye"))
	bool.print("hihi" != "byebye") // alternative
}
```

### `lt`
### `gt`
### `lteq`
### `gteq`

Note: the preceding function only works with arguments of type *byte*,
*bool*, *str*, *i32*, *i64*, *f32* or *f64*.

#### Example

``` go
package main

func main () {
	bool.print(lt(3B, 4B))
	bool.print(3B < 4B) // alternative

	bool.print(gt("hello", "hi!"))
	bool.print("hello" > "hi!") // alternative

	bool.print(lteq(5.3D, 5.3D))
	bool.print(5.3D <= 5.3D) // alternative

	bool.print(gteq(10L, 3L))
	bool.print(10L >= 3L) // alternative
}
```

### `bitand`
### `bitor`
### `bitxor`
### `bitclear`
### `bitshl`
### `bitshr`

Note: the preceding functions only work with arguments of type *i32*
or *i64*.

#### Example

``` go
package main

func main () {
	i32.print(bitand(5, 1))
	i32.print(5 & 1) // alternative

	i64.print(bitor(3L, 2L))
	i64.print(3L | 2L) // alternative

	i32.print(bitxor(10, 2))
	i32.print(10 ^ 2) // alternative

	i64.print(bitclear(5L, 2L))
	i64.print(5L &^ 2L) // alternative

	i32.print(bitshl(2, 3))
	i32.print(2 << 3) // alternative

	i32.print(bitshr(16, 3))
	i32.print(16 >> 3) // alternative
}
```

### `add`
### `sub`
### `mul`
### `div`

Note: the preceding functions only work with arguments of type
*byte*, *i32*, *i64*, *f32* or *f64*.

#### Example

``` go
package main

func main () {
	byte.print(add(5B, 10B))
	byte.print(5B + 10B) // alternative

	i32.print(sub(3, 7))
	i32.print(3 - 7) // alternative

	i64.print(mul(4L, 5L))
	i64.print(4L * 5L) // alternative

	f32.print(div(4.3, 2.1))
	f32.print(4.3 / 2.1) // alternative
}
```

### `mod`

Note: the preceding function only works with arguments of type *byte*,
*i32* or *i64*.

#### Example

``` go
package main

func main () {
	byte.print(mod(5B, 3B))
	byte.print(5B % 3B) // alternative
}
```

### `len`

Note: the preceding function only works with arguments of type *str*,
*arrays* or *slices*.

#### Example

``` go
package main

func main () {
	var string str
	var array [5]i32
	var slice []i32

	string = "this should print 20"
	array = [5]i32{1, 2, 3, 4, 5}
	slice = []i32{10, 20, 30}
	
	i32.print(len(string)) // prints 20
	i32.print(len(array)) // prints 5
	i32.print(len(slice)) // prints 3
}
```

### `printf`

Note: the preceding function requires a format *str* as its first
argument, followed by any number of arguments of type *str*, *i32*,
*i64*, *f32* or *f64*. The format string recognizes the following
directives: `%s` for strings, `%d` for integers and `%f` for floating
point numbers.

#### Example

``` go
package main

func main () {
	var name str
	var age i32
	var wrongPI f32
	var error f64

	name = "Richard"
	age = 14
	wrongPI = 3.16
	error = 0.0000000000000001D

	printf("Hello, %s. My name is %s. I see that you calculated the value of PI wrong (%f). I think this is not so bad, considering your young age of %d. When I was %d years old, I remember I miscalculated it, too (I got %f as a result, using a numerical method). If you are using a numerical method, please consider reaching an error lower than %f to get an acceptable result, and not a ridiculous value such as %f. \n\nBest regards!\n", name, "Edward", wrongPI, age, 25, 3.1417, error, 0.1)
}
```

### `sprintf`

Note: the preceding function requires a format *str* as its first
argument, followed by any number of arguments of type *str*, *i32*,
*i64*, *f32* or *f64*. The format string recognizes the following
directives: `%s` for strings, `%d` for integers and `%f` for floating
point numbers.

``` go
package main

func main () {
	var reply str
	var name str
	var title str

	name = "Edward"
	title = "Richard 8 PI"

	reply = sprintf("Thank you for contacting our technical support, %s. We see that you are having trouble with our video game titled '%s', targetted to kids under age %d. If you provide us with your parents e-mail address, we'll be glad to help you!", name, title, 14)

	str.print(reply)
}
```

## Slice Functions

### `append`

#### Example

``` go
package main

func main () {
	var slc1 []i32
	slc1 = append(slc1, 1)
	slc1 = append(slc1, 2)

	var slc2 []i32
	slc2 = append(slc1, 3)
	slc2 = append(slc2, 4)

	i32.print(len(slc1)) // prints 2
	i32.print(len(slc2)) // prints 4
}
```

## Input/Output Functions

The following functions are used to handle input from the user and to
print output to a terminal.

### `read`

#### Example

``` go
package main

func main () {
	var password str

	for true {
		printf("What's the password, kid? ")
		password = read()

		if password == "123" {
			str.print("Welcome back.")
			return
		} else {
			str.print("Wrong, but you'll get another chance.")
		}
	}
}
```

### `byte.print`
### `bool.print`
### `str.print`
### `i32.print`
### `i64.print`
### `f32.print`
### `f64.print`
### `printf`

#### Example

``` go
package main

func main () {
    byte.print(5B)
    bool.print(true)
    str.print("Hello!")
    i32.print(5)
    i64.print(5L)
    f32.print(5.0)
    f64.print(5.0D)
    printf("For a better example, check section Type-inferenced Functions'")
}
```

## Parse Functions

All parse functions follow the same pattern: `XXX.YYY` where *XXX* is
the receiving type and *YYY* is the target type. You can read these
functions as "parse XXX to YYY".

### `byte.str`
### `byte.i32`
### `byte.i64`
### `byte.f32`
### `byte.f64`


#### Example

``` go
package main

func main () {
	var b byte
	b = 30B

	str.print(str.concat("Hello, ", byte.str(b)))
	i32.print(5 + byte.i32(b))
	i64.print(10L + byte.i64(b))
	f32.print(33.3 + byte.f32(b))
	f64.print(50.111D + byte.f64(b))
}
```

### `i32.byte`
### `i32.str`
### `i32.i64`
### `i32.f32`
### `i32.f64`

#### Example

``` go
package main

func main () {
	var num i32
	num = 43

	str.print(str.concat("Hello, ", i32.str(num)))
	byte.print(5B + i32.byte(num))
	i64.print(10L + i32.i64(num))
	f32.print(33.3 + i32.f32(num))
	f64.print(50.111D + i32.f64(num))
}
```

### `i64.byte`
### `i64.str`
### `i64.i32`
### `i64.f32`
### `i64.f64`

#### Example

``` go
package main

func main () {
	var num i64
	num = 43L

	str.print(str.concat("Hello, ", i64.str(num)))
	byte.print(5B + i64.byte(num))
	i64.print(10L + i64.i64(num))
	f32.print(33.3 + i64.f32(num))
	f64.print(50.111D + i64.f64(num))
}
```

### `f32.byte`
### `f32.str`
### `f32.i32`
### `f32.i64`
### `f32.f64`

#### Example

``` go
package main

func main () {
	var num f32
	num = 43.33

	str.print(str.concat("Hello, ", f32.str(num)))
	byte.print(5B + f32.byte(num))
	i32.print(33 + f32.f32(num))
	i64.print(10L + f32.i64(num))
	f64.print(50.111D + f32.f64(num))
}
```

### `f64.byte`
### `f64.str`
### `f64.i32`
### `f64.i64`
### `f64.f32`

#### Example

``` go
package main

func main () {
	var num f64
	num = 43.33D

	str.print(str.concat("Hello, ", f64.str(num)))
	byte.print(5B + f64.byte(num))
	i32.print(33 + f64.f32(num))
	i64.print(10L + f64.i64(num))
	f32.print(50.111 + f64.f32(num))
}
```

### `str.byte`
### `str.i32`
### `str.i64`
### `str.f32`
### `str.f64`

#### Example

``` go
package main

func main () {
	var num str
	num = "33"

	byte.print(5B + str.byte(num))
	i32.print(33 + str.f32(num))
	i64.print(10L + str.i64(num))
	f32.print(50.111 + str.f32(num))
	f64.print(50.111D + str.f32(num))
}
```

## Unit Testing

The `assert` function is used to test the value of an expression
against another value. This function is useful to test that a
package is working as intended.

### assert

#### Example

``` go
package main

func foo() (res str) {
    res = "Working well"
}

func main () {
    var results []bool

    results = append(results, assert(5 + 5, 10, "Something went wrong with 5 + 5"))
    results = append(results, assert(foo(), "Working well", "Something went wrong with foo()"))

    var successfulTests i32
	for c := 0; c < len(results); c++ {
		if results[c] {
			successfulTests = successfulTests + 1
		}
	}

    printf("%d tests were performed\n", len(results))
    printf("%d were successful\n", successfulTests)
    printf("%d failed\n", len(results) - successfulTests)
}
```

## `bool` Type Functions

### `bool.print`
### `bool.eq`
### `bool.uneq`
### `bool.not`
### `bool.or`
### `bool.and`

#### Example

``` go
package main

func main () {
	bool.print(bool.eq(true, true))
	bool.print(bool.uneq(false, true))
	bool.print(bool.not(false))
	bool.print(bool.or(true, false))
	bool.print(bool.and(true, true))
}
```
## Type Functions

## `str` Type Functions

### `str.print`
### `str.concat`

#### Example

``` go
package main

func main () {
	str.print(str.concat("Hello, ", "World!"))
}
```

## `i32` Type Functions

The following functions are of general purpose and are restricted to
work with data structures of type *i32* where it makes sense.

### `i32.print`
### `i32.add`
### `i32.sub`
### `i32.mul`
### `i32.div`
### `i32.mod`
### `i32.abs`

#### Example

``` go
package main

func main () {
	i32.print(i32.add(5, 7))
	i32.print(i32.sub(6, 3))
	i32.print(i32.mul(4, 8))
	i32.print(i32.div(15, 3))
	i32.print(i32.mod(5, 3))
	i32.print(i32.abs(-13))
}
```

### `i32.log`
### `i32.log2`
### `i32.log10`
### `i32.pow`
### `i32.sqrt`

#### Example

``` go
package main

func main () {
	i32.print(i32.log(13))
	i32.print(i32.log2(3))
	i32.print(i32.log10(12))
	i32.print(i32.pow(4, 4))
	i32.print(i32.sqrt(2))
}
```

### `i32.gt`
### `i32.gteq`
### `i32.lt`
### `i32.lteq`
### `i32.eq`
### `i32.uneq`

#### Example

``` go
package main

func main () {
	bool.print(i32.gt(5, 3))
	bool.print(i32.gteq(3, 8))
	bool.print(i32.lt(4, 3))
	bool.print(i32.lteq(8, 6))
	bool.print(i32.eq(-9, -9))
	bool.print(i32.uneq(3, 3))
}
```

### `i32.bitand`
### `i32.bitor`
### `i32.bitxor`
### `i32.bitclear`
### `i32.bitshl`
### `i32.bitshr`

#### Example

``` go
package main

func main () {
	i32.print(i32.bitand(2, 5))
	i32.print(i32.bitor(8, 3))
	i32.print(i32.bitxor(3, 9))
	i32.print(i32.bitclear(4, 4))
	i32.print(i32.bitshl(5, 9))
	i32.print(i32.bitshr(1, 6))
}
```

### `i32.max`
### `i32.min`

#### Example

``` go
package main

func main () {
	i32.print(i32.max(2, 5))
	i32.print(i32.min(10, 3))
}
```

### `i32.rand`

#### Example

``` go
package main

func main () {
	i32.print(i32.rand(0, 100))
}
```

## `i64` Type Functions

The following functions are of general purpose and are restricted to
work with data structures of type *i64* where it makes sense.

### `i64.print`
### `i64.add`
### `i64.sub`
### `i64.mul`
### `i64.div`
### `i64.mod`
### `i64.abs`

#### Example

``` go
package main

func main () {
	i64.print(i64.add(5L, 7L))
	i64.print(i64.sub(6L, 3L))
	i64.print(i64.mul(4L, 8L))
	i64.print(i64.div(15L, 3L))
	i64.print(i64.mod(5L, 3L))
	i64.print(i64.abs(-13L))
}
```

### `i64.log`
### `i64.log2`
### `i64.log10`
### `i64.pow`
### `i64.sqrt`

#### Example

``` go
package main

func main () {
	i64.print(i64.log(13L))
	i64.print(i64.log2(3L))
	i64.print(i64.log10(12L))
	i64.print(i64.pow(4L, 4L))
	i64.print(i64.sqrt(2L))
}
```

### `i64.gt`
### `i64.gteq`
### `i64.lt`
### `i64.lteq`
### `i64.eq`
### `i64.uneq`

#### Example

``` go
package main

func main () {
	bool.print(i64.gt(5L, 3L))
	bool.print(i64.gteq(3L, 8L))
	bool.print(i64.lt(4L, 3L))
	bool.print(i64.lteq(8L, 6L))
	bool.print(i64.eq(-9L, -9L))
	bool.print(i64.uneq(3L, 3L))
}
```

### `i64.bitand`
### `i64.bitor`
### `i64.bitxor`
### `i64.bitclear`
### `i64.bitshl`
### `i64.bitshr`

#### Example

``` go
package main

func main () {
	i64.print(i64.bitand(2L, 5L))
	i64.print(i64.bitor(8L, 3L))
	i64.print(i64.bitxor(3L, 9L))
	i64.print(i64.bitclear(4L, 4L))
	i64.print(i64.bitshl(5L, 9L))
	i64.print(i64.bitshr(1L, 6L))
}
```

### `i64.max`
### `i64.min`

#### Example

``` go
package main

func main () {
	i64.print(i64.max(2L, 5L))
	i64.print(i64.min(10L, 3L))
}
```

### `i64.rand`

#### Example

``` go
package main

func main () {
	i64.print(i64.rand(0L, 100L))
}
```

## `f32` Type Functions

The following functions are of general purpose and are restricted to
work with data structures of type *f32* where it makes sense.

### `f32.print`
### `f32.add`
### `f32.sub`
### `f32.mul`
### `f32.div`
### `f32.abs`

#### Example

``` go
package main

func main () {
	f32.print(f32.add(5.3, 10.5))
	f32.print(f32.sub(3.2, 6.7))
	f32.print(f32.mul(-7.9, -7.1))
	f32.print(f32.div(10.3, 2.4))
	f32.print(f32.abs(-3.14159))
}
```

### `f32.log`
### `f32.log2`
### `f32.log10`
### `f32.pow`
### `f32.sqrt`

#### Example

``` go
package main

func main () {
	f32.print(f32.log(2.3))
	f32.print(f32.log2(3.4))
	f32.print(f32.log10(3.0))
	f32.print(f32.pow(-5.3, 2.0))
	f32.print(f32.sqrt(4.0))
}
```

### `f32.sin`
### `f32.cos`

#### Example

``` go
package main

func main () {
	f32.print(f32.sin(1.0))
	f32.print(f32.cos(2.0))
}
```

### `f32.gt`
### `f32.gteq`
### `f32.lt`
### `f32.lteq`
### `f32.eq`
### `f32.uneq`

#### Example

``` go
package main

func main () {
	bool.print(f32.gt(5.3, 3.1))
	bool.print(f32.gteq(3.7, 1.9))
	bool.print(f32.lt(2.4, 5.5))
	bool.print(f32.lteq(8.4, 3.2))
	bool.print(f32.eq(10.3, 10.3))
	bool.print(f32.uneq(8.9, 3.3))
}
```

### `f32.max`
### `f32.min`

#### Example

``` go
package main

func main () {
	f32.print(f32.max(3.3, 4.2))
	f32.print(f32.min(5.8, 9.9))
}
```

## `f64` Type Functions

The following functions are of general purpose and are restricted to
work with data structures of type *f64* where it makes sense.

### `f64.print`
### `f64.add`
### `f64.sub`
### `f64.mul`
### `f64.div`
### `f64.abs`

#### Example

``` go
package main

func main () {
	f64.print(f64.add(5.3D, 10.5D))
	f64.print(f64.sub(3.2D, 6.7D))
	f64.print(f64.mul(-7.9D, -7.1D))
	f64.print(f64.div(10.3D, 2.4D))
	f64.print(f64.abs(-3.14159D))
}
```

### `f64.log`
### `f64.log2`
### `f64.log10`
### `f64.pow`
### `f64.sqrt`

#### Example

``` go
package main

func main () {
	f64.print(f64.log(2.3D))
	f64.print(f64.log2(3.4D))
	f64.print(f64.log10(3.0D))
	f64.print(f64.pow(-5.3D, 2.0D))
	f64.print(f64.sqrt(4.0D))
}
```

### `f64.sin`
### `f64.cos`

#### Example

``` go
package main

func main () {
	f64.print(f64.sin(1.0D))
	f64.print(f64.cos(2.0D))
}
```

### `f64.gt`
### `f64.gteq`
### `f64.lt`
### `f64.lteq`
### `f64.eq`
### `f64.uneq`

#### Example

``` go
package main

func main () {
	bool.print(f64.gt(5.3D, 3.1D))
	bool.print(f64.gteq(3.7D, 1.9D))
	bool.print(f64.lt(2.4D, 5.5D))
	bool.print(f64.lteq(8.4D, 3.2D))
	bool.print(f64.eq(10.3D, 10.3D))
	bool.print(f64.uneq(8.9D, 3.3D))
}
```

### `f64.max`
### `f64.min`

#### Example

``` go
package main

func main () {
	f64.print(f64.max(3.3D, 4.2D))
	f64.print(f64.min(5.8D, 9.9D))
}
```

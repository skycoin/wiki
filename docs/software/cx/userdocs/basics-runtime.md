# Runtime

The previous section presents the language features from a syntax
perspective. In this section we'll cover what's the logic behind these
features: how they interact with other elements in your program, and
what are the intrinsic capabilities of each of these features.

## Packages

Packages are CX's mechanism for better organizing your code. Although
it is theoretically possible to store a big project in a single
package, the code will most likely become very hard to understand. In
CX the programmer is encouraged to place the files that define the
code of a package in separate directory. Any subdirectory in a
package's directory should also contain only source code files that
define elements of the same package. Nevertheless, CX will not
throw any error if you don't follow this way of laying out your source
files. In fact, you can declare different packages in a single source
code file.

## Data Structures

Data structures are particular arrangements of bytes that the language
interprets and stores in special ways. The most basic data structures
represent basic data, such as numbers and character strings, but these
basic types can be used to construct more complex data types.

### Literals

A literal is any data structure that is not being referenced by any
variable yet. For example: `1`, `true`, `[]i32{1, 2, 3}`, `Point{x:
10, y: 20}`.

It's important to make a distinction, particularly with *arrays*,
*slices* and *struct instances*.

``` go
package main

type Point struct {
	x i32
	y i32
}

func main () {
	var p1 Point
	p1.x = 10
	p1.y = 20

	p2 := Point{x: 11, y: 21}

	i32.print(p2.x)
	i32.print(p2.y)
}
```

In the example above we are creating two instances of the `Point`
type. The first method we use does not involve struct literals, as a
variable of that type is first created and then initialized.

In the second case (`p2`), the full struct instance is first
created. CX creates an anonymous struct instance as soon as it
encounters `Points{x: 11, y: 21}`, and then it proceeds to assign that
literal to the `p2` variable, using *short variable declarations*.

``` go
package main

func main () {
	var arr1 [3]i32
	arr1[0] = 1
	arr1[1] = 2
	arr1[2] = 3

	arr2 := [3]i32{10, 20, 30}
}
```

``` go
package main

func main () {
	var slc1 []i32
	slc1 = append(slc1, 1)
	slc1 = append(slc1, 2)
	slc1 = append(slc1, 3)
	
	slc2 := []i32{10, 20, 30}
}
```
Similarly, in the two examples above we can see how we can declare
array and slice variables and then we initialize them. In the case of
arrays, we use the bracket notation, and for slices we have to use
`append`, as `slc1` starts with a size and capacity of 0. In the cases
of `arr2` and `slc2`, we use literals to initialize them more
conveniently.

Regarding numbers, you need to be aware that implicit casting does not
exist in CX. This means that the number `34` cannot be assigned to a
variable of type *i64*. In order to assign it, you need to either
parse it using the native function `i32.i64` or you can create a
64-bit integer literal. To create a number literal of a type other
than *i32*, you can use different suffixes: `B`, `L` and `D`, for
*byte*, *i64* (long) and *f64*, respectively. So, assuming `foo` is of
type *i64*, you can do this assignment: `foo = 34L`.

### Variables

When CX compiles a program, it knows how many bytes need to be
reserved in the stack for each of the functions. CX can know this
thanks to variable declarations.


``` go
package main

type Point struct {
    x i32
    y i32
}

func foo (inp Point) {
    var test1 i64
    var test2 bool
}

func main () {
    var test3 i32
    var test4 f32
}
```

The two functions declared in the example above are going to reserve 17
and 8 bytes in the stack, respectively. In the case of the first
function, `foo` needs to reserve space for an input parameter of type
`Point`, which requires 8 bytes (because of the two *i32* fields), and
two local variables: one 64-bit integer that requires 8 bytes and a
Boolean that requires a single byte. In the case of `main`, CX needs
to reserve bytes for two local variables: a 32-bit integer and a
single-precision floating point number, where each of them require 4
bytes.

``` go
package main

var global1 i32

func main () {
    var local i32
}
```

Local variables are different than global variables. In order for
globals to have a global scope they need to be allocated in a
different memory segment than local variables. This different memory
segment does not shrink or get bigger like the stack. This means that
any global variable is going to be kept "alive" as long as the program
keeps being executed.

A global scope means that variables of this type are accessible to any
function declared in the same package where the variable is declared,
and to any function of other packages that are importing this package.

``` go
package main

func main () {
    var foo i32
    i32.print(foo) // prints 0
}
```

In CX every variable is going to initially point to a *nil*
value. This *nil* value is basically a series of one or more zeroes,
depending on the size of the data type of a given variable. For
example, in the code above we see that we have declared a variable of
type *i32* and we immediately print its value without initializing
it. This CX program will print 0, as the value of `foo` is `[0 0 0 0]`
in the stack (4 zeroes, as a 32-bit integer is represented by 4
bytes).

In the case of data types that point to variable-sized
structures, such as slices or character strings, these are initialized
to a nil pointer, which is represented by 4 zeroed bytes. This nil
pointer is located in the heap memory segment, instead of the stack.

### Primitive types

There are seven primitive types in CX: *bool*, *str*, *byte*, *i32*,
*i64*, *f32*, and *f64*. These types can be used to construct other
more complex types, as will be seen in the next sections.

*bool* and *byte* both require a single byte to represent their
 values. In the case of *bool*, there are only two possible values:
 `true` or `false`. In the case of *byte* you can represent up to 256
 values, which range from 0 to 255. Next in size, we have *i32* and
 *f32* , where both of them require 4 bytes, and then we have *i64*
 and *f64*, which require 8 bytes each.

Now, strings are special as they are static and dynamic sized at the
same time. If you have a look at how a variable of type *str* reserves
memory in the stack, you'll see that it requires 4 bytes, regardless
of what text it's pointing to. The explanation behind this is that any
*str* in CX actually behaves like a pointer behind the scenes, and the
actual string gets stored in the heap memory segment.

``` go
package main

func main () {
	var foo str

	foo = str.concat("Hello, ", "World!")
	foo = "Hi"
}
```

When CX compiles the example above, three strings are first stored in
the data memory segment (just like global variables, as these strings
are constants, memory-wise): `"Hello, "`, `"World"` and `"Hi"`. When
the program is executed, `str.concat` is called, which creates a new
string by concatenating `"Hello, "` and `"World!"`, and this new
character string is allocated in the heap memory segment. Then `foo`
is assigned only the address of this new character string. Then we
immediately re-assign `foo` with the address of `"Hi"`. This means
that `foo` was first assigned a memory address located in the data
memory segment, and then it was assigned an address located in the
heap.

### Arrays

Arrays, as in other programming languages, are used to create
collections of data structures. These data structures can be primitive
types, custom types or even arrays or slices.


``` go
package main

type Point struct {
    x i32
    y i32
}

func main () {
    var [5]i32
    var [5]Point
}
```

In the example above, we're creating two arrays, one of a primitive
type and the other one of a custom type. CX reserves memory for these
arrays in the stack as soon as the function that contains them is
called. In this case, 60 bytes are going to be reserved for `main` as
soon as the program starts its execution, as `main` acts as the
program's entry point. You need to be careful with arrays, as those
can easily fill up your memory, especially with multi-dimensional
arrays (or matrices).

Also, another point to consider is performance. While accessing arrays
is almost as fast as accessing an atomic variable, arrays can be
troublesome when being sent/received as to/from functions. The reason
behind this is that an array needs to be copied whenever it is sent to
another function. If you're working with arrays of millions of
elements and you need to be sending that arrays millions of times to
another function, it's going to impact your program's performance a
lot. A way to avoid this is to either use pointers to arrays or slices.

### Slices

Dynamic arrays don't exist in CX. This means that the following
code is not a valid CX program:

``` go
package main

func main () {
    var size i32
    size = 13
    var arr [size] // this is not valid
}
```

If you need an array that can grow in size as required, you need to
use slices. Behind the scenes, slices are just arrays with some extra
features. First of all, any slice in CX goes directly to the heap, as
it's a data structure that is going to be changing in size. In
contrast, arrays are always going to be stored in the stack, unless
we're handling pointers to arrays. However, this behavior may change
in the future, when CX's escape analysis mechanism improves (for
example, the compiler can determine if an array is never going to change
its size, and decide to keep it in the stack).

The second characteristic of slices in CX is how they change their
size. Any slice, when it's first declared, starts with a size and
capacity of 0. The size represents how many elements are in a given
slice, while the capacity represents how many elements can be
allocated in that slice without having to be relocated in the heap.

``` go
package main

func main () {
	var slc []i32

	slc = append(slc, 1)
	slc = append(slc, 2)
	slc = append(slc, 3)
	slc = append(slc, 4)
}
```

In the code above we can see how we declare a slice and then we
initialize it using the `append`function. After all the `append`s,
we'll end up with a slice of size 4 and capacity 4, and this
`append`ing process will create the following objects in the heap:

``` go
[0 0 0 0 0 12 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 16 0 0 0 2 0 0 0 2 0 0 0 1 0 0 0 2 0 0 0 0 0 0 0 0 24 0 0 0 4 0 0 0 4 0 0 0 1 0 0 0 2 0 0 0 3 0 0 0 4 0 0 0]
```

First, the slice `slc` starts with 0 objects in it; it is pointing to
*nil*. Then, after the first `append`, the object
`[0 0 0 0 0 12 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0]` is allocated to the
heap. The first five bytes are used by CX's garbage collector. The
next 4 bytes indicate the size of the object, and the remaining bytes
are the actual slice `slc`. The first four bytes of `slc` tell us its
current size, while the next four tell us its capacity. The remaining
bytes of this object are the elements of the slice.

The following object,
`[0 0 0 0 0 16 0 0 0 2 0 0 0 2 0 0 0 1 0 0 0 2 0 0 0]`, shows now a
size of 2 and a capacity of 2, with the 32-bit integers `1` and `2` as
its elements. The last object, `0 0 0 0 0 24 0 0 0 4 0 0 0 4 0 0 0 1 0
0 0 2 0 0 0 3 0 0 0 4 0 0 0`, needs careful attention. We can see that
our objects jumped from size 1 to 2 and finally 4. The same happened
to its capacity, and the containing elements are now `1`, `2`, `3` and
`4`. What happened to the slice of size 3 and capacity 3? First of
all, capacities are increased by getting doubled each time the size of
an object is greater than its capacity, so we would never get a slice
of capacity 4 by following this method. Next, we need to think on what
is capacity used for.

Slices are just arrays, which means that they can't be resized. The
dynamic nature of slices is emulated by copying the *full* slice to
somewhere else in memory, but with a greater capacity. However, this
will only happen if adding a new element to the existing slice would
overflow it. This is why slices keep track of two metrics: *size* and
*capacity*, i.e. how many actual elements are in the slice, and how
many elements the currently allocated slice can hold, respectively.

``` go
package main

func main () {
    var arr1 [1]i32
    arr1[0] = 1 // add the first value
    
    var arr2 [2]i32 // double the size
    arr2[0] = arr1[0] // copy previous array
    arr2[1] = 2 // add the second value

    var arr3 [4]i32 // double the size
    arr3[0] = arr2[0] // copy previous array
    arr3[1] = arr2[1] // copy previous array
    
    arr3[2] = 3 // add the third value
    arr3[3] = 4 // add the fourth value
}
```

The example above shows the behavior of the slice in the previous
example, but using arrays.

### Structures

Structures are CX's mechanism for creating custom types, as in many other
C-like languages. Structures are basically a grouping of other
primitive or custom types (called *fields*) that together create
another type of data structure. For example, a *point* can be defined
by its coordinates in a two-dimensional space. In order to create a
type `Point`, you can use a structure that contains two fields of type
*i32*, one for `x` and another for `y`, as in the example below.


``` go
package main

type Point struct {
	x i32
	y i32
}

func main () {
	var p Point
	p.x = 10
	p.y = 20
}
```

Whenever an instance of a structure is created by either declaring a
variable of that type or by creating a literal of that type, CX
reserves memory to hold space for all the fields defined in the
structure declaration. Like in C, the bytes are reserved depending on
the order of the fields in the structure declaration.

``` go
package main

type struct1 struct {
	field1 bool
	field2 i32
	field3 i64
}

type struct2 struct {
	field1 i64
	field2 bool
	field3 i32
}

func main () {
	var s1 struct1
	var s2 struct2
}
```

For example, in the code above a call to `main` will reserve a total
of 26 bytes in the stack. In the case of the first struct instance,
the first byte is going to represent `field1` of type *bool*, the next
four bytes are going to represent `field2` of type *i32*, and the
final 8 bytes are going to represent `field3` of type *i64*. In the
case of the next struct instance, the first eight bytes represent an
*i64* field so, although both struct instances contain the same number
of fields and of the same type, the byte layout changes.

### Pointers

Sometimes it's useful to pass variables to functions by reference
instead of by value.

``` go
package main
import "time"

func foo (nums [100][100]i32) {
	// do something with nums
}

func main () {
	var start i64
	var end i64
	var nums [100][100]i32

	start = time.UnixMilli()
	
	for c := 0; c < 10000; c++ {
		foo(nums)
	}

	end = time.UnixMilli()

	printf("elapsed time: \t%d milliseconds\n", end - start)
}
```

The example above is very inefficient, as CX is going to be sending a
10,000 element matrix to `foo` 10,000 times. Every time `foo` is
called, every byte of that matrix needs to be copied for `foo`. In my
computer the example above takes around 638 milliseconds to run.

``` go
package main
import "time"

func foo (nums *[100][100]i32) {
	// do something with nums
}

func main () {
	var start i64
	var end i64
	var nums [100][100]i32

	start = time.UnixMilli()
	
	for c := 0; c < 10000; c++ {
		foo(&nums)
	}

	end = time.UnixMilli()

	printf("elapsed time: \t%d milliseconds\n", end - start)
}
```

A new version of the last program is shown above. In contrast to the
last program, the code above sends a pointer to the matrix to
`foo`. A pointer in CX uses only 4 bytes (in the future, pointers will
use 8 bytes in 64-bit systems and 4 bytes in 32-bit systems), so
instead of copying 10,000 bytes, we only copy 4 bytes to `foo` every
time we call it. This version of the program takes only 3 milliseconds
to run in my computer.

``` go
package main

func foo (inp i32) {
	inp = 10
}

func main () {
	var num i32
	num = 15
	i32.print(num) // prints 15
	foo(num)
	i32.print(num) // prints 15
}
```

In the example above, we send`num` to `foo`, and then we re-assign
the input's value to `10`. If we print the value of `num` before and
after calling `foo`, we can see that in both instances `15` will be
printed to the console.

``` go
package main

func foo (num *i32) {
	*num = 10
}

func main () {
	var num i32
	num = 15
	i32.print(num) // prints 15
	foo(&num)
	i32.print(num) // prints 10
}
```

The code above is a pointer-version of the previous example. In this
case, instead of sending `num` by value, we send it by reference,
using the `&` operator. `foo` also changed, and it now accepts a
pointer to a 32-bit integer, i.e. `*i32`. After running the example,
you'll notice that, this time, `foo` is now changing `num`'s value.

### Escape Analysis

Consider the following example:

``` go
package main

func foo () (pNum *i32) {
	var num i32
	num = 5 // this is in the stack

	pNum = &num
}

func stackDestroyer () {
	var arr [5]i32
}

func main () {
	var pNum *i32
	pNum = foo()

	stackDestroyer()
	
	i32.print(*pNum)
}
```

If we store `foo`'s `num`'s value (`5`) in the stack, and then we call
`stackDestroyer`, isn't `arr` going to overwrite the bytes storing the
`5`? This doesn't happen, because that `5` is now in the heap. But
this doesn't mean that any value being pointed to is going to be moved
to the heap. For example, let's re-examine one of the examples
presented in the *Pointers* section:

``` go
package main

func foo (num *i32) {
	*num = 10
}

func main () {
	var num i32
	num = 15
	i32.print(num) // prints 15
	foo(&num)
	i32.print(num) // prints 10
}
```

If any value being pointed to by a pointer was sent to the heap, we
wouldn't be able to change `num`s value, which is stored in the stack;
we would be changing the heap's copied value.

``` go
package main

func foo () (pNum *i32) {
	var num i32
	var pNum *i32

	num = 5

	pNum = &num
}

func main () {
	var pNum *i32
	pNum = foo()

	i32.print(*pNum) // prints 5, which is stored in the heap
}
```

Basically, in order to fix this problem, whenever a pointer needs to
be returned from a function, the value it is pointing to "escapes" to
the heap. In the example above, we can see that `num`'s value is going
to be preserved by escaping to the heap, as we are returning a pointer
to it from `foo`.

``` go
package main

func foo () (pNum *i32) {
	var num i32
	var pNum *i32

	num = 5 // this is in the stack

	pNum = &num // the pointer will be returned, so the value is sent to the heap
}

func stackDestroyer () {
	var arr [5]i32
}

func main () {
	var pNum *i32
	pNum = foo()
	stackDestroyer() // if 5 does not escape, it would be destroyed by this function

	i32.print(*pNum) // prints 5, which is stored in the heap
}
```

We can check this behavior even further in the example above. After
calling `foo`, we call `stackDestroyer`, which overwrites the
following 20 bytes after `main`'s stack frame. Yet, when we call
`i32.print(*pNum)`, we'll see that we still have access to a `5`. This
`5` is not the one created in `foo`, though, but a copy of it that was
allocated in the heap.

## Control Flow

Once we have the appropriate data structures for our program, we'll
now need to process them. In order to do so, we need to have access to
some control flow structures.

### Functions

Functions are used to encapsulate routines that we plan to be
frequently calling. In addition to encapsulating a series of
expressions and statements, we can also receive input parameters and
return output parameters, just like mathematical functions.

``` go
package main

func main () {
	var players []str
	players = []str{"Richard", "Mario", "Edward"}

	str.print("=======================")
	str.print(str.concat("Name: \t", players[0]))
	str.print("=======================")

	str.print("=======================")
	str.print(str.concat("Name: \t", players[1]))
	str.print("=======================")

	str.print("=======================")
	str.print(str.concat("Name: \t", players[2]))
	str.print("=======================")
}
```

For example, if we see the code above we'll notice that it seems
repetitive. We can fix this by creating a function, as seen in the
example below.


``` go
package main

func drawBox (player str) {
	str.print("=======================")
	str.print(str.concat("Name: \t", player))
	str.print("=======================")
}

func main () {
	var players []str
	players = []str{"Richard", "Mario", "Edward"}

	drawBox(players[0])
	drawBox(players[1])
	drawBox(players[2])
}
```

### Methods

Methods are useful when we want to associate a particular function to
a particular custom type (associating functions to primitive types is
not allowed). This allows us to create more readable code.

``` go
package main

type Player struct {
	Name str
	HP i32
	Mana i32
	Lives i32
}

type Monster struct {
	Name str
	HP i32
	Mana i32
}

func (player Player) draw () {
	str.print(sprintf("\n\tName: \t%s\n\tHP: \t%d\n\tMana: \t%d\n\tLives: \t%d\n\n%s",
		player.Name,
		player.HP,
		player.Mana,
		player.Lives,
		`
─▄████▄▄░
▄▀█▀▐└─┐░░
█▄▐▌▄█▄┘██
└▄▄▄▄▄┘███
██▒█▒███▀`))
}

func (monster Monster) draw () {
	str.print(sprintf("\n\tName: \t%s\n\tHP: \t%d\n\tMana: \t%d\n\n%s",
		monster.Name,
		monster.HP,
		monster.Mana,
		`
╲╲╭━━━━╮╲╲
╭╮┃▆┈┈▆┃╭╮
┃╰┫▽▽▽▽┣╯┃
╰━┫△△△△┣━╯
╲╲┃┈┈┈┈┃╲╲
╲╲┃┈┏┓┈┃╲╲
▔▔╰━╯╰━╯▔▔`))
}

func main () {
	var player Player
	player.Name = "Mario"
	player.HP = 10
	player.Mana = 10
	player.Lives = 3
	
	player.draw()

	var monster Monster
	monster.Name = "Domo-kun"
	monster.HP = 7
	monster.Mana = 4

	monster.draw()
}
```

The example above shows us how we can create two versions of the
function `draw`, and the behavior of each depends on the custom type
that we're using to call it.

### If and if/else

*if* and *if/else* statements are used to execute a block of
 instructions only if certain condition is true or false. Behind the
 scenes, *if* and *if/else* statements are parsed to a series of
 `jmp` instructions internally. For example, in the case of an *if*
 statement, we will jump *0* instructions if certain predicate is
 true, and it will jump *n* instructions if the predicate is false,
 where *n* is the number of instructions in the *if* block of
 instructions.

``` go
package main

func main () {
	if true {
		str.print("hi")
	}
	str.print("bye")
}
```

``` go
Program
0.- Package: main
	Functions
		0.- Function: main () ()
			0.- Expression: jmp(true bool)
			1.- Expression: str.print("" str)
			2.- Expression: jmp(true bool)
			3.- Expression: str.print("" str)
		1.- Function: *init () ()
```

In the two code snippets above we can see how an if statement is
translated by the parser to a set of two `jmp` instructions. These
`jmp` instructions have some meta data in them that is not shown in
the second snippet: how many lines to jump if its predicate is true
and how many lines to jump if the predicate is false. `jmp` is
not meant to be used by CX programmers (it's only part of the CX base
language), so you don't need to worry about it.

``` go
package main

type Player struct {
	Name str
	HP i32
	Mana i32
	Lives i32
}

type Monster struct {
	Name str
	HP i32
	Mana i32
}

func main () {
	var player Player
	player.Name = "Mario"
	player.HP = 10
	player.Mana = 10
	player.Lives = 3
	
	var monster Monster
	monster.Name = "Domo-kun"
	monster.HP = 7
	monster.Mana = 4

	if player.HP < 5 {
		str.print("===DANGER!===")
	} else {
		str.print("===YOU CAN DO IT!===")
	}

	if monster.HP < 10 {
		str.print(sprintf("===%s is bleeding!===", monster.Name))
	}

	if monster.HP < 5 {
		str.print(sprintf("===%s is dying!===", monster.Name))
	}

	if monster.HP == 0 {
		str.print(sprintf("===%s is dead!===", monster.Name))
	}
}
```

Continuing with the example from the previous section (to some
extent), let's use *if* and *if/else* statements to determine what
messages are going to be displayed to the user. These messages
represent the state of the player or the monster, depending on their
hit points (HP).

### For loop

The *for* loop is the only looping mechanism in CX. Just like *if* and
*if/else* statements are constructed using `jmp` statements, *for*
loop statements are also constructed the same way.

``` go
package main

func main () {
	for c := 0; c < 10; c++ {
		i32.print(c)
	}
}
```

``` go
Program
0.- Package: main
	Functions
		0.- Function: main () ()
			0.- Declaration: c i32
			1.- Expression: c i32 = identity(0 i32)
			2.- Expression: *lcl_0 bool = lt(c i32, 10 i32)
			3.- Expression: jmp(*lcl_0 bool)
			4.- Expression: i32.print(c i32)
			5.- Declaration: c i32
			6.- Expression: c i32 = i32.add(c i32, 1 i32)
			7.- Expression: jmp(true bool)
		1.- Function: *init () ()
```

The code snippets above illustrate how a *for* loop that counts from 0
to 9 is translated to a set of of `jmp` instructions.

``` go
package main

type Player struct {
	Name str
	HP i32
	Mana i32
	Lives i32
}

type Monster struct {
	Name str
	HP i32
	Mana i32
}

func (player Player) draw () {
	str.print(sprintf("\n\tName: \t%s\n\tHP: \t%d\n\tMana: \t%d\n\tLives: \t%d\n\n%s",
		player.Name,
		player.HP,
		player.Mana,
		player.Lives,
		`
─▄████▄▄░
▄▀█▀▐└─┐░░
█▄▐▌▄█▄┘██
└▄▄▄▄▄┘███
██▒█▒███▀`))
}

func (monster Monster) draw () {
	str.print(sprintf("\n\tName: \t%s\n\tHP: \t%d\n\tMana: \t%d\n\n%s",
		monster.Name,
		monster.HP,
		monster.Mana,
		`
╲╲╭━━━━╮╲╲
╭╮┃▆┈┈▆┃╭╮
┃╰┫▽▽▽▽┣╯┃
╰━┫△△△△┣━╯
╲╲┃┈┈┈┈┃╲╲
╲╲┃┈┏┓┈┃╲╲
▔▔╰━╯╰━╯▔▔`))
}

func (player Player) attack (cmd str, monster *Monster) {
	if bool.or(cmd == "M", cmd == "m") {
		var dmg i32
		dmg = i32.rand(1, 4)
		(*monster).HP = (*monster).HP - dmg
		printf("'%s' suffered a magic attack. Lost %d HP. New HP is %d\n", (*monster).Name, dmg, (*monster).HP)
	} else {
		var dmg i32
		dmg = i32.rand(1, 2)
		(*monster).HP = (*monster).HP - dmg
		printf("'%s' suffered a physical attack. Lost %d HP. New HP is %d\n", (*monster).Name, dmg, (*monster).HP)
	}
}

func (monster Monster) attack (cmd str, player *Player) {
	var dmg i32
	dmg = i32.rand(1, 5)
	(*player).HP = (*player).HP - dmg

	printf("'%s' suffered a physical attack. Lost %d HP. New HP is %d\n", (*player).Name, dmg, (*player).HP)
}

func battleStatus (player Player, monster Monster) {
	if player.HP < 5 {
		str.print("===DANGER!===")
	} else {
		str.print("===YOU CAN DO IT!===")
	}

	if player.HP == 0 {
		str.print("===YOU DIED===")
	}

	if monster.HP < 10 && monster.HP >= 5 {
		str.print(sprintf("===%s is bleeding!===", monster.Name))
	}

	if monster.HP < 5 && monster.HP > 0 {
		str.print(sprintf("===%s is dying!===", monster.Name))
	}

	if monster.HP <= 0 {
		str.print(sprintf("===%s is dead!===", monster.Name))
	}
}

func main () {
	var player Player
	player.Name = "Mario"
	player.HP = 10
	player.Mana = 10
	player.Lives = 3

	var monster Monster
	monster.Name = "Domo-kun"
	monster.HP = 7
	monster.Mana = 4

	player.draw()
	monster.draw()
	
	for true {
		if player.HP < 1 || monster.HP < 1 {
			return
		}
		
		printf("Command? (M)agic; (P)hysical; (E)xit\t")
		var cmd str
		cmd = read()

		if cmd == "E" || cmd == "e" {
			return
		}

		player.draw()
		monster.draw()

		player.attack(cmd, &monster)
		monster.attack(cmd, &player)
		battleStatus(player, monster)
	}
}
```

Lastly, we can see how we use a *for* loop to create something similar
to a REPL for the program that we have been building in the last few sections.

### Go-to

The last control flow mechanism is *go-to*, which is achieved through
the `goto` statement.


``` go
package main

func main () (out i32) {
beginning:
	printf("What animal do you like the most: (C)at; (D)og; (P)igeon\n")

	var cmd str
	cmd = read()
	
	if cmd == "C" || cmd == "c" {
		goto cat
	}

	if cmd == "D" || cmd == "d" {
		goto dog
	}

	if cmd == "P" || cmd == "p" {
		goto pigeon
	}

cat:
	str.print("meow")
	goto beginning
dog:
	str.print("woof")
	goto beginning
pigeon:
	str.print("tweet")
	goto beginning
}
```

The program above creates an infinite loop by using `goto`s. The loop
will keep asking the user to input commands, and will jump to certain
expression depending on the command.

## Affordances

![CX Affordances](../img/affordances.png)


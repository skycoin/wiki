# Syntax

In this section, we're going to have a look at how a CX program looks
like. Basically, the following sections are not going to discuss about
the logic behind the various CX constructs, i.e. how they
behave; we're only going to see how they look like.

## Comments

Some of the code snippets that follow have comments in them, i.e.,
blocks of text that are not actually "run" by the CX compiler or
interpreter. Just like in C, Golang and many other programming
languages, single line comments are created by placing double slashes
(//) before the text being commented. For example:

``` go
// Example of adding two 32 bit integers in CX

i32.add(3, 4)       // This will be ignored

// End of the program
```

Mult-line comments are opened by writing slash-asterisk (/\*), and are
closed by writing asterisk-slash (\*/).

``` go
/* This code won't be executed
str.print("Hello world!")
*/
```

## Declarations

A declaration refers to a *named* element in a program's
structure, which are described using other constructs, such as
expressions and other statements. For example: a function can be
referred by its name and it's constructed by expressions and local
variable declarations.

### Allowed Names

Any name that satisfies the PCRE regular expression
`[_a-zA-Z][_a-zA-Z0-9]*` is allowed as an identifier for a declared
element. In other words, an identifier can start with an underscore
(*_*) or any lowercase or uppercase letter, and can be followed by 0
or more underscores or lowercase or uppercase letters, and any number
from 0 to 9.

### Strict Type System

One of CX's goals is to provide a very strict type system. The purpose
of this is to reduce runtime errors as much as possible. In order to
achieve this goal, many of CX's native functions are constrained to a
single type signature. For example, if you want to add two 32-bit
integers, you'd need to use `i32.add`. In contrast, if you want to add
two 64-bit integers, you'd use `i64.add`. These functions can help the
programmer to ensure that a particular data type is being received or
sent during a process.

If the programmer doesn't want to use those type-specific functions,
CX still provides type inference in some cases. For example, instead
of writing `i32.add(5, 5)` you can just write `5 + 5`. In this case,
CX is going to see that you're using 32-bit integers, and the parser
is going to transform that expression to `i32.add(5, 5)`. However, if
you try to do `5 + 5L`, i.e. if you try to add a 32-bit integer to a
64-bit integer, CX will throw a compile-time error because you're
mixing types.

The proper way to handle types in CX is to explicitly parse
everything. This way one can be sure that you're always going to be
handling the desired type. So, retaking the previous example, you'd
need to parse one of them to match the other's type, either
`i32.i64(5) + 5L` or `5 + i64.i32(5L)`.

### Primitive Types

There are seven primitive types in CX: *bool*, *str*, *byte*, *i32*,
*i64*, *f32*, and *f64*. Those represent Booleans (*true*
or *false*), character strings, bytes, 32-bit integers, 64-bit
integers, single precision and double precision floating-point
numbers, respectively.

### Global variables

Global variables are different from local variables regarding
scope. Global variables are available to any function defined in a
package, and to any package that is importing the package that
contains that global declaration. An example of some global variables
is shown below.

``` go
package main

var global1 i32
var global2 i64

func foo () {
    i32.print(global1)
    i64.print(global2)
}

func main () {
    global1 = 5
    global2 = 5L

    i32.print(global1)
    i64.print(global2)
}
```

In the example above we can see that both the `main` and `foo`
functions are printing the values of the two global variables
defined. They are going to print the same values, as they are
referring to the same variables.

### Local variables

In contrast to global variables, local variables are constrained to
the function where they are declared. This means that is not possible
for another function to call a variable defined in another function.

``` go
package main

func foo () {
	i32.print(local) // this expression will throw a compile-time error
}

func main () {
	var local i32
	local = 5

	i32.print(5)
	foo()
}
```

If you try to run the example above, CX will throw an error similar to
this: `error: examples/testing.cx:4 identifier 'local' does not
exist`, so CX will not even try to run that program. If we could
de-activate CX's compile-time type checking, and the program above
could make it to the runtime, CX would not print 5 when running
`foo()`, as that function is unaware of that variable.

### Arrays

Arrays (or vectors) and multi-dimensional arrays (or matrices) can be
declared using a syntax similar to C's.

``` go
package main

type Point struct {
    x i32
    y i32
}

func main () {
    var arr1 [5]i32
    var arr2 [5]Point
    var arr3 [2][2]f32

    arr1[0] = 10
    arr2[1] = 20
}
```

In the example above we see the declaration of an array of 5 elements
of type *i32*, followed by an array of the same cardinality but of
type *Point*, which is a custom type. Custom types are discussed in a
later section. Lastly, we see an example of a 2x2 matrix of type
*f32*.

Lastly, we can see how we can initialize an array using the bracket
notation, e.g. `arr1[0] = 10`.

### Slices

Golang-like slices exist in CX (dynamic arrays). Slices are declared
similarly to arrays, with the only difference that the size is
omitted.

``` go
package main

type Point struct {
    x i32
    y i32
}

func main () {
    var slc1 []i32
    var slc2 []Point
    var slc3 [][]f32
}
```

Slices, unlike arrays, cannot be directly initialized using the
bracket notation (unless you use the native function `make`
first). You can use the bracket notation to reassign values to a
slice, once an element associated to the index that you want to use
already exists, as shown in the example below.

``` go
package main

func main () {
    var slc []i32

    slc = append(slc, 1)
    slc = append(slc, 2)

    slc[0] = 10
    slc[2] = 30 // This is not allowed, as len(slc) == 2, not 3
}
```

As this behavior is more related to the logic behind slices, it is
further explained in the *Runtime->Data Structures->Slices* section.

### Literals

A literal is any data structure that is not being referenced by any
variable yet. For example: `1`, `true`, `[]i32{1, 2, 3}`, `Point{x:
10, y: 20}`.

Particularly, it is worth noting the cases of array, slice and struct
literals.

``` go
package main

type Point struct {
    x i32
    y i32
}

func main () {
    var a Point
    var b [5]i32
    var c []i32
    
    a = Point{x: 10, y: 20}
    b = [5]i32{1, 2, 3, 4, 5}
    c = []i32{100, 200, 300}
}
```

In the example above we can see examples of struct (`Point{x: 10,
y: 20}`), array (`[5]i32{1, 2, 3, 4, 5}`), and slice (`[]i32{100, 200, 300}`)
literals, in that order. These literals exist to simplify the creation
of such data structures.

### Functions

Functions in CX are similar in syntax to functions in Go. The only
exception is that named outputs are enforced at the moment (this will
most likely change in the future).

``` go
package main

func foo () {

}

func main () {
	foo()
}
```

The example above doesn't do anything, but it illustrates the anatomy
of a function. In the case of `foo`, we have an empty function
declaration, and then we have `main`, which is defined by a single
call to `foo`. Functions can also receive inputs and return outputs,
as in the example below.

``` go
package main

func foo (in i32) {
    i32.print(in) // this will print 5
}

func bar () (out i32){
    out = 10
}

func main () {
    foo(5)

    var local i32
    local = bar()
    i32.print(local) // this will print 10
}
```

In this case, `foo` is declared to receive one input parameter, and
`bar` is declared to return one output parameter.

### Custom Types

If primitive types are not enough, you can define your own custom
types by combining the primitive types and other constructs like
slices, arrays, and even other custom types.

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

    printf("Point coordinates: (%d, %d)\n", p.x, p.y)
}
```

In the example above, we can see a custom type that defines a
*Point* as the combination of two 32-bit integers (*i32*). After
declaring the custom type, you can start declaring variables of that
type anywhere in the package where it was declared in. The code in
`foo` shows how you can create and use an instance of that structure.

### Methods

A variation of functions that are associated to custom types are
*methods*.

``` go
package main

type Point struct {
	x i32
	y i32
}

type Line struct {
	a Point
	b Point
}

func (p Point) print () {
	printf("Point coordinates: (%d, %d)\n", p.x, p.y)
}

func (l Line) print () {
	printf("Line point A: (%d, %d), Line point B: (%d, %d)\n", l.a.x, l.a.y, l.b.x, l.b.y)
}

func main () {
	var l Line
	var p1 Point
	var p2 Point
	
	p1.x = 10
	p1.y = 20
	p2.x = 11
	p2.y = 21

	l.a = p1
	l.b = p2

	p1.print()
	p2.print()
	l.print()
}
```

In the example above, we define two custom types: *Point* and
*Line*. The type line is defined by two fields of type
*Point*, and the type *Point* is defined as coordinate defined by two
fields of type *i32*.

As a simple example, we create two methods called `print`, one for the
type *Point* and another for the type *Line*. In the case of
`Point.print`, we just print the two coordinates, and in
the case of `Line.print` we print the coordinates of the two points
that define the *Line* instance.

### Packages

In the previous examples we have always been using a single package:
`main`. If your program grows too large it's convenient to divide your
code into different packages.


``` go
package foo

func fn (in i32) {
    i32.print(in)
}

package bar

func fn () (out i32) {
    out = 5
}

package main
import "foo"
import "bar"

func main () {
    foo.fn(10) // prints 10

    var num i32
    num = bar.fn()

    i32.print(num) // prints
}
```

In the example above, we can see how two functions with the same name
(`fn`) are declared, each in a separate package. Both of these
functions have different signatures, as `foo.fn` accepts a single
input parameter and `bar.fn` doesn't accept any inputs but returns a
single output parameter.

We can then see how the `main` package `import`s both the `foo` and
`bar` packages, to later call each of these functions.

## Statements

Statements are different to declarations, as they don't create any
named elements in a program. They are used to control the flow of a
program.

### If and if/else

The most basic statement is the *if* statement, which is going to
execute a block of code only if a condition is true.

``` go
package main

func main () {
    if false {
        str.print("This will never print")
    }
}
```

The example above won't do anything, as the condition for the *if*
statement is always going to evaluate to *false*.

``` go
package main

func main () {
    if true {
        str.print("This will always print")
    }
}
```

In contrast, the example above will always print.

``` go
package main

func main () {
    if true {
        str.print("This will always print")
    } else {
        str.print("This will never print")
    }
}
```

Lastly, the example above shows how to write an *if/else* statement in CX.

As a note about its syntax, the predicates or conditions don't need to
be enclosed in parentheses, just like in Go.

### Else if

Instead of simply adding one alternative path, you can string together a series
of *else if* blocks, which check for as many different conditions as you like.
Giving you similar functionality as Go's *switch*/*select* blocks (containing
various conditions/cases).

``` go
package main

func main () {
   var i i32
   i = 0
   
   if i == 0 {
     str.print("i is 0")
   } else if i == 1 {
     str.print("i is 1")
   } else if i == 2 {
     str.print("i is 2")
   } else {
     str.print("i is NOT 0, 1 or 2")
   }
}
```

### For loop

CX's only looping statement is the *for* loop. Similar to Go, the
*for* loop in CX can be used as the *while* statement in other
programming languages, and as a traditional *for* statement.

``` go
package main

func main () {
	for true {
		str.print("forever")
	}
}
```

As the simplest example of a loop, we have the infinite loop shown in
the example above. In this case, the loop will print the character
string "forever" indefinitely. If you try this code, remember that you
can cancel the program's execution by hitting `Ctrl-C`.

``` go
package main

func main () {
	for str.eq("hi", "hi") {
		str.print("hi")
	}
}
```

The code above shows another example, one where we use an expression
as its predicate, rather than a literal `true` or `false`. It is worth
mentioning that you can replace `str.eq("hi", "hi")` by `"hi" == "hi"`.


``` go
package main

func main () {
	var c i32
	for c = 0 ; c < 10; c++ {
		i32.print(c)
	}
}
```

The traditional *for* loop shown in the example above. In languages
like C, you need to first declare your counter variable, and then you
have the option to initialize or reassign the counter in the first
part of the *for* loop. The second part of the *for* loop is reserved
for the predicate, and the last part is usually used to increment the
counter. Nevertheless, just like in C, there's nothing stopping you
from doing whatever you want in the first and last parts. However, the
predicate part needs to be an expression that evaluates to a Boolean.

``` go
package main

func main () {
	for c := 0; c < 10; c++ {
		i32.print(c)
	}
}
```

A more Go-ish way of declaring and initializing the counter is to use
an inline declaration, as seen in the example above.

``` go
package main

func main () {
	var c i32
	c = 0
	for ; c < 10; c++ {
		i32.print(c)
	}
}
```

Lastly, the for loop can also completely omit the initialization part,
as seen above.

### Goto

`goto` can be used to immediately jump the execution of a program to
the corresponding labeled expression.

``` go
package main

func main () (out i32) {
	goto label2
label1:
	str.print("this should never be reached")
label2:
	str.print("this should be printed")
}
```

In the example above, we see how a `goto` statement forces CX to
ignore executing the expression labeled as `label1`, and instead jumps
to the `label2` expression.

## Expressions

Expressions are basically function calls. But the term expression also
takes into consideration the variables that are receiving the
function's output arguments, the input arguments, and any dereference
operations.

``` go
package main

func foo () (arr [2]i32) {
    arr = [2]i32{10, 20}
}

func main () {
    i32.print(foo()[0])
}
```

For example, the expression `i32.print(foo()[0])` in the code above
consists of two function calls, and the array returned by the call
to `foo` is "dereferenced" to its *0th* element.

## Assignments and Initializations

As in many other C-like languages, assignments are done using the
equal (`=`) sign.

``` go
package main

func main () {
    var foo i32
    foo = 5
    foo = 50
}
```

In the case of the code above, the variable `foo` is declared and then
initialized to `5` using the `=` sign. Then we reassign the `foo`
variable to the value `50`.

``` go
package main

func main () {
    foo := 5
    foo = 50
}
```

As in other programming languages, *short variable declarations* exist
in CX. The `:=` token can be used to tell CX to infer a variable's
type. This way, CX declares and initializes at the same time, as seen
in the example above.

## Affordances

The affordance system in CX uses a special operator: `->`.  This
operator takes a series of statements that have the form of function
calls, and transforms them to a series of instructions that can be
internally interpreted by the affordance system.


``` go
package main

func exprPredicate (expr Expression) (res bool) {
	if expr.Operator == "i32.add" {
		res = true
	}
}

func prgrmPredicate (prgrm Program) () {
	if prgrm.FreeHeap > 50 {
		res = true
	}
}

func main () {
	num1 := 5
	num2 := 10
	
targetExpr:
	sum := i32.add(0, 0)
	
	tgt := ->{
		pkg(main)
		fn(main)
		expr(targetExpr)
	}

	fltrs := ->{
		filter(exprPredicate)
		filter(prgrmPredicate)
	}

	aff.print(tgt)
	aff.print(fltrs)

	affs := aff.query(fltrs, tgt)
	
	aff.on(affs, tgt)
	aff.of(affs, tgt)

	aff.inform(affs, 0, tgt)
	aff.request(affs, 0, tgt)
}
```

title=Midgard
tags=language, web assembly
summary=Programming language designed specifically for the WASM platform.
~~~~~~

[Source](https://github.com/gingerBill/Midgard)

Written in Odin.

## Example
```
import "foo"

const A = 123
var b isize = 123

const (
	C = 123 + 345
	D = 123
)
const FOO = 123

type (
	My_Int isize
	Int_Alias = isize
)

type My_Type struct {
	x i32
	y f32
	z, w, a bool
}


proc main() {
	print()
	print2(1234)
	print()
	print()
}

foreign "env" proc print()
foreign "env" proc print2(x f32)
// foreign "env" proc print3(i32)



// proc the_thing() {
// 	var x isize = 123
// 	type Foo struct {
// 		x i32
// 		y f32
// 		z, w, a bool
// 	}

// 	var cond = true

// 	print()

// 	if cond {
// 		for var i = 0; i < 10; i += 1 {

// 		}
// 	}

// 	proc foo() {
// 		var cond = false
// 		if cond {

// 		}
// 	}
// }
```


title=Nelua
tags=language, static
summary=Minimal, simple, efficient, statically typed, compiled, meta programmable, safe and extensible systems programming language with a Lua flavor.
~~~~~~

[Website](https://nelua.io/) | [Source](https://github.com/edubart/nelua-lang)

Nelua (stands for Native Extensible Lua) is a minimal, efficient, statically-typed and meta-programmable systems programming language heavily inspired by Lua, which compiles to C and native code.

Nelua is a systems programming language for performance-sensitive applications where Lua would not be efficient, such as operating systems, real-time applications and game engines. While it has syntax and semantics similar to Lua, it primarily focuses on generating efficient C code and provide support for highly-optimizable low-level programming. Using Nelua idioms such as records, arrays, manual memory management and pointers should result in performance as efficient as pure C; on the other hand, when using Lua idioms such as tables, metatables and untyped variables, the compiler will bake a runtime library for this sort of dynamic functionality into the program, which could incur some runtime overhead.

Nelua can do meta programming at compile time through preprocessor constructs written in Lua; since the compiler itself is also written in Lua, it means that user-provided preprocessor code can interact at any point with the compiler's internals and the source code's AST. Such system allows for ad-hoc implementation of high level constructs such as classes, generics and polymorphism, all without having to add them into the core specification, thus keeping the language simple, extensible and compact. The same way that Lua's object-oriented patterns are not built into the language, but can be nonetheless achieved through metatables, in Nelua you could yourself implement a similar functionality which is fully decided at compile time or dynamically dispatched at runtime.

Nelua can do extensible programming as the programmer may add extensions to the language such as new grammars, AST definitions, semantics, type checkers, code generation and behaviors to the compiler at compile time via the preprocessor.

Nelua provides support for both garbage-collected and manual memory management in a way that the developer can easily choose between either for each allocation in the program.

Nelua first compiles to C, then it executes a C compiler to produce native code. This way existing C code and libraries can be leveraged and new C libraries can be created. Another benefit is that Nelua can reach the same target platforms as C99 compilers, such GCC or Clang, while also enjoying state-of-the-art compiler optimizations provided by them.

The initial motivation for its creation was to replace C/C++ parts of projects which currently uses Lua with a language that has syntax and semantics similar to Lua, but allows for fine-grained performance optimizations and does not lose the ability to go low level, therefore unifying the syntax and semantics across both compiled and dynamic languages.

Goals

* Be minimal with a small syntax, manual and API, but powerful
* Be efficient by compiling to optimized C code then native code
* Have syntax, semantics and features similar to Lua
* Optionally statically typed with type checking
* Achieve classes, generics, polymorphism and other higher constructs by meta programming
* Have an optional garbage collector
* Make possible to create clean DSLs by extending the language grammar
* Make programming safe for non experts by doing run/compile-time checks and avoiding undefined behavior
* Possibility to emit low level code (C, assembly)
* Be modular and make users capable of creating compiler plugins to extended
* Generate readable, simple and efficient C code
* Possibility to output freestanding code (dependency free, for kernel dev or minimal runtime)
* No single memory management model, choose for your use case GC or manual

### Examples
[Overview](https://github.com/edubart/nelua-lang/blob/master/examples/overview.nelua):
```
require 'span'
require 'string'
require 'math'
require 'memory'
require 'allocators.gc'
require 'allocators.general'

do -- Comments
  -- one line comment
  --[[
    multi-line comment
  ]]
  --[=[
    multi line comment, `=` can be placed multiple times
    in case if you have `[[` `]]` tokens inside, it will
    always match it's corresponding token
  ]=]
end

do -- Variables
  local a = nil -- of deduced type 'any', initialized to nil
  local b = false -- of deduced type 'boolean', initialized to false
  local s = 'test' -- of deduced type 'string', initialized to 'test'
  local one = 1 --  of type 'integer', initialized to 1
  local pi: number = 3.14 --  of type 'number', initialized to 1
  print(a,b,s,one,pi) -- outputs: nil false test 1 3.1400000
end

do -- Type deduction
  local a -- type will be deduced and scope end
  a = 1
  a = 2
  print(a) -- outputs: 2
  -- end of scope, compiler deduced 'a' to be of type 'integer'
end

do -- Type collision
  local a -- a type will be deduced
  a = 2
  a = false
  print(a) -- outputs: false
  -- a is deduced to be of type 'any', because it could hold an 'integer' or a 'boolean'
end

do -- Zero initialization
  local a -- variable of deduced type 'any', initialized to 'nil'
  local i: integer -- variable of type 'integer', initialized to 0
  print(a, i) --outputs: nil 0
end

do -- Auto variables
  local a: auto = 1 -- a is deduced to be of type 'integer'

  -- uncommenting the following will trigger the compile error:
  --   error: in variable assignment: no viable type conversion from `boolean` to `int64`
  --a = false

  print(a) -- outputs: 1
end

do -- Comptime variables
  local a <comptime> = 1 + 2 -- constant variable evaluated and known at compile time
  print(a) -- outputs: 3
end

do -- Const variables
  local x <const> = 1
  local a <const> = x
  print(a) -- outputs: 1

  -- uncommenting the following will trigger the compile error:
  --   error: cannot assign a constant variable
  --a = 2
end

do -- Local symbol
  do
    local a = 1
    do
      print(a) -- outputs: 1
    end
  end
  -- this would trigger a compiler error because `a` is not visible:
  -- a = 1
end

--do -- Global symbols
  global global_a = 1
  global function global_f()
    return 'f'
  end
  -- require 'globals'
  print(global_a) -- outputs: 1
  print(global_f()) -- outputs: f
--end

do -- If
  local a = 1 -- change this to 2 or 3 to trigger other ifs
  if a == 1 then
    print 'is one'
  elseif a == 2 then
    print 'is two'
  else
    print('not one or two')
  end
end

do -- Switch
  local a = 1 -- change this to 2 or 3 to trigger other ifs
  switch a
  case 1 then
    print 'is 1'
  case 2 then
    print 'is 2'
  else
    print 'else'
  end
end

do -- Do
  do
    local a = 0
    print(a) -- outputs: 0
  end
  do
    local a = 1 -- can declare variable named a again
    print(a) -- outputs: 1
  end
end

do -- Defer
  do
    defer
      print 'world'
    end
    print 'hello'
  end
  -- outputs 'hello' then 'world'
end

do -- Goto
  local haserr = true
  if haserr then
    goto getout -- get out of the loop
  end
  print 'success'
  ::getout::
  print 'fail'
  -- outputs only 'fail'
end

do -- While
  local a = 1
  while a <= 5 do
    print(a) -- outputs 1 2 3 4 5
    a = a + 1
  end
end

do -- Repeat
  local a = 0
  repeat
    a = a + 1
    print(a) -- outputs 1 2 3 4 5
    local stop = a == 5
  until stop
end

do -- Numeric For
  for i=0,5 do
    -- i is deduced to 'integer'
    print(i) -- outputs 0 1 2 3 4 5
  end
end

do -- Numeric For Exclusive
  for i=0,<5 do
    print(i) -- outputs 0 1 2 3 4
  end
end

do -- Numeric For Stepped
  for i=5,0,-1 do
    print(i) -- outputs 5 4 3 2 1
  end
end

do -- Continue
  for i=1,10 do
    if i<=5 then
      continue
    end
    print(i) -- outputs: 6 7 8 9 10
  end
end

do -- Break
  for i=1,10 do
    if i>5 then
      break
    end
    print(i) -- outputs: 1 2 3 4 5
  end
end

do -- Boolean
  local a: boolean -- variable of type 'boolean' initialized to 'false'
  local b = false
  local c = true
  print(a,b,c) -- outputs: false false true
end

do -- Numbers
  local a = 1234 -- variable of type 'integer'
  local b = 0xff -- variable of type 'integer'
  local c = 3.14159 -- variable of type 'number'
  local d: integer
  print(a,b,c,d) -- outputs: 1234 255 3.141590 0

  do
    local a = 1234_u32 -- variable of type 'int32'
    local b = 1_f32 -- variable of type 'float32'
    print(a,b) --outputs: 1234 1.000000
  end
end

do -- String
  local mystr: string -- empty string
  local str1: string = 'my string' -- variable of type 'string'
  local str2 = "static stringview" -- variable of type 'stringview'
  local str3: stringview = 'stringview two' -- also a 'stringview'
  print(str1, str2, str3) -- outputs: "" "string one" "string two"
end

do -- The "type" type
  local MyInt: type = @integer -- a symbol of type 'type' holding the type 'integer'
  local a: MyInt -- variable of type 'MyInt' (actually an 'integer')
  print(a) -- outputs: 0
end

do -- Explicit type conversion
  local i = 1
  local f = (@number)(i) -- convert 'i' to the type 'number'
  print(i, f) -- outputs: 1 1.000000

  local MyNumber = @number
  local i = 1
  local f = MyNumber(i) -- convert 'i' to the type 'number'
  print(i, f) -- outputs: 1 1.000000
end

do print('Implicit type conversion')
  local i: integer = 1
  local u: uinteger = i
  print(u) -- outputs: 1

  local ni: integer = -1
  local nu: uinteger = (@uinteger)(ni) -- explicit cast works, no checks are done
  print(nu) -- outputs: 18446744073709551615
end

do -- Array
  local a: array(integer, 4) = {1,2,3,4}
  print(a[0], a[1], a[2], a[3]) -- outputs: 1 2 3 4

  local b: [4]integer -- "[4]integer" is syntax sugar for "array(integer, 4)"
  print(b[0], b[1], b[2], b[3]) -- outputs: 0 0 0 0
end

do -- Enum
  local Weeks = @enum {
    Sunday = 0,
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday
  }
  print(Weeks.Sunday) -- outputs: 0

  local a: Weeks = Weeks.Monday
  print(a) -- outputs: 1
end

do -- Any
  local a: any = 2 -- variable of type 'any', holding type 'integer' at runtime
  print(a) -- outputs: 2
  a = false -- now holds the type 'boolean' at runtime
  print(a) -- outputs: false
end

do -- Record
  local Person = @record {
    name: string,
    age: integer
  }

  -- typed initialization
  local a: Person = {name = "Mark", age = 20}
  print(a.name, a.age)

  -- casting initialization
  local b = (@Person){name = "Paul", age = 21}
  print(b.name, b.age)

  -- ordered fields initialization
  local c = (@Person){"Eric", 21}
  print(c.name, c.age)

  -- late initialization
  local d: Person
  d.name = "John"
  d.age  = 22
  print(d.name, d.age)
end

do -- Span
  local arr = (@[4]integer) {1,2,3,4}
  local s: span(integer) = &arr
  print(s[0], s[1]) -- outputs: 1 2
  print(#s) -- outputs 4
end

do -- Void
  local function f(): void end
end

do -- Operators
  print(2 ^ 2) -- pow, outputs: 4.000000
  print(5 // 2) -- integer division, outputs: 2
  print(5 / 2) -- float division, outputs: 2.500000
end

do -- Functions
  local function get(a)
    -- a is of type 'any'
    return a -- return is of deduced type 'any'
  end
  print(get(1)) -- outputs: 1

  local function add(a: integer, b: integer)
    return a + b -- return is of deduced type 'integer'
  end
  print(add(1, 2)) -- outputs 3
end

do -- Return type inference
  local function add(a: integer, b: integer): integer
    return a + b -- return is of deduced type 'integer'
  end
  print(add(1, 2)) -- outputs 3
end

do -- Recursive calls
  local function fib(n: integer): integer
    if n < 2 then return n end
    return fib(n - 2) + fib(n - 1)
  end
  print(fib(10)) -- outputs: 55
end

do -- Multiple returns
  local function get_multiple()
    return false, 1
  end

  local a, b = get_multiple()
  -- a is of type 'boolean' with value 'false'
  -- b is of type 'integer' with value '1'
  print(a,b)

  local function get_multiple(): (boolean, integer)
    return false, 1
  end

  local a, b = get_multiple()
  print(a,b) -- outputs: false 1
end

--do -- Top scope closures
  local counter = 1 -- 'a' lives in the heap because it's on the top scope
  local function increment() -- foo is a top scope closure
    -- counter is an upvalue for this function, we can access and modify it
    counter = counter + 1
  end
  print(counter) -- outputs 1
  increment()
  print(counter) -- outputs 2
--end

do -- Polymorphic functions
  local function add(a: auto, b: auto)
    return a + b
  end

  local a = add(1,2)
  -- call to 'add', a function 'add(a: integer, b: integer): integer' is defined
  print(a) -- outputs: 3
  local b = add(1.0, 2.0)
  -- call to 'add' with different types, function 'add(a: number, b: number): number' is defined
  print(b) -- outputs: 3.000000
end

do -- Record functions
  local Vec2 = @record{x: number, y: number}

  function Vec2.create(x: integer, y: integer): Vec2
    return (@Vec2){x, y}
  end

  local v = Vec2.create(1,2)
  print(v.x, v.y) -- outputs: 1 2
end

do -- Record methods
  local Rect = @record{x: number, y: number, w: number, h: number}

  function Rect:translate(x: number, y: number)
    self.x = self.x + x
    self.y = self.y + y
  end

  function Rect:area()
    return self.w * self.h
  end

  local v = Rect{0,0,2,3}
  v:translate(2,2)
  print(v.x, v.y) -- outputs 2 2
  print(v:area()) -- outputs 6
end

do -- Record metamethods
  local Vec2 = @record{x: number, y: number}

  -- Called on the binary operator '+'
  function Vec2.__add(a: Vec2, b: Vec2)
    return (@Vec2){a.x+b.x, a.y+b.y}
  end

  -- Called on the unary operator '#'
  function Vec2:__len()
    return math.sqrt(self.x*self.x + self.y*self.y)
  end

  local a: Vec2 = {1, 2}
  local b: Vec2 = {3, 4}
  local c = a + b -- calls the __add metamethod
  print(c.x, c.y) -- outputs: 4 6
  local len = #c -- calls the __len metamethod
  print(len) -- outputs: 7.2
end

do -- Dereferencing and referencing
  local a = 1
  local ap = &a -- ap is a pointer to a
  $ap = 2
  print(a) -- outputs 2
  a = 3
  print($ap) -- outputs 3
end

do -- Allocating memory
  local Person = @record{name: string, age: integer}
  local p: *Person = general_allocator:new(@Person)
  p.name = "John"
  p.age = 20
  print(p.name, p.age)
  general_allocator:delete(p)
  p = nilptr
end

do -- Preprocessor
  local a = 0
  ## for i = 1,4 do
    a = a + 1 -- unroll this line 4 times
  ## end
  print(a) -- outputs 4


  ##[[
  local something = false
  if something then
  ]]
    print('hello') -- prints hello when compiling with "something" defined
  ##[[ end ]]
end

do -- Emitting AST nodes
  local a = #[aster.Number{'dec','1'}]#
  print(a) -- outputs: 1
end

do -- Expression replacement
  local deg2rad = #[math.pi/180.0]#
  local hello = #['hello' .. 'world']#
  local mybool = #[false]#
  print(deg2rad, hello, mybool) -- outputs: 0.017453 helloworld false
end

do -- Name replacement
  local #|'my' .. 'var'|# = 1
  print(myvar) -- outputs: 1

  local function foo1() print 'foo' end
  #|'foo' .. 1|#() -- outputs: foo
end

do -- Macros
  ## function increment(a, amount)
    -- 'a' in the preprocessor context is a symbol, we access its name here
    -- 'amount' in the preprocessor context is a lua number
    #|a.name|# = #|a.name|# + #[amount]#
  ## end
  local x = 0
  ## increment(x, 4)
  print(x)

  -- unroll
  ##[[
  function unroll(count, block)
    for i=1,count do
      block()
    end
  end
  ]]

  local counter = 1
  ## unroll(4, function()
    print(counter) -- outputs: 1 2 3 4
    counter = counter + 1
  ## end)

  -- generic
  ## function Point(PointT, T)
    local #|PointT|# = @record { x: #|T|#, y: #|T|# }
    function #|PointT|#:squaredlength()
      return self.x*self.x + self.y*self.y
    end
  ## end

  ## Point('PointFloat', 'float64')
  ## Point('PointInt', 'int64')

  local pa: PointFloat = {x=1,y=2}
  print(pa:squaredlength()) -- outputs: 5

  local pb: PointInt = {x=1,y=2}
  print(pb:squaredlength()) -- outputs: 5.000000
end

do -- Preprocessor macros emitting AST nodes
  ##[[
  -- Create a fixed array initializing to 1,2,3,4...n
  local function create_sequence(attr_or_type, n)
    local type
    if traits.is_type(attr_or_type) then -- already a type
      type = attr_or_type
    elseif traits.is_attr(attr_or_type) then -- get a type from a symbol
      type = attr_or_type.value
    end
    -- check if the inputs are valid, in case wrong input
    static_assert(traits.is_type(type), 'expected a type or a symbol to a type')
    static_assert(traits.is_number(n) and n > 0, 'expected n > 0')
    -- create list of expression
    local exprs = {}
    for i=1,n do
      -- aster.value convert any Lua value to the proper ASTNode
      exprs[i] = aster.value(i)
    end
    -- create the Table ASTNode, it's used for any braces {} expression
    return aster.Table{exprs, pattr = {
      -- hint the compiler what type this braces should be evaluated
      desiredtype = types.ArrayType(type, #exprs)}
    }
  end
  ]]

  local a = #[create_sequence(integer, 10)]#
  assert(#a == 10 and a[0] == 1 and a[9] == 10)
end

do -- Processing on the fly
  local Weekends = @enum { Friday=0, Saturday, Sunday }
  ## for i,field in ipairs(Weekends.value.fields) do
    print(#[field.name .. ' ' .. tostring(field.value)]#)
  ## end

  local Person = @record{name: string}
  ## Person.value:add_field('age', primtypes.integer) -- add field 'age' to 'Person'
  local p: Person = {name='Joe', age=21}
  print(p.age) -- outputs '21'
end

do -- Preprocessing poly functions
  local function pow(x: auto, n: integer)
    ## static_assert(x.type.is_arithmetic, 'cannot pow variable of type "%s"', x.type)
    ## if x.type.is_integral then
      -- x is an integral type (any unsigned/signed integer)
      local r: #[x.type]# = 1
      for i=1,n do
        r = r * x
      end
      return r
    ## elseif x.type.is_float then
      -- x is a floating point type
      return x ^ n
    ## end
  end

  local a = pow(2, 2) -- use specialized implementation for integers
  local b = pow(2.0, 2) -- use pow implementation for floats
  print(a,b) -- outputs: 4 4.000000

  -- uncommenting the following will trigger the compile error:
  --   error: cannot pow variable of type "string"
  --pow('a', 2)
end

do -- Function annotations
  local function sum(a: integer, b: integer) <inline> -- C inline function
    return a + b
  end
  print(sum(1,2)) -- outputs: 3
end

do -- Variable annotations
  local a: integer <noinit>-- don't initialize variable to zero
  a = 0 -- manually initialize to zero
  print(a) -- outputs: 0

  local b <volatile> = 1 -- C volatile variable
  print(b) -- outputs: 1
end

do -- Mixing C code
  -- `cimport` informs the compiler the function name from C that should be imported
  -- `cinclude` informs the compiler which C header its declared
  -- `nodecl` informs the compiler that it doesn't need to declare it (C header already declares)
  local function malloc(size: usize): pointer <cimport'malloc',cinclude'<stdlib.h>',nodecl> end
  local function memset(s: pointer, c: int32, n: usize): pointer <cimport'memset',cinclude'<string.h>',nodecl> end
  local function free(ptr: pointer) <cimport'free',cinclude'<stdlib.h>',nodecl> end

  local a = (@*[10]int64)(malloc(10 * 8))
  memset(a, 0, 10*8)
  assert(a[0] == 0)
  a[0] = 1
  assert(a[0] == 1)
  free(a)
end
```

[Snakes (using SDL)](https://github.com/edubart/nelua-lang/blob/master/examples/snakesdl.nelua):
```
require 'math'

-- SDL2 Snake Game Demo
## linklib 'SDL2'

-- import SDL structures
local SDL_Event <cimport> = @record {
  type: uint32,
  padding: [56]byte
}
local SDL_Keysym <cimport> = @record {
  scancode: cint,
  sym: int32,
  mod: uint16,
  unused: uint32
}
local SDL_KeyboardEvent <cimport> = @record {
  type: uint32,
  timestamp: uint32,
  windowID: uint32,
  state: uint8,
  repeated: uint8,
  padding: uint16,
  keysym: SDL_Keysym
}
local SDL_Rect <cimport> = @record {
  x: cint, y: cint,
  w: cint, h: cint,
}
local SDL_Window <cimport> = @record{}
local SDL_Renderer <cimport> = @record{}

-- import SDL constants
local SDL_INIT_VIDEO <comptime> = 0x20
local SDL_WINDOWPOS_UNDEFINED <comptime> = 0x1fff0000
local SDL_WINDOW_OPENGL <comptime> = 0x2
local SDL_QUIT <comptime> = 0x100
local SDL_KEYDOWN <comptime> = 0x300
local SDLK_RIGHT <comptime> = 79 | 0x40000000
local SDLK_LEFT <comptime> = 80 | 0x40000000
local SDLK_DOWN <comptime> = 81 | 0x40000000
local SDLK_UP <comptime> = 82 | 0x40000000
local SDL_RENDERER_ACCELERATED <comptime> = 0x2
local SDL_RENDERER_PRESENTVSYNC <comptime> = 0x4

-- import SDL functions
local function SDL_Init(flags: uint32): int32 <cimport> end
local function SDL_CreateWindow(title: cstring, x: cint, y: cint, w: cint, h: cint, flags: uint32): *SDL_Window <cimport> end
local function SDL_Quit() <cimport> end
local function SDL_DestroyWindow(window: *SDL_Window) <cimport> end
local function SDL_PollEvent(event: *SDL_Event): int32 <cimport> end
local function SDL_CreateRenderer(window: *SDL_Window, index: cint, flags: uint32): *SDL_Renderer <cimport> end
local function SDL_DestroyRenderer(renderer: *SDL_Renderer) <cimport> end
local function SDL_RenderPresent(renderer: *SDL_Renderer) <cimport> end
local function SDL_RenderClear(renderer: *SDL_Renderer) <cimport> end
local function SDL_SetRenderDrawColor(renderer: *SDL_Renderer, r: uint8, g: uint8, b: uint8, a: uint8): cint <cimport> end
local function SDL_RenderFillRect(renderer: *SDL_Renderer, rect: *SDL_Rect): cint <cimport> end
local function SDL_GetTicks(): uint32 <cimport> end

-- game types
local Point2D = @record{x: integer, y: integer}
local Direction = @enum(byte){NONE=0, UP, DOWN, RIGHT, LEFT}
local Color = @record{r: byte, g: byte, b: byte}

-- game constants
local TILE_SIZE <comptime> = 64
local GRID_SIZE <comptime> = 12
local SCREEN_SIZE <comptime> = TILE_SIZE * GRID_SIZE
local MOVE_DELAY <comptime> = 128
local COLOR_RED <const> = Color{r=255, g=96, b=96}
local COLOR_GREEN <const> = Color{r=96, g=255, b=96}
local COLOR_BLACK <const> = Color{r=0, g=0, b=0}

-- game state variables
local renderer
local movedir
local quit = false
local nextmove
local score
local headpos, tailpos, applepos
local tiles: [GRID_SIZE][GRID_SIZE]Direction

local function move_point(pos: Point2D, dir: Direction)
  switch dir
  case Direction.UP then
    pos.y = pos.y - 1
  case Direction.DOWN then
    pos.y = pos.y + 1
  case Direction.RIGHT then
    pos.x = pos.x + 1
  case Direction.LEFT then
    pos.x = pos.x - 1
  end
  return pos
end

local function set_tile(pos: Point2D, dir: Direction)
  tiles[pos.x][pos.y] = dir
end

local function reset_tile(pos: Point2D)
  tiles[pos.x][pos.y] = Direction.NONE
end

local function get_tile(pos: Point2D)
  return tiles[pos.x][pos.y]
end

local function has_tile(pos: Point2D)
  return tiles[pos.x][pos.y] ~= Direction.NONE
end

local function respawn_apple()
  -- respawn until there is no collision with its body
  repeat
    applepos = Point2D{
      x = math.random(GRID_SIZE) - 1,
      y = math.random(GRID_SIZE) - 1
    }
  until not has_tile(applepos)
end

local function init_game()
  tiles = {}
  headpos = Point2D{x=GRID_SIZE//2, y=GRID_SIZE//2}
  tailpos = Point2D{x=headpos.x,    y=headpos.y+1}
  movedir = Direction.UP
  score = 0
  nextmove = 0
  set_tile(headpos, Direction.UP)
  set_tile(tailpos, Direction.UP)
  respawn_apple()
  print 'NEW GAME'
end

local function game_over()
  print 'GAME OVER.'
  init_game()
end

local function poll_events()
  local event: SDL_Event
  while SDL_PollEvent(&event) ~= 0 do
    switch event.type
    case SDL_QUIT then
      quit = true
    case SDL_KEYDOWN then
      local kevent = (@*SDL_KeyboardEvent)(&event)
      local headdir = get_tile(headpos)
      switch kevent.keysym.sym
      case SDLK_UP then
        if headdir ~= Direction.DOWN then
          movedir = Direction.UP
        end
      case SDLK_DOWN then
        if headdir ~= Direction.UP then
          movedir = Direction.DOWN
        end
      case SDLK_RIGHT then
        if headdir ~= Direction.LEFT then
          movedir = Direction.RIGHT
        end
      case SDLK_LEFT then
        if headdir ~= Direction.RIGHT then
          movedir = Direction.LEFT
        end
      end
    end
  end
end

local function poll_game()
  local now = SDL_GetTicks()
  if now < nextmove then return end
  nextmove = now + MOVE_DELAY

  -- move the head
  set_tile(headpos, movedir)
  headpos = move_point(headpos, movedir)

  -- check collision with map boundaries
  if headpos.x >= GRID_SIZE or headpos.y >= GRID_SIZE or
     headpos.x < 0 or headpos.y < 0 then
    game_over()
    return
  end

  -- check collisions with its body
  if has_tile(headpos) then
    game_over()
    return
  end

  -- place head on next tile
  set_tile(headpos, movedir)

  -- check collision with apple
  if headpos.x == applepos.x and headpos.y == applepos.y then
    respawn_apple()

    score = score + 1
    print('SCORE', score)
  else
    -- eat tail
    local taildir = get_tile(tailpos)
    reset_tile(tailpos)
    tailpos = move_point(tailpos, taildir)
  end
end

local function draw_background(color: Color)
  SDL_SetRenderDrawColor(renderer, color.r, color.g, color.b, 255)
  SDL_RenderClear(renderer)
end

local function draw_tile(pos: Point2D, color: Color)
  SDL_SetRenderDrawColor(renderer, color.r, color.g, color.b, 255)
  local rect = SDL_Rect{
    x = pos.x * TILE_SIZE,
    y = pos.y * TILE_SIZE,
    w = TILE_SIZE,
    h = TILE_SIZE
  }
  SDL_RenderFillRect(renderer, &rect)
end

local function draw_apple()
  draw_tile(applepos, COLOR_RED)
end

local function draw_snake()
  for x=0,GRID_SIZE-1 do
    for y=0,GRID_SIZE-1 do
      local pos = Point2D{x=x,y=y}
      if has_tile(pos) then -- snake is present at this tile
        draw_tile(pos, COLOR_GREEN)
      end
    end
  end
end

local function draw()
  draw_background(COLOR_BLACK)
  draw_apple()
  draw_snake()
end

local function go()
  -- init sdl
  SDL_Init(SDL_INIT_VIDEO)

  local window = SDL_CreateWindow("An SDL2 Window",
    SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
    SCREEN_SIZE, SCREEN_SIZE, SDL_WINDOW_OPENGL)
  assert(window, "Could not create window")

  renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)
  assert(renderer, "Could not create renderer")

  init_game()

  -- draw loop
  repeat
    poll_events()
    poll_game()
    draw()

    -- swap buffers
    SDL_RenderPresent(renderer)
  until quit

  -- cleanup and finish
  SDL_DestroyWindow(window)
  SDL_DestroyRenderer(renderer)
  SDL_Quit()
end

go()
```
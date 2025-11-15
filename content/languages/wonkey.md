title=Wonkey
tags=language, gamedev, web assembly, windows, macos, linux, ios, android
summary=An open-source cross-platform programming language fork of the Monkey2 programming language, developed by Mark Sibly, creator of the ‘Blitz’ range of languages (BlitzBasic, Blitz2D, Blitz3D, BlitzPlus, BlitzMax).
~~~~~~

[Website](https://wonkey-coders.github.io/) | [Source](https://github.com/wonkey-coders/wonkey)

## Introduction to Wonkey

More complete help and samples are available online at [https://wonkey-coders.github.io/](https://wonkey-coders.github.io/).

### "Hello, Wonkey!'

function main()
  print "Hello, Wonkey!"
end

While staying true to the 'basic' style of the original Blitz languages, Wonkey offers some very powerful new features including:

### Generic classes and methods

Classes, interfaces, structs, methods and functions can have 'type' parameters.

struct Rect<T\>
  field x0:T, y0:T
  field x1:T, y1:T
end

'Main entry
function main()
  local r:=new Rect<Float\>
end

### 'First class' functions

Functions (and methods) can be stored in variables and passed to/from other functions.

function Test1()
  print "Test1"
end

function Test2()
  print "Test2"
end

function Tester( test:void() )
  test()
end

'Main entry
function main()
  Tester( Test1 )
  Tester( Test2 )
end

### Lambda functions

Lambda functions allow you to create closures.

function Test( func:Void() )
  func()
end

'Main entry
function main()
  for local i:=0 until 10
    Test( lambda()
      print i
    end)
  next
end

### New 'Struct' type that provides value semantics

Structs are similar to classes in that they encapsulate member data, but differ in that they are passed around 'by value' instead of 'by reference'.

This allows structs to be efficiently create on the stack without any garbage collection overhead.

struct S
  field data:Int\=10
end

function Test( s:S )
  s.data \= 100
end

'Main entry
function main()
  local s:=new S 'Create a new S on the stack (very fast!)
  Test( s )      'Test gets a copy of 's'
  print s.data   'Print '10'
end

### Fibers for easy asynchronous programming

Fibers provide support for 'cooperative' multi-threading.

function Server( host:String, service:String )
  local server:=Socket.Listen( host, service )
	
  repeat
    local client:=server.Accept()
    new Fiber( lambda()
      local data:=client.Receive(...)
    end )
  forever
end

### Operator overloading

Operator overloading allows you to override the meaning of the built-in language operators, making for more expressive code.

struct Vec2
  field x:Float
  field y:Float

  method new( x:Float,y:Float )
    self.x\=x
    self.y\=y
  end

  operator+:Vec2( v:Vec2 )
    return new Vec2( x+v.x,y+v.y )
  end

  operator to:String()
    return "Vec2("+x+","+y+")"
  end
end

'Main entry
function main()
  local v0:=new Vec2( 10,20 )
  local v1:=new Vec2( 30,40 )
   
  print v0+v1
end

### Class extensions

Class extensions allow you to add extra methods, functions and properties to existing classes.

struct Foo
  field i:Int\=0
end 

struct Foo extension
  method Increment()
    i+=1
  end
end

### Fully garbage collected

Wonkey provides a 'mostly' incremental garbage collector that efficiently collects garbage as it runs without any of those annoying 'sweep' spikes found in typical garbage collectors.

### Optional reflection features

Wonkey includes an optional reflection system that allows you to inspect and modify variables and values at runtime:

#import <reflection\>

class C
  method Update( msg:String )
    print "C.Update : msg=" + msg
  end
end

'Main entry
function main()
  local c:=new C
	
  local type:=typeof( c )
  print type
	
  local decl:=type.GetDecl( "Update" )
  decl.Invoke( c, "Hello World!" )
end

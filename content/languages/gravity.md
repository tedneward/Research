title=Gravity
tags=language, native, dynamic
summary=An embeddable programming language with no external dependencies and a register-based virtual machine.
~~~~~~

[Website](http://gravity-lang.org/) | [Source](https://github.com/marcobambini/gravity)

Example:
```
class Vector {
    // instance variables
    var x = 0;
    var y = 0;
    var z = 0;

    // constructor
    func init (a = 0, b = 0, c = 0) {
        x = a; y = b; z = c;
    }

    // instance method (built-in operator overriding)
    func + (v) {
        if (v is Int) return Vector(x+v, y+v, z+v);
        else if (v is Vector) return Vector(x+v.x, y+v.y, z+v.z);
        return null;
    }

    // instance method (built-in String conversion overriding)
    func String() {
        // string interpolation support
        return "[\(x),\(y),\(z)]";
    }
}

func main() {
    // initialize a new vector object
    var v1 = Vector(1,2,3);

    // initialize a new vector object
    var v2 = Vector(4,5,6);

    // call + function in the vector object
    var v3 = v1 + v2;

    // returns string "[1,2,3] + [4,5,6] = [5,7,9]"
    return "\(v1) + \(v2) = \(v3)";
 }
```

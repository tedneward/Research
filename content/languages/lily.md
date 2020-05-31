title=Lily
tags=language, static, library
summary=A programming language focused on expressiveness and type safety.
~~~~~~

[Website](http://lily-lang.org/) | [Source](https://gitlab.com/FascinatedBox/lily)

"Here's a small example showing most of Lily's features:
```
var math_ops = ["+" => (|a: Integer, b: Integer| a + b),
                "-" => (|a, b| a - b),
                "*" => (|a, b| a * b),
                "/" => (|a, b| a / b)]

define rpn(input: String): Result[String, List[Integer]]
{
    var values = input.split(" ").reject(|r| r.is_space() )
    var stack: List[Integer] = []

    for i in 0...values.size() - 1: {
        var v = values[i]
        match v.parse_i(): {
            case Some(number):
                stack.push(number)
            case None:
                if stack.size() < 2: {
                    return Failure("Stack underflow.")
                }

                var right = stack.pop()
                var left = stack.pop()
                try: {
                    var op_fn = math_ops[v]
                    var op_value = op_fn(left, right)
                    stack.push(op_value)
                except KeyError:
                    return Failure("Invalid operation {0}.".format(v))
                except DivisionByZeroError:
                    return Failure("Attempt to divide by zero.")
                }
        }
    }

    return Success(stack)
}

print("1 2 3 4 * + -"  |> rpn) # Success([-13])
print("2 2 2 2 * *"    |> rpn) # Success([2, 8])
print("*"              |> rpn) # Failure("Stack underflow.")
print("1 2 ?"          |> rpn) # Failure("Invalid operation ?.")
```

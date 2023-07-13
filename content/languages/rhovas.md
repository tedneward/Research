title=Rhovas
tags=language, distribution
summary=A programming language for API design and enforcement.
~~~~~~

[Website](https://rhovas.dev/) | [Github](https://github.com/Rhovas/)

## Examples

FizzBuzz
```
range(1, 15, :incl).for {
    match ([val.mod(3), val.mod(5)]) {
        [0, 0]: print("FizzBuzz");
        [0, _]: print("Fizz");
        [_, 0]: print("Buzz");
        else: print(val);
    }
}
```

List
```
class List<'T> {

    func +add(element: 'T) { ... }

    func -first(): 'T? { ... }

}
```

Database Query (Embedded DSLs)
```
val language = "Rhovas";

val result = db.query(#sql {
  SELECT * FROM languages
  WHERE name = ${language}
});
```

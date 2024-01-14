title=Eval
tags=language, interpreter
summary=a lightweight interpreter framework written in Swift, evaluating expressions at runtime, with operators and data types you define.
~~~~~~

[Source](https://github.com/tevelee/Eval)

Eval is a lightweight interpreter framework written in Swift, for iOS, macOS, and Linux platforms. It evaluates expressions at runtime, with operators and data types you define.

The framework currently supports two different types of execution modes:

Strongly typed expressions: like a programming language
Template languages: evaluating expressions in arbitrary string environments
Let's see just a few examples:

It's extremely easy to formulate expressions (and evaluate them at runtime), like

* `5 in 1...3` evaluates to `false` Bool type
* `'Eval'` starts with 'E' evaluates to `true` Bool type
* `'b' in ['a','c','d']` evaluates to `false` Bool type
* `x < 2 ? 'a' : 'b'` evaluates to "a" or "b" String type, based on the `x` Int input variable
* `Date(2018, 12, 13).format('yyyy-MM-dd')` evaluates to `"2018-12-13"` string
* `'hello'.length` evaluates to `5` Integer
* `now` evaluates to `Date()`

And templates, such as

* `{% if name != nil %}Hello{% else %}Bye{% endif %} {{ name|default('user') }}!`, whose output is Hello Adam! or Bye User!
* Sequence: `{% for i in 1...5 %}{{ 2 * i }} {% endfor %} which is 2 4 6 8 10` 

And so on... The result of these expressions depends on the content, determined by the evaluation. It can be any type which is returned by the functions (String, [Double], Date, or even custom types of your own.)

### Getting started
For the expressions to work, you'll need to create an interpreter instance, providing your data types and expressions you aim to support, and maybe some input variables - if you need any.

        let interpreter = TypedInterpreter(dataTypes: [number, string, boolean, array, date],
                                           functions: [multipication, addition, ternary],
                                           context: Context(variables: ["x": 2.0]))

And call it with a string expression, as follows.

        let result = interpreter.evaluate("2 * x + 1") as? Double


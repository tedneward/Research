title=PineScript
tags=language, dsl
summary=TradingView's programming language, which allows traders to create their own trading tools and run them on our servers; a lightweight, yet powerful, language for developing indicators and strategies that you can then backtest.
~~~~~~

[Website](https://www.tradingview.com/pine-script-docs/welcome/) | [v6 Reference Manual](https://www.tradingview.com/pine-script-reference/v6/)

# [First version](https://www.tradingview.com/pine-script-docs/primer/first-indicator/#first-version)
Let’s create our first working Pine script, an implementation of the MACD indicator:

1. Open the Pine Editor’s dropdown menu (the arrow at the top-left corner of the Pine Editor pane, beside the script name) and select “Create new/Indicator”.
2. Copy the example script code below by clicking the button on the top-right of the code widget.
3. Select all the code already in the editor and replace it with the example code.
4. Save the script by selecting the script name or using the keyboard shortcut Ctrl+S. Choose a name for the script (e.g., “MACD #1”). The script is saved in TradingView’s cloud servers, and is local to your account, meaning only you can see and use this version.
5. Select “Add to chart” in the Pine Editor’s menu bar. The MACD indicator appears in a separate pane under the chart.

```
//@version=6
indicator("MACD #1")
fast = 12
slow = 26
fastMA = ta.ema(close, fast)
slowMA = ta.ema(close, slow)
macd = fastMA - slowMA
signal = ta.ema(macd, 9)
plot(macd, color = color.blue)
plot(signal, color = color.orange)
```

Our first Pine script is now running on the chart, which should look like this:

![](https://www.tradingview.com/pine-script-docs/_astro/First-indicator-First-version-1.WiOSM08Z_EQDdM.webp)

---

This is a fascinating example of a DSL, and while I know nothing of the domain, I'm fascinated by the language and its applicability. It basically looks like a numerical analysis and visualization language. If I were a trader, I think I'd be in love with this. It's really a simple language, as languages go (looks like a C-family syntax, in fact it might even be raw JS!), but it really seems to smoothly hide the edges between language and library.

[Type system](https://www.tradingview.com/pine-script-docs/language/type-system/):

Pine Script uses *types* to classify all values, and it uses *qualifiers* to determine whether values and references are constant, established on the first script execution, or dynamic across executions. This system applies to all Pine values and references, including literals, variables, expressions, function returns, and function arguments.

The type system closely intertwines with Pine’s execution model and time series concepts. Understanding all three is essential for making the most of the power of Pine Script.

**Qualifiers** (const, input, simple, series)

Pine Script qualifiers identify when values are accessible to a script:

* Values and references qualified as `const` are established at compile time (i.e., when saving the script in the Pine Editor or adding it to the chart).
* Values qualified as `input` are established at input time (i.e., when confirming values based on user input, primarily from the “Settings/Inputs” tab).
* Values qualified as `simple` are established at bar zero (i.e., the first script execution).
* Values qualified as `series` can change throughout the script’s executions.

Pine Script bases the dominance of type qualifiers on the following hierarchy: const < input < simple < series, where “const” is the weakest qualifier and “series” is the strongest. The qualifier hierarchy translates to this rule: whenever a variable, function, or operation is compatible with a specific qualified type, values with weaker qualifiers are also allowed.

Scripts always qualify their expressions’ returned types based on the dominant qualifier in their calculations. For example, evaluating an expression that involves “input” and “series” values will return a value qualified as “series”. Furthermore, scripts cannot change a value’s qualifier to one that’s lower on the hierarchy. If a value acquires a stronger qualifier (e.g., a value initially inferred as “simple” becomes “series” later in the script’s executions), that state is irreversible.

It’s important to note that “series” values are the only ones that can change across script executions, including those from various built-ins, such as close and volume, as well as the results of expressions involving “series” values. All values qualified as “const”, “input”, or “simple” remain consistent across all script executions.

**Types** (int, float, bool, color, string, plot and hline, void, Drawing types, Chart points, Enum types, User-defined types)

**Type templates**

Type templates specify the data types that collections (`arrays`, `matrices`, and `maps`) can contain.

Templates for arrays and matrices consist of a single type identifier surrounded by angle brackets, e.g., <int>, <label>, and <PivotPoint> (where PivotPoint is a user-defined type (UDT)).

Templates for maps consist of two type identifiers enclosed in angle brackets, where the first specifies the type of keys in each key-value pair, and the second specifies the value type. For example, <string, float> is a type template for a map that holds string keys and float values.

Users can construct type templates from:

* Fundamental types: int, float, bool, color, and string
* The following special types: line, linefill, box, polyline, label, table, and chart.point
* User-defined types (UDTs)
* Enum types

Note that: Maps can use any of these types as values, but they can only accept fundamental types or enum types as keys.

**Tuples** A tuple is a comma-separated set of expressions enclosed in (square) brackets. When a function, method, or other local block returns more than one value, scripts return those values in the form of a tuple.


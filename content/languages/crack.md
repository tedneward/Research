title=Crack
tags=language, compiled, static, object
summary=An imperative, object-oriented language along the lines of Java, Python and C++. It can be compiled in Just In Time and Ahead Of Time modes and has been tested on 32 and 64 bit x86 Linux Debian and Ubuntu systems.
~~~~~~

[Website](http://crack-lang.org/) [Source](https://github.com/crack-lang/crack)

This script builds a set of unique values from the argument list and prints its contents.
```
    # import what we need from the appropriate modules
    import crack.cont.hashmap HashMap;
    import crack.io cout;
    import crack.strutil StringArray;
    import crack.sys argv;

    ## Cheesey set implementation.
    class ArgSet : HashMap[String, bool] {
        oper init(StringArray args) {
            for (arg :in args)
                this[arg] = true;
        }

        void dump() {
            for (item :in this)
                cout `got $(item.key)\n`;
        }
    }

    # initialize the arg set from the actual args
    ArgSet a = {argv};

    # write the set
    a.dump();
```


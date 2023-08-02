title=Nools
tags=library, nodejs, rules
summary=Rules engine inference and enforcement in JS.
~~~~~~

[Website](http://noolsjs.com/) | [Source](https://github.com/noolsjs/nools)

Programmatically defining a flow:

```
var nools = require("nools");

var Message = function (message) {
    this.text = message;
};

var flow = nools.flow("Hello World", function (flow) {

    //find any message that is exactly hello world
    flow.rule("Hello", [Message, "m", "m.text =~ /^hello\\sworld$/"], function (facts) {
        facts.m.text = facts.m.text + " goodbye";
        this.modify(facts.m);
    });

    //find all messages then end in goodbye
    flow.rule("Goodbye", [Message, "m", "m.text =~ /.*goodbye$/"], function (facts) {
        console.log(facts.m.text);
    });
});
```

DSL:
```
define Message {
    text : '',
    constructor : function(message){
        this.text = message;
    }
}

//find any message that starts with hello
rule Hello {
    when {
        m : Message m.text =~ /^hello(\s*world)?$/;
    }
    then {
        modify(m, function(){this.text += " goodbye";});
    }
}

//find all messages then end in goodbye
rule Goodbye {
    when {
        m : Message m.text =~ /.*goodbye$/;
    }
    then {
        console.log(m.text);
    }
}
```


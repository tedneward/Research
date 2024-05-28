title=GYS
tags=language, language development
summary=the scripting engine which helps to create the embedded interpreter of your own language.
~~~~~~

[Source](https://gys.sourceforge.net/)

Built-in lexical and expression analyzer, but during interpretation it calls different user code for executing commands, operators, conversions and value getting.

The interpreter is fully runtime - it reads code and interprets it at once. GYS doesn't generate any intermediate code. User doesn't have to use stack to implement his GYS-derived script language. The "abstract" GYS interpreter can be called within application to execute the script according to the designed language definition and functionality. The library provides an easy and clear way to define a scipt language interpreter step-by-step.

## Tutorial
For example we want to create interpreter which can execute next simple script:

```
print("What is your name?\n")   // just print something
string name=gets()              // create new var and read string from the input
print("Greetings, "+name+"!\n") // print out message using string+string operator in expression evaluation
```

So we need to create:

* 'string' type
* built-in functions print and gets with appropriate syntax
* mechanism of variable definition for this type
* binary operator string+string for concatenation

#### Storing user data in GYS_ret_val objects
In order to define new type for GYS interpreter user should make it possible to store values of this type in GYS_ret_val objects.

1. Create new class derived from GYS_user_val and redefine 2 functions (using objects of this new class user will be able to pass specified data via GYS_ret_val objects):

    class GYS_user_val : public RefCntObject // from gys.h
    {
    public:
        virtual void* get_user_val() =0;
        virtual string get_type_name() const =0;
    };

    // ...user creates next class:
    class GYS_string_user_val: public GYS_user_val // objects of this class contain string data
    {
    private:
        string val;

    public:
        GYS_string_user_val(string str) : val(str) { }

        // returns typename as we see it in scripts
        string get_type_name() const {
            return "string";
        }

        // retuns data (as void* value!)
        void* get_user_val() {
            return &val;
        }
    };

2. Create function which stores string data into GYS_ret_val objects using class described above. This function will be used by GYS_ret_val objects to manipulate user data:

    GYS_ret_val& store(GYS_ret_val& val, string string_user_val)
    {
        val.set_user_val( new GYS_string_user_val(string_user_val) );
        return val;
    }

Here GYS_string_user_val object is created dynamically, it will be destroyed automatically: GYS uses smart pointers with ref. counter for user values. We just pass new user value into GYS_ret_val object using set_user_val member function.

That's it. Now we can use only GYS_ret_val objects to manipalute string data (its members will call appropriate get_type_name() and store() functions for different user data):

    GYS_ret_val test()
    {
        // create new value
        GYS_ret_val str_val;

        // store new data
        string str="test";
        str_val=str;

        // get typename of contained value
        cout<<str_val.get_type_name()<<endl; // >string

        // get contained data as string
        cout<<(string)str_val<<endl;         // >test

        // create lvalue for this value
        GYS_ret_val str_lvalue=&str_val;

        // operator= changes str_val
        str_lvalue="new string";

        cout<<(string)str_val<<endl;         // >new string

        // set_val() cleans lvalue and doesn't affect str_val now
        str_lvalue.set_val("another string");

        cout<<(string)str_lvalue<<endl;      // >another string

        cout<<(string)str_val<<endl;         // >new string - nothing happened

        return "returned string";
    }
    //...

    cout<<(string)test()<<endl; // >returned string

#### Adding new GYS type
To define new type user should write the code which the interpreter will call to read "raw data" from a script. "Raw data" is some expression interpreter can't evaluate using built-in mechanisms (functions, operators, variables etc.). It is exactly what we need to interpret string-tokens as string values in our script.

1. So we define next function which can be called by GYS interpreter:

    // gets raw string data
    GYS_ret_val get_string_val(GYS* script)
    {
        script->get_token(); // read next token

        if(script->get_tok_type()==GYS_STRING) // check its type
        {
            return (string)script->get_tok_str(); // return token - it is the string we need
        }
        else // error
        {
            script->error("'string' getting: string-token expected: ", script->get_tok_str()); // error
            return GYS_ret_val(); // return void value
        }
    }

2. At last in order to add new 'string' GYS type we call add_gys_type() function:

    //...
      script.add_gys_type("string", get_string_val);

#### Adding new GYS built-in functions (commands)
The GYS interpreter calls user code to execute any built-in function (command) which is recognized by name-token (identifier).

1. We write code which processes 'print' and 'gets' script functions:

    // this function will be called to interpret 'print' name-token
    GYS_ret_val exec_print(GYS* script)
    {
        script->exam("("); // read next token and check it for "("
    
        cout << (string)script->get_val("string"); // evaluate expression to get value of type 'string'
                
        script->exam(")"); // read next token and check it for ")" 
    
        return GYS_ret_val(); // return "nothing" - value of type gys_void_type
    }

    GYS_ret_val exec_gets(GYS* script)
    {
        script->exam("(");

        string str;
        cin >> str;

        script->exam(")");

        return str;
    }

2. We add 'print' and 'gets' built-in script functions using add_gys_func() function:

    //...
    script.add_gys_func("print", exec_print);
    script.add_gys_func("gets", exec_gets);

After this the first line of our script is executable:

    print ( "What is your name?\n" ) // >What is your name?

Or, for example, this:

    print( gets() ) // echos user's input

C/C++-style comments are supported by GYS lexical analyzer by default as well as escape sequences in string- and char-tokens.

#### Adding variable definition statement
To add variable definition "statement" we can use GYS built-in function with name 'string' and use GYS::add_local_var() member function for adding new variables (or constants if we pass variable name as "@var_name" but we create only variables in our example):

    GYS_ret_val exec_string(GYS* s)
    {
        string type="string";
    
        GYS_ret_val val; // value for new var
        string name;     // var name
    
    new_var:
        s->get_token();
        if(s->get_tok_type()!=GYS_NAME)
        {
            s->error("Variable token expected: ", s->get_tok_str());
            return GYS_ret_val();
        }
    
        name=s->get_tok_str();
    
        if(!s->exam("="))
                return GYS_ret_val();
    
        if( ( val=s->get_val( type ) ).get_type_name()!=gys_void_type ) // not void
            s->add_local_var(name, val.get_value());
    
        s->get_token();
        if(s->get_tok_type()==GYS_DELIMETER && s->get_tok_str()==",")
            goto new_var;
        else
            s->putback_tok();
    
        return GYS_ret_val();
    }
    
    //...
    script.add_gys_func("string", exec_string);

Now next script will be executed correctly:

    string str1="hello", str2="bye", str3=str2

#### Adding binary operators
User calls function add_binary_op() in order to add new GYS binary operator. Here is code for adding our operator:

    // string+string
    GYS_ret_val op_add_string(GYS* script, GYS_ret_val left_operand, GYS_ret_val right_operand)
    {
        return (string)left_operand + (string)right_operand;
    }

    //...
    script.add_binary_op("+", "string", "string", op_add_string);

GYS interpreter recognizes binary operator by name ("+") and type of its left operand ("string" - second argument), after that interpreter evaluates right operand of type specified by user ("string" - third arg) and calls user function to calculate the result of this operator (op_add_string()). It means that user can't define 2 different operators with identical "left-operand"-types and names (e.g. operators type1+ type2 and type1+ type3 are incompatible) because they are "identical" for GYS expression evaluator. Next names for binary operators are available in GYS:

    + -
    * / %
    = := += -= *= /= %=
    == != === !== < > <= >= && ||
    [] << >> <<= >>=

#### Full code
This is the full code of our simple interpreter:

````
// test.cpp : example of GYS embedding

#include "gys.h"

#include <fstream>

class GYS_string_user_val: public GYS_user_val // objects of this class contain string data
{
private:
    string val;

public:
    GYS_string_user_val(string str) : val(str) { }

    // returns typename as we see it in scripts
    string get_type_name() const {
        return "string";
    }

    // retuns data (as void* value!)
    void* get_user_val() {
        return &val;
    }
};

GYS_ret_val& store(GYS_ret_val& val, string string_user_val)
{
    val.set_user_val( new GYS_string_user_val(string_user_val) );
    return val;
}

// gets raw string data
GYS_ret_val get_string_val(GYS* script)
{
    script->get_token(); // read next token

    if(script->get_tok_type()==GYS_STRING) // check its type
    {
        return (string)script->get_tok_str(); // return token - it is the string we need
    }
    else // error
    {
        script->error("'string' getting: string-token expected: ", script->get_tok_str()); // error
        return GYS_ret_val();// return void value
    }
}

// this function will be called to interpret 'print' name-token
GYS_ret_val exec_print(GYS* script)
{
    script->exam("("); // read next token and check it for "("

    cout << (string)script->get_val("string"); // evaluate expression to get 'string'-value

    script->exam(")"); // read next token and check it for ")"

    return GYS_ret_val(); // return "nothing" - value of type gys_void_type
}

GYS_ret_val exec_gets(GYS* script)
{
    script->exam("(");

    string str;
    cin >> str;

    script->exam(")");

    return str;
}

GYS_ret_val exec_string(GYS* s)
{
    string type="string";

    GYS_ret_val val; // value for new var
    string name; // var name

    new_var:
    s->get_token();
    if(s->get_tok_type()!=GYS_NAME)
    {
        s->error("Variable token expected: ", s->get_tok_str());
        return GYS_ret_val();
    }

    name=s->get_tok_str();

    if(!s->exam("="))
        return GYS_ret_val();

    if( ( val=s->get_val( type ) ).get_type_name()!=gys_void_type ) // not void
        s->add_local_var(name, val.get_value());

    s->get_token();
    if(s->get_tok_type()==GYS_DELIMETER && s->get_tok_str()==",")
        goto new_var;
    else
        s->putback_tok();

    return GYS_ret_val();
}

// string+string
GYS_ret_val op_add_string(GYS* script, GYS_ret_val left_operand, GYS_ret_val right_operand)
{
    return (string)left_operand + (string)right_operand;
}

int main(int argc, char* argv[])
{
    // create new script interpreter and set its name
    const char* filename="foo.gys";
    GYS script(filename); // we set name for debug purposes
       
    // load the file we want to interpret
    ifstream fin(filename);

    if(!fin) // error
    {
        cerr<<"Interpreter error: can't open the input file: "<<filename<<endl;
        return 1;
    }

    // set input for our interpreter
    script.set_input(&fin);                

    // add error and warning handlers (here we use standard handlers)
    script.set_warning_func(std_gys_warning_callback);
    script.set_error_func(std_gys_error_callback);
    script.set_fatal_error_func(std_gys_fatal_error_callback);

    // --- Language definition:

    // types
    script.add_gys_type("string", get_string_val);

    // functions
    script.add_gys_func("print", exec_print);
    script.add_gys_func("gets",  exec_gets);

    // var definition statement
    script.add_gys_func("string", exec_string);

    // binary operators
    script.add_binary_op("+", "string", "string", op_add_string);

    // interpretation
    script.interp();

    return 0;
}
```

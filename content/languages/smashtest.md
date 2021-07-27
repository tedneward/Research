title=SmashTest
tags=language, tool, browser
summary=An open-source tool and language for rapidly generating tests.
~~~~~~

[Website](https://smashtest.io/) | [Source](https://github.com/smashtestio/smashtest)

### Example test

```
Open Chrome
Open Firefox
Open Safari
 
    Navigate to 'site.com'
 
        Click 'Sign In'
 
            Type {username:} into 'username box'
 
                {username} is 'joe'
                {username} is 'bob'
                {username} is 'mary'
 
                    Verify success
 
                {username} is 'baduser'
 
                    Verify error
```

... where each indentation represents a permutation from the unindented lines before it (I think).

### Basic Language Syntax
Branches
```
Open Chrome                  // executed in both branches
 
    Navigate to 'site.com'   // executed in both branches
 
        Click 'one'          // branch 1 ends here
        Click 'two'          // branch 2 ends here
 
        // produces branches:
        // 1) open, nav, click 'one'
        // 2) open, nav, click 'two'
```

```
Open Chrome
 
    Navigate to 'google.com'
 
        Do a search    // this step ends branch 1
 
    Navigate to 'pets.com'
 
        Buy cat food   // this step ends branch 2
 
        Buy dog food   // this step ends branch 3
```

Step blocks
```
Open Chrome   // this group of 5 steps is known as a "step block" (same indent, no blank lines in between)
Open Firefox
Open Safari
Open Edge
Open IE
                             // one empty line under a step block is mandatory
    Navigate to 'site.com'   // 5 separate branches end in this step
```

Sequential
```
..
Open Chrome
Nav to 'site.com'
Click 'button'
 
// is the same as
 
Open Chrome
    Nav to 'site.com'
        Click 'button'
```

Textual Steps
```
This step is a function call    // it executes an action
 
- This step is a textual step   // it's just a piece of text to organize your tests
 
Look, I can put the "-" modifier at the end too! -
 
Navigate to 'site.com'
    - Logged-in tests
        // etc.
 
    - Logged-out tests
        // etc.
```

Code blocks
```
Open Chrome
 
    Navigate to 'site.com'
 
        Click the logo {
            // this is a code block
            // you can do anything js or nodejs supports
 
            (await $('#logo')).click();
 
            browser.driver;   // webdriverjs's WebDriver object
 
        }   // must end at the same indent level as the starting line
```

Functions
```
Open Chrome
    Navigate to 'site.com'
        Click 'element'   // all 3 steps are function calls to built-in ("packaged") functions
 
* Log In   // this is a function declaration
    Click 'log in box'
        Type 'username' into 'username box'
            Click 'ok'
 
Open Chrome
    Navigate to 'site.com'
        Log In   // this is a function call (it will execute the 3 login steps)
            Log Out   // another function call
                log  out   // steps are case insensitive
 
* Log Out {
    // this is a code block
    (await $('.logout-button')).click();
}
```

Variables
```
{username} = 'superman'    // this sets the global variable 'superman'
{username} is 'superman'   // same as above
{username} is "superman"   // same as above
{username} is [superman]   // same as above
 
    Type '{username} is a handsome guy' into 'textbox'
```

ElementFinders
```
Open Chrome
 
    Navigate to 'https://www.site.com'
 
        On homepage {
 
            // describe props, which are things on the page and/or the state of those things
            props({
                'message box': `.textbox, enabled`,   // inside the `` is an ElementFinder,
                                                      // a special syntax for finding elements
                'login button': `#login`,
 
                'search results': `
                    #list
                        .result, 'one'
                        .result, 'two'
                `,
 
                'groovy': `'contains this groovy text'`,
 
                'retro button': `selector '.button', groovy`
            });
 
        }
 
            Type 'hello world' into 'message box'   // using a prop makes it easier to read and refactor
```






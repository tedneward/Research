title=Bromium
tags=language, browser, jvm
summary=A DSL/framework for running automated integration/end-to-end tests through the browser. It is especially effective for single page applications (SPA) and any front end that has a lot of dynamic stuff going on.
~~~~~~

Language built on top of Selenium for doing web browser integration testing.

[Source](https://github.com/hristo-vrigazov/bromium)

```
name 'Demo app'
version 0.1.1

actions {
    action 'Load login page'
    load page '/login'
    do expect http request
    
    action 'Type username'
    type "admin" in element with css selector "#user"
    do not expect http request
    
    action 'Type password'
    type "admin" in element with css selector "#pass"
    do not expect http request
    
    action 'Click login button'
    click on element with css selector "#login"
    do expect http request
}
```

title=Robot Framework
tags=tool, library, python, automation, RPA, test
summary=A generic open source automation framework. It can be used for test automation and robotic process automation (RPA).
~~~~~~

[Website](https://robotframework.org/) | [Source](https://github.com/robotframework/robotframework)

Example:
```
*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.txt

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    demo
    Input Password    mode
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
```


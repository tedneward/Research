title=Pragma
tags=language
summary=Generates a GraphQL API based on your data models, authorization rules, and custom Javascript functions.
~~~~~~
Still in beta. May be called Pragmalang?

[Website](https://pragmalang.com/)

```
import hooks from "./hooks.js"

@user
@onWrite(hooks.validateUser)
@onWrite(hooks.setFullName)
model User {
  username: String @publicCredential @priamry
  password: String @secretCredential
  firstName: String
  lastName: String
  fullName: String
  age: Int
}

allow CREATE User
```

hooks.js is a JavaScript file containing two definitions:

```
const validateUser = user => {
  if(user.age < 18) {
    throw new Error("Age must be over 18")
  }
  return user
}

const setFullName = user => 
  ({...user, fullName: user.firstName + " " + user.lastName})
```


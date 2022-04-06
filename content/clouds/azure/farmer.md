title=Farmer
tags=cloud, azure, devops
summary=
~~~~~~

[Website](https://compositionalit.github.io/farmer/) | [Source](https://github.com/compositionalit/farmer)

Example:
```
// Create a storage account with a container
let myStorageAccount = storageAccount {
    name "myTestStorage"
    add_public_container "myContainer"
}

// Create a web app with application insights that's connected to the storage account.
let myWebApp = webApp {
    name "myTestWebApp"
    setting "storageKey" myStorageAccount.Key
}

// Create an ARM template
let deployment = arm {
    location Location.NorthEurope
    add_resources [
        myStorageAccount
        myWebApp
    ]
}

// Deploy it to Azure!
deployment
|> Writer.quickWrite "myResourceGroup"
```


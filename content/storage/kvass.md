title=kvass
tags=storage, key-value
summary=A personal key-value data store.
~~~~~~

[Source](https://github.com/maxmunzel/kvass)

As in, run it from the CLI to store any binaries of desire.

## Simple usage

```
$ kvass set hello world
$ kvass get hello
world

# enumerate keys
$ kvass ls
hello

# store arbitrary files
$ kvass set logo < kvass.jpg
$ kvass get logo > kvass.jpg


# Its trivial to set up and operate kvass across multiple devices
$ ssh you@yourserver.com kvass config show

Encryption Key:  	5abf59f5f1a2f3c998a4f592ce081a23e14a68fd8a792259c6ec0fc1e8fb1246  # <- copy this for the next step
ProcessID:       	752176921
Remote:          	(None)

$ kvass config key 5abf59f5f1a2f3c998a4f592ce081a23e14a68fd8a792259c6ec0fc1e8fb1246 # set the same key for all your devices
$ kvass config remote yourserver.com:8000 # tell kvass where to find the server instance

# Run "kvass serve" on your server using systemd, screen or the init system of your choice (runit, anyone?). You can specify the interface and port to host at with [--bind].

$ kvass serve --bind="0.0.0.0:80" # host on the default HTTP port (which means you can generate cleaner URLs - just set your remote no port)

# every set will now be broadcasted to the server
$ kvass set "hello from the other side" hello
$ ssh you@yourserver kvass get "hello from the other side"
hello

# and every get will check the server for updates
$ ssh you@yourserver kvass set hello 👋
$ kvass get hello
👋

# Good to know: All communication between the client and server is authenticated and encrypted using AES-256 GCM.

# remember the file we stored earlier? Let's get a shareable url for it!
$ kvass url logo
http://demo.maxnagy.com:8000/get?q=OQMwTQmFCz6xiWxFxt4Mkw

# you can also print the corresponding qr code directly to your terminal
kvass qr logo
```
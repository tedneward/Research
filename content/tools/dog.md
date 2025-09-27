title=Dog/Doge
tags=tool, distribution, dns
summary=A command-line DNS client.
~~~~~~

[Website](https://dog.ramfield.net/) | [Source](https://github.com/Dj-Codeman/dog_community)

`dog-community` is a maintained fork of the beloved terminal DNS client (dog/doge). It keeps the human-readable output you know, adds steady fixes, and supports DNS over HTTPS/TLS with JSON output for scripting.

## Usage

Basics
```
doge example.net                         # default query
doge example.net MX                      # specific record type
doge example.net MX @1.1.1.1             # specific nameserver
doge example.net MX @1.1.1.1 -T          # TCP instead of UDP
```

Arguments style
```
doge -q example.net -t MX -n 1.1.1.1 -T  # explicit flags
```
        
JSON & scripting
```
doge example.com AAAA -J | jq .
```

Protocol modes
```
-U/--udp     # DNS over UDP
-T/--tcp     # DNS over TCP
-S/--tls     # DNS over TLS
-H/--https   # DNS over HTTPS
```


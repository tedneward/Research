title=Req
tags=language, distribution
summary=A simple and opinionated HTTP scripting language.
~~~~~~

[Source](https://github.com/andrewpillar/req)

It is designed for easily making HTTP requests, and working with their responses. Below is an example that calls out to the GitHub API and displays the user making the call.

```
$ cat gh.req
Stderr = open "/dev/stderr";

Endpoint = "https://api.github.com";
Token = env "GH_TOKEN";

if $Token == "" {
    writeln $Stderr "GH_TOKEN not set";
    exit 1;
}

Headers = (
    Authorization: "Bearer $(Token)",
);

Resp = GET "$(Endpoint)/user" $Headers -> send;

match $Resp.StatusCode {
    200 -> {
        User = decode json $Resp.Body;

        writeln _ "Hello $(User["login"])";
    }
    _   -> {
        writeln $Stderr "Unexpected response: $(Resp.Status)";
        exit 1;
    }
}
$ GH_TOKEN=1a2b3c4d5ef req gh.req
```

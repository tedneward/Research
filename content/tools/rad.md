title=Rad
tags=tool, language, shell
summary=Modern CLI scripts made easy.
~~~~~~

[Website](https://amterp.github.io/rad/) | [Source](https://github.com/amterp/rad) | [Docs](https://amterp.github.io/rad/)

## [Getting Started](https://amterp.github.io/rad/guide/getting-started/)

macOS: `brew install amterp/rad/rad`

## Examples

Fetch and display GitHub commits in one, minimal script:

    #!/usr/bin/env rad
    args:
        repo str        # The repo to query. Format: user/project
        limit int = 20  # Max commits to return
    
    url = "https://api.github.com/repos/{repo}/commits?per_page={limit}"
    
    Time = json[].commit.author.date
    Author = json[].commit.author.name
    SHA = json[].sha
    
    rad url:
        fields Time, Author, SHA
    

Put this `commits` script on your PATH, and invoke:

    \> commits spf13/cobra 3
    Querying url: https://api.github.com/repos/spf13/cobra/commits?per\_page=3
    Time                  Author          SHA
    2025-03-07T14:53:22Z  styee           4f9ef8cdbbc88c5302be95e0e67fd78ebbfa9dd2
    2025-02-21T12:46:14Z  Fraser Waters   1995054b003053cc1e404bccfbf6d168e8731509
    2025-02-17T19:16:17Z  Yedaya Katsman  f98cf4216d3cb5235e6e0cd00ee00959deb1dc65

No `curl | jq | awk` gymnastics. No argparse boilerplate. Just readable code that does what you want.

Explaining the above script:

1.  The script takes two args: a repo string and an optional limit (defaults to 20).
    -   The `#` comments are read by Rad and used to generate helpful docs / usage strings for the script.
2.  It uses string interpolation to build the url we will query, based on the supplied args.
3.  It defines the fields to extract from the JSON response.
4.  It executes the query, extracting the specified fields from the response, and displays the resulting data as a table.
    -   Note the `rad url` syntax: "rad" actually stands for "request and display", which is what this built-in syntax does.

This example is kept somewhat minimal - there are Rad features we could use to further improve this.

Some alternative valid invocations for this example:

-   `> commits amterp/rad`
-   `> commits --repo amterp/rad --limit 5`
-   `> commits --limit 5 --repo amterp/rad`
-   `> commits amterp/rad --limit 5`


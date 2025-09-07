title=AIAC (Artificial Intelligence Infrastructure-as-Code generator)
tags=ai, go, infrastructure, architecture, distribution
summary=A library and command line tool to generate IaC (Infrastructure as Code) templates, configurations, utilities, queries and more via LLM providers such as OpenAI, Amazon Bedrock and Ollama.
~~~~~~

[Source](https://github.com/gofireflyio/aiac)

## Use Cases and Example Prompts

### Generate IaC

- `aiac terraform for a highly available eks`
- `aiac pulumi golang for an s3 with sns notification`
- `aiac cloudformation for a neptundb`

### Generate Configuration Files

- `aiac dockerfile for a secured nginx`
- `aiac k8s manifest for a mongodb deployment`

### Generate CI/CD Pipelines

- `aiac jenkins pipeline for building nodejs`
- `aiac github action that plans and applies terraform and sends a slack notification`

### Generate Policy as Code

- `aiac opa policy that enforces readiness probe at k8s deployments`

### Generate Utilities

- `aiac python code that scans all open ports in my network`
- `aiac bash script that kills all active terminal sessions`

### Command Line Builder

- `aiac kubectl that gets ExternalIPs of all nodes`
- `aiac awscli that lists instances with public IP address and Name`

### Query Builder

- `aiac mongo query that aggregates all documents by created date`
- `aiac elastic query that applies a condition on a value greater than some value in aggregation`
- `aiac sql query that counts the appearances of each row in one table in another table based on an id column`

## Instructions

Before installing/running `aiac`, you may need to configure your LLM providers
or collect some information.

For **OpenAI**, you will need an API key in order for `aiac` to work. Refer to
[OpenAI's pricing model](https://openai.com/pricing?trk=public_post-text) for more information. If you're not using the API hosted
by OpenAI (for example, you may be using Azure OpenAI), you will also need to
provide the API URL endpoint.

For **Amazon Bedrock**, you will need an AWS account with Bedrock enabled, and
access to relevant models. Refer to the [Bedrock documentation](https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-bedrock.html)
for more information.

For **Ollama**, you only need the URL to the local Ollama API server, including
the /api path prefix. This defaults to http://localhost:11434/api. Ollama does
not provide an authentication mechanism, but one may be in place in case of a
proxy server being used. This scenario is not currently supported by `aiac`.

### Installation

Via `brew`:

    brew tap gofireflyio/aiac https://github.com/gofireflyio/aiac
    brew install aiac

Using `docker`:

    docker pull ghcr.io/gofireflyio/aiac

Using `go install`:

    go install github.com/gofireflyio/aiac/v5@latest

Alternatively, clone the repository and build from source:

    git clone https://github.com/gofireflyio/aiac.git
    go build

`aiac` is also available in the Arch Linux user repository (AUR) as [aiac](https://aur.archlinux.org/packages/aiac) (which
compiles from source) and [aiac-bin](https://aur.archlinux.org/packages/aiac-bin) (which downloads a compiled executable).

### Configuration

`aiac` is configured via a TOML configuration file. Unless a specific path is
provided, `aiac` looks for a configuration file in the user's [XDG_CONFIG_HOME](https://en.wikipedia.org/wiki/Freedesktop.org#User_directories)
directory, specifically `${XDG_CONFIG_HOME}/aiac/aiac.toml`. On Unix-like
operating systems, this will default to "~/.config/aiac/aiac.toml". If you want
to use a different path, provide the `--config` or `-c` flag with the file's path.

The configuration file defines one or more named backends. Each backend has a
type identifying the LLM provider (e.g. "openai", "bedrock", "ollama"), and
various settings relevant to that provider. Multiple backends of the same LLM
provider can be configured, for example for "staging" and "production"
environments.

Here's an example configuration file:

```toml
default_backend = "official_openai"   # Default backend when one is not selected

[backends.official_openai]
type = "openai"
api_key = "API KEY"
# Or 
# api_key = "$OPENAI_API_KEY"
default_model = "gpt-4o"              # Default model to use for this backend

[backends.azure_openai]
type = "openai"
url = "https://tenant.openai.azure.com/openai/deployments/test"
api_key = "API KEY"
api_version = "2023-05-15"            # Optional
auth_header = "api-key"               # Default is "Authorization"
extra_headers = { X-Header-1 = "one", X-Header-2 = "two" }

[backends.aws_staging]
type = "bedrock"
aws_profile = "staging"
aws_region = "eu-west-2"

[backends.aws_prod]
type = "bedrock"
aws_profile = "production"
aws_region = "us-east-1"
default_model = "amazon.titan-text-express-v1"

[backends.localhost]
type = "ollama"
url = "http://localhost:11434/api"     # This is the default
```

Notes:

1. Every backend can have a default model (via configuration key `default_model`).
   If not provided, calls that do not define a model will fail.
2. Backends of type "openai" can change the header used for authorization by
   providing the `auth_header` setting. This defaults to "Authorization", but
   Azure OpenAI uses "api-key" instead. When the header is either "Authorization"
   or "Proxy-Authorization", the header's value for requests will be "Bearer
   API_KEY". If it's anything else, it'll simply be "API_KEY".
3. Backends of type "openai" and "ollama" support adding extra headers to every
   request issued by aiac, by utilizing the `extra_headers` setting.

### Usage

Once a configuration file is created, you can start generating code and you only
need to refer to the name of the backend. You can use `aiac` from the command
line, or as a Go library.

#### Command Line

##### Listing Models

Before starting to generate code, you can list all models available in a
backend:

    aiac -b aws_prod --list-models

This will return a list of all available models. Note that depending on the LLM
provider, this may list models that aren't accessible or enabled for the
specific account.

##### Generating Code

By default, aiac prints the extracted code to standard output and opens an
interactive shell that allows conversing with the model, retrying requests,
saving output to files, copying code to clipboard, and more:

    aiac terraform for AWS EC2

This will use the default backend in the configuration file and the default
model for that backend, assuming they are indeed defined. To use a specific
backend, provide the `--backend` or `-b` flag:

    aiac -b aws_prod terraform for AWS EC2

To use a specific model, provide the `--model` or `-m` flag:

    aiac -m gpt-4-turbo terraform for AWS EC2

You can ask `aiac` to save the resulting code to a specific file:

    aiac terraform for eks --output-file=eks.tf

You can use a flag to save the full Markdown output as well:

    aiac terraform for eks --output-file=eks.tf --readme-file=eks.md

If you prefer aiac to print the full Markdown output to standard output rather
than the extracted code, use the `-f` or `--full` flag:

    aiac terraform for eks -f

You can use aiac in non-interactive mode, simply printing the generated code
to standard output, and optionally saving it to files with the above flags,
by providing the `-q` or `--quiet` flag:

    aiac terraform for eks -q

In quiet mode, you can also send the resulting code to the clipboard by
providing the `--clipboard` flag:

    aiac terraform for eks -q --clipboard

Note that aiac will not exit in this case until the contents of the clipboard
changes. This is due to the mechanics of the clipboard.

#### Via Docker

All the same instructions apply, except you execute a `docker` image:

    docker run \
        -it \
        -v ~/.config/aiac/aiac.toml:~/.config/aiac/aiac.toml \
        ghcr.io/gofireflyio/aiac terraform for ec2

#### As a Library

You can use `aiac` as a Go library:

```go
package main

import (
    "context"
    "log"
    "os"

    "github.com/gofireflyio/aiac/v5/libaiac"
)

func main() {
    aiac, err := libaiac.New() // Will load default configuration path.
                               // You can also do libaiac.New("/path/to/aiac.toml")
    if err != nil {
        log.Fatalf("Failed creating aiac object: %s", err)
    }

    ctx := context.TODO()

    models, err := aiac.ListModels(ctx, "backend name")
    if err != nil {
        log.Fatalf("Failed listing models: %s", err)
    }

    chat, err := aiac.Chat(ctx, "backend name", "model name")
    if err != nil {
        log.Fatalf("Failed starting chat: %s", err)
    }

    res, err = chat.Send(ctx, "generate terraform for eks")
    res, err = chat.Send(ctx, "region must be eu-central-1")
}
```


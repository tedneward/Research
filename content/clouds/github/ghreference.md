title=gh (Github CLI) command reference
tags=cloud, github, tool
summary=Output from the "gh reference" command (on 8 April 2022).
~~~~~~

# gh reference

## `gh alias <command>`

Create command shortcuts

### `gh alias delete <alias>`

Delete an alias

### `gh alias list`

List your aliases

### `gh alias set <alias> <expansion> [flags]`

Create a shortcut for a gh command

  -s, --shell   Declare an alias to be passed through a shell interpreter

## `gh api <endpoint> [flags]`

Make an authenticated GitHub API request

      --cache duration        Cache the response, e.g. "3600s", "60m", "1h"
  -F, --field key=value       Add a typed parameter in key=value format
  -H, --header key:value      Add a HTTP request header in key:value format
      --hostname string       The GitHub hostname for the request (default "github.com")
  -i, --include               Include HTTP response headers in the output
      --input file            The file to use as body for the HTTP request (use "-" to read from standard input)
  -q, --jq string             Query to select values from the response using jq syntax
  -X, --method string         The HTTP method for the request (default "GET")
      --paginate              Make additional HTTP requests to fetch all pages of results
  -p, --preview names         GitHub API preview names to request (without the "-preview" suffix)
  -f, --raw-field key=value   Add a string parameter in key=value format
      --silent                Do not print the response body
  -t, --template string       Format the response using a Go template

## `gh auth <command>`

Authenticate gh and git with GitHub

### `gh auth login [flags]`

Authenticate with a GitHub host

  -p, --git-protocol string   The protocol to use for git operations: {ssh|https}
  -h, --hostname string       The hostname of the GitHub instance to authenticate with
  -s, --scopes strings        Additional authentication scopes to request
  -w, --web                   Open a browser to authenticate
      --with-token            Read token from standard input

### `gh auth logout [flags]`

Log out of a GitHub host

  -h, --hostname string   The hostname of the GitHub instance to log out of

### `gh auth refresh [flags]`

Refresh stored authentication credentials

  -h, --hostname string   The GitHub host to use for authentication
  -s, --scopes strings    Additional authentication scopes for gh to have

### `gh auth setup-git [flags]`

Configure git to use GitHub CLI as a credential helper

  -h, --hostname string   The hostname to configure git for

### `gh auth status [flags]`

View authentication status

  -h, --hostname string   Check a specific hostname's auth status
  -t, --show-token        Display the auth token

## `gh browse [<number> | <path>] [flags]`

Open the repository in the browser

  -b, --branch string   Select another branch by passing in the branch name
  -c, --commit          Open the last commit
  -n, --no-browser      Print destination URL instead of opening the browser
  -p, --projects        Open repository projects
  -s, --settings        Open repository settings
  -w, --wiki            Open repository wiki

## `gh codespace`

Connect to and manage your codespaces

### `gh codespace code [flags]`

Open a codespace in Visual Studio Code

  -c, --codespace string   Name of the codespace
      --insiders           Use the insiders version of Visual Studio Code

### `gh codespace cp [-e] [-r] [-- [<scp flags>...]] <sources>... <dest>`

Copy files between local and remote file systems

  -c, --codespace string   Name of the codespace
  -e, --expand             Expand remote file names on remote shell
  -p, --profile string     Name of the SSH profile to use
  -r, --recursive          Recursively copy directories

### `gh codespace create [flags]`

Create a codespace

  -b, --branch string           repository branch
      --default-permissions     do not prompt to accept additional permissions requested by the codespace
      --idle-timeout duration   allowed inactivity before codespace is stopped, e.g. "10m", "1h"
  -m, --machine string          hardware specifications for the VM
  -r, --repo string             repository name with owner: user/repo
  -s, --status                  show status of post-create command and dotfiles

### `gh codespace delete [flags]`

Delete a codespace

      --all                Delete all codespaces
  -c, --codespace string   Name of the codespace
      --days N             Delete codespaces older than N days
  -f, --force              Skip confirmation for codespaces that contain unsaved changes
  -r, --repo repository    Delete codespaces for a repository

### `gh codespace edit [flags]`

Edit a codespace

  -c, --codespace string        Name of the codespace
  -d, --displayName string      display name
      --idle-timeout duration   allowed inactivity before codespace is stopped, e.g. "10m", "1h"
  -m, --machine string          hardware specifications for the VM

### `gh codespace list [flags]`

List your codespaces

  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -L, --limit int         Maximum number of codespaces to list (default 30)
  -t, --template string   Format JSON output using a Go template

### `gh codespace logs [flags]`

Access codespace logs

  -c, --codespace string   Name of the codespace
  -f, --follow             Tail and follow the logs

### `gh codespace ports [flags]`

List ports in a codespace

  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -t, --template string   Format JSON output using a Go template

#### `gh codespace ports forward <remote-port>:<local-port>...`

Forward ports

#### `gh codespace ports visibility <port>:{public|private|org}...`

Change the visibility of the forwarded port

### `gh codespace ssh [<flags>...] [-- <ssh-flags>...] [<command>]`

SSH into a codespace

  -c, --codespace string    Name of the codespace
      --config              Write OpenSSH configuration to stdout
  -d, --debug               Log debug data to a file
      --debug-file string   Path of the file log to
      --profile string      Name of the SSH profile to use
      --server-port int     SSH server port number (0 => pick unused)

### `gh codespace stop [flags]`

Stop a running codespace

  -c, --codespace string   Name of the codespace

## `gh completion -s <shell>`

Generate shell completion scripts

  -s, --shell string   Shell type: {bash|zsh|fish|powershell}

## `gh config <command>`

Manage configuration for gh

### `gh config get <key> [flags]`

Print the value of a given configuration key

  -h, --host string   Get per-host setting

### `gh config list [flags]`

Print a list of configuration keys and values

  -h, --host string   Get per-host configuration

### `gh config set <key> <value> [flags]`

Update configuration with a value for the given key

  -h, --host string   Set per-host setting

## `gh extension`

Manage gh extensions

### `gh extension create [<name>] [flags]`

Create a new extension

  --precompiled string   Create a precompiled extension. Possible values: go, other

### `gh extension install <repository> [flags]`

Install a gh extension from a repository

  --pin string   pin extension to a release tag or commit ref

### `gh extension list`

List installed extension commands

### `gh extension remove <name>`

Remove an installed extension

### `gh extension upgrade {<name> | --all} [flags]`

Upgrade installed extensions

  --all     Upgrade all extensions
  --force   Force upgrade extension

## `gh gist <command>`

Manage gists

### `gh gist clone <gist> [<directory>] [-- <gitflags>...]`

Clone a gist locally

### `gh gist create [<filename>... | -] [flags]`

Create a new gist

  -d, --desc string       A description for this gist
  -f, --filename string   Provide a filename to be used when reading from standard input
  -p, --public            List the gist publicly (default: secret)
  -w, --web               Open the web browser with created gist

### `gh gist delete {<id> | <url>}`

Delete a gist

### `gh gist edit {<id> | <url>} [<filename>] [flags]`

Edit one of your gists

  -a, --add string        Add a new file to the gist
  -d, --desc string       New description for the gist
  -f, --filename string   Select a file to edit

### `gh gist list [flags]`

List your gists

  -L, --limit int   Maximum number of gists to fetch (default 10)
      --public      Show only public gists
      --secret      Show only secret gists

### `gh gist view [<id> | <url>] [flags]`

View a gist

  -f, --filename string   Display a single file from the gist
      --files             List file names from the gist
  -r, --raw               Print raw instead of rendered gist contents
  -w, --web               Open gist in the browser

## `gh gpg-key <command>`

Manage GPG keys

### `gh gpg-key add [<key-file>]`

Add a GPG key to your GitHub account

### `gh gpg-key list`

Lists GPG keys in your GitHub account

## `gh issue <command>`

Manage issues

### `gh issue close {<number> | <url>}`

Close issue

### `gh issue comment {<number> | <url>} [flags]`

Add a comment to an issue

  -b, --body text        The comment body text
  -F, --body-file file   Read body text from file (use "-" to read from standard input)
  -e, --editor           Skip prompts and open the text editor to write the body in
  -w, --web              Open the web browser to write the comment

### `gh issue create [flags]`

Create a new issue

  -a, --assignee login   Assign people by their login. Use "@me" to self-assign.
  -b, --body string      Supply a body. Will prompt for one otherwise.
  -F, --body-file file   Read body text from file (use "-" to read from standard input)
  -l, --label name       Add labels by name
  -m, --milestone name   Add the issue to a milestone by name
  -p, --project name     Add the issue to projects by name
      --recover string   Recover input from a failed run of create
  -t, --title string     Supply a title. Will prompt for one otherwise.
  -w, --web              Open the browser to create an issue

### `gh issue delete {<number> | <url>}`

Delete issue

### `gh issue edit {<number> | <url>} [flags]`

Edit an issue

      --add-assignee login      Add assigned users by their login. Use "@me" to assign yourself.
      --add-label name          Add labels by name
      --add-project name        Add the issue to projects by name
  -b, --body string             Set the new body.
  -F, --body-file file          Read body text from file (use "-" to read from standard input)
  -m, --milestone name          Edit the milestone the issue belongs to by name
      --remove-assignee login   Remove assigned users by their login. Use "@me" to unassign yourself.
      --remove-label name       Remove labels by name
      --remove-project name     Remove the issue from projects by name
  -t, --title string            Set the new title.

### `gh issue list [flags]`

List issues in a repository

      --app string         Filter by GitHub App author
  -a, --assignee string    Filter by assignee
  -A, --author string      Filter by author
  -q, --jq expression      Filter JSON output using a jq expression
      --json fields        Output JSON with the specified fields
  -l, --label strings      Filter by label
  -L, --limit int          Maximum number of issues to fetch (default 30)
      --mention string     Filter by mention
  -m, --milestone string   Filter by milestone number or title
  -S, --search query       Search issues with query
  -s, --state string       Filter by state: {open|closed|all} (default "open")
  -t, --template string    Format JSON output using a Go template
  -w, --web                List issues in the web browser

### `gh issue reopen {<number> | <url>}`

Reopen issue

### `gh issue status [flags]`

Show status of relevant issues

  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -t, --template string   Format JSON output using a Go template

### `gh issue transfer {<number> | <url>} <destination-repo>`

Transfer issue to another repository

### `gh issue view {<number> | <url>} [flags]`

View an issue

  -c, --comments          View issue comments
  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -t, --template string   Format JSON output using a Go template
  -w, --web               Open an issue in the browser

## `gh label <command>`

Manage labels

### `gh label create <name> [flags]`

Create a new label

  -c, --color string         Color of the label, if not specified one will be selected at random
  -d, --description string   Description of the label

### `gh label list [flags]`

List labels in a repository

  -L, --limit int   Maximum number of items to fetch (default 30)
  -w, --web         List labels in the web browser

## `gh pr <command>`

Manage pull requests

### `gh pr checkout {<number> | <url> | <branch>} [flags]`

Check out a pull request in git

  -b, --branch string        Local branch name to use (default: the name of the head branch)
      --detach               Checkout PR with a detached HEAD
  -f, --force                Reset the existing local branch to the latest state of the pull request
      --recurse-submodules   Update all submodules after checkout

### `gh pr checks [<number> | <url> | <branch>] [flags]`

Show CI status for a single pull request

  -i, --interval --watch   Refresh interval in seconds when using --watch flag (default 10)
      --watch              Watch checks until they finish
  -w, --web                Open the web browser to show details about checks

### `gh pr close {<number> | <url> | <branch>} [flags]`

Close a pull request

  -d, --delete-branch   Delete the local and remote branch after close

### `gh pr comment [<number> | <url> | <branch>] [flags]`

Add a comment to a pull request

  -b, --body text        The comment body text
  -F, --body-file file   Read body text from file (use "-" to read from standard input)
  -e, --editor           Skip prompts and open the text editor to write the body in
  -w, --web              Open the web browser to write the comment

### `gh pr create [flags]`

Create a pull request

  -a, --assignee login       Assign people by their login. Use "@me" to self-assign.
  -B, --base branch          The branch into which you want your code merged
  -b, --body string          Body for the pull request
  -F, --body-file file       Read body text from file
  -d, --draft                Mark pull request as a draft
  -f, --fill                 Do not prompt for title/body and just use commit info
  -H, --head branch          The branch that contains commits for your pull request (default: current branch)
  -l, --label name           Add labels by name
  -m, --milestone name       Add the pull request to a milestone by name
      --no-maintainer-edit   Disable maintainer's ability to modify pull request
  -p, --project name         Add the pull request to projects by name
      --recover string       Recover input from a failed run of create
  -r, --reviewer handle      Request reviews from people or teams by their handle
  -t, --title string         Title for the pull request
  -w, --web                  Open the web browser to create a pull request

### `gh pr diff [<number> | <url> | <branch>] [flags]`

View changes in a pull request

  --color string   Use color in diff output: {always|never|auto} (default "auto")
  --patch          Display diff in patch format

### `gh pr edit [<number> | <url> | <branch>] [flags]`

Edit a pull request

      --add-assignee login      Add assigned users by their login. Use "@me" to assign yourself.
      --add-label name          Add labels by name
      --add-project name        Add the pull request to projects by name
      --add-reviewer login      Add reviewers by their login.
  -B, --base branch             Change the base branch for this pull request
  -b, --body string             Set the new body.
  -F, --body-file file          Read body text from file (use "-" to read from standard input)
  -m, --milestone name          Edit the milestone the pull request belongs to by name
      --remove-assignee login   Remove assigned users by their login. Use "@me" to unassign yourself.
      --remove-label name       Remove labels by name
      --remove-project name     Remove the pull request from projects by name
      --remove-reviewer login   Remove reviewers by their login.
  -t, --title string            Set the new title.

### `gh pr list [flags]`

List pull requests in a repository

      --app string        Filter by GitHub App author
  -a, --assignee string   Filter by assignee
  -A, --author string     Filter by author
  -B, --base string       Filter by base branch
  -d, --draft             Filter by draft state
  -H, --head string       Filter by head branch
  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -l, --label strings     Filter by label
  -L, --limit int         Maximum number of items to fetch (default 30)
  -S, --search query      Search pull requests with query
  -s, --state string      Filter by state: {open|closed|merged|all} (default "open")
  -t, --template string   Format JSON output using a Go template
  -w, --web               List pull requests in the web browser

### `gh pr merge [<number> | <url> | <branch>] [flags]`

Merge a pull request

      --admin            Use administrator privileges to merge a pull request that does not meet requirements
      --auto             Automatically merge only after necessary requirements are met
  -b, --body text        Body text for the merge commit
  -F, --body-file file   Read body text from file (use "-" to read from standard input)
  -d, --delete-branch    Delete the local and remote branch after merge
      --disable-auto     Disable auto-merge for this pull request
  -m, --merge            Merge the commits with the base branch
  -r, --rebase           Rebase the commits onto the base branch
  -s, --squash           Squash the commits into one commit and merge it into the base branch
  -t, --subject text     Subject text for the merge commit

### `gh pr ready [<number> | <url> | <branch>]`

Mark a pull request as ready for review

### `gh pr reopen {<number> | <url> | <branch>}`

Reopen a pull request

### `gh pr review [<number> | <url> | <branch>] [flags]`

Add a review to a pull request

  -a, --approve           Approve pull request
  -b, --body string       Specify the body of a review
  -F, --body-file file    Read body text from file (use "-" to read from standard input)
  -c, --comment           Comment on a pull request
  -r, --request-changes   Request changes on a pull request

### `gh pr status [flags]`

Show status of relevant pull requests

  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -t, --template string   Format JSON output using a Go template

### `gh pr view [<number> | <url> | <branch>] [flags]`

View a pull request

  -c, --comments          View pull request comments
  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -t, --template string   Format JSON output using a Go template
  -w, --web               Open a pull request in the browser

## `gh release <command>`

Manage releases

### `gh release create [<tag>] [<files>...]`

Create a new release

      --discussion-category string   Start a discussion of the specified category
  -d, --draft                        Save the release as a draft instead of publishing it
      --generate-notes               Automatically generate title and notes for the release
  -n, --notes string                 Release notes
  -F, --notes-file file              Read release notes from file (use "-" to read from standard input)
  -p, --prerelease                   Mark the release as a prerelease
      --target branch                Target branch or full commit SHA (default: main branch)
  -t, --title string                 Release title

### `gh release delete <tag> [flags]`

Delete a release

  -y, --yes   Skip the confirmation prompt

### `gh release delete-asset <tag> <asset-name> [flags]`

Delete an asset from a release

  -y, --yes   Skip the confirmation prompt

### `gh release download [<tag>] [flags]`

Download release assets

  -A, --archive format        Download the source code archive in the specified format (zip or tar.gz)
  -D, --dir string            The directory to download files into (default ".")
  -p, --pattern stringArray   Download only assets that match a glob pattern

### `gh release list [flags]`

List releases in a repository

  -L, --limit int   Maximum number of items to fetch (default 30)

### `gh release upload <tag> <files>... [flags]`

Upload assets to a release

  --clobber   Overwrite existing assets of the same name

### `gh release view [<tag>] [flags]`

View information about a release

  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -t, --template string   Format JSON output using a Go template
  -w, --web               Open the release in the browser

## `gh repo <command>`

Manage repositories

### `gh repo archive [<repository>] [flags]`

Archive a repository

  -y, --confirm   Skip the confirmation prompt

### `gh repo clone <repository> [<directory>] [-- <gitflags>...]`

Clone a repository locally

### `gh repo create [<name>] [flags]`

Create a new repository

  -c, --clone                 Clone the new repository to the current directory
  -d, --description string    Description of the repository
      --disable-issues        Disable issues in the new repository
      --disable-wiki          Disable wiki in the new repository
  -g, --gitignore string      Specify a gitignore template for the repository
  -h, --homepage URL          Repository home page URL
      --internal              Make the new repository internal
  -l, --license string        Specify an Open Source License for the repository
      --private               Make the new repository private
      --public                Make the new repository public
      --push                  Push local commits to the new repository
  -r, --remote string         Specify remote name for the new repository
  -s, --source string         Specify path to local repository to use as source
  -t, --team name             The name of the organization team to be granted access
  -p, --template repository   Make the new repository based on a template repository

### `gh repo delete [<repository>] [flags]`

Delete a repository

  --confirm   confirm deletion without prompting

### `gh repo deploy-key <command>`

Manage deploy keys in a repository

#### `gh repo deploy-key add <key-file> [flags]`

Add a deploy key to a GitHub repository

  -w, --allow-write    Allow write access for the key
  -t, --title string   Title of the new key

#### `gh repo deploy-key delete <key-id>`

Delete a deploy key from a GitHub repository

#### `gh repo deploy-key list`

List deploy keys in a GitHub repository

### `gh repo edit [<repository>] [flags]`

Edit repository settings

      --add-topic strings        Add repository topic
      --allow-forking            Allow forking of an organization repository
      --default-branch name      Set the default branch name for the repository
      --delete-branch-on-merge   Delete head branch when pull requests are merged
  -d, --description string       Description of the repository
      --enable-auto-merge        Enable auto-merge functionality
      --enable-issues            Enable issues in the repository
      --enable-merge-commit      Enable merging pull requests via merge commit
      --enable-projects          Enable projects in the repository
      --enable-rebase-merge      Enable merging pull requests via rebase
      --enable-squash-merge      Enable merging pull requests via squashed commit
      --enable-wiki              Enable wiki in the repository
  -h, --homepage URL             Repository home page URL
      --remove-topic strings     Remove repository topic
      --template                 Make the repository available as a template repository
      --visibility string        Change the visibility of the repository to {public,private,internal}

### `gh repo fork [<repository>] [-- <gitflags>...] [flags]`

Create a fork of a repository

  --clone                Clone the fork
  --fork-name string     Rename the forked repository
  --org string           Create the fork in an organization
  --remote               Add a git remote for the fork
  --remote-name string   Specify the name for the new remote (default "origin")

### `gh repo list [<owner>] [flags]`

List repositories owned by user or organization

      --archived          Show only archived repositories
      --fork              Show only forks
  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -l, --language string   Filter by primary coding language
  -L, --limit int         Maximum number of repositories to list (default 30)
      --no-archived       Omit archived repositories
      --private           Show only private repositories
      --public            Show only public repositories
      --source            Show only non-forks
  -t, --template string   Format JSON output using a Go template
      --topic string      Filter by topic

### `gh repo rename [<new-name>] [flags]`

Rename a repository

  -y, --confirm   skip confirmation prompt

### `gh repo sync [<destination-repository>] [flags]`

Sync a repository

  -b, --branch string   Branch to sync (default: main branch)
      --force           Hard reset the branch of the destination repository to match the source repository
  -s, --source string   Source repository

### `gh repo view [<repository>] [flags]`

View a repository

  -b, --branch string     View a specific branch of the repository
  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -t, --template string   Format JSON output using a Go template
  -w, --web               Open a repository in the browser

## `gh run <command>`

View details about workflow runs

### `gh run cancel [<run-id>]`

Cancel a workflow run

### `gh run download [<run-id>] [flags]`

Download artifacts generated by a workflow run

  -D, --dir string         The directory to download artifacts into (default ".")
  -n, --name stringArray   Only download artifacts that match any of the given names

### `gh run list [flags]`

List recent workflow runs

  -b, --branch string     Filter runs by branch
  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
  -L, --limit int         Maximum number of runs to fetch (default 20)
  -t, --template string   Format JSON output using a Go template
  -u, --user string       Filter runs by user who triggered the run
  -w, --workflow string   Filter runs by workflow

### `gh run rerun [<run-id>] [flags]`

Rerun a failed run

      --failed       Rerun only failed jobs, including dependencies
  -j, --job string   Rerun a specific job from a run, including dependencies

### `gh run view [<run-id>] [flags]`

View a summary of a workflow run

      --exit-status       Exit with non-zero status if run failed
  -j, --job string        View a specific job ID from a run
  -q, --jq expression     Filter JSON output using a jq expression
      --json fields       Output JSON with the specified fields
      --log               View full log for either a run or specific job
      --log-failed        View the log for any failed steps in a run or specific job
  -t, --template string   Format JSON output using a Go template
  -v, --verbose           Show job steps
  -w, --web               Open run in the browser

### `gh run watch <run-id> [flags]`

Watch a run until it completes, showing its progress

      --exit-status    Exit with non-zero status if run fails
  -i, --interval int   Refresh interval in seconds (default 3)

## `gh search <command>`

Search for repositories, issues, pull requests and users

### `gh search issues [<query>] [flags]`

Search for issues

      --app string             Filter by GitHub App author
      --archived               Restrict search to archived repositories
      --assignee string        Filter by assignee
      --author string          Filter by author
      --closed date            Filter on closed at date
      --commenter user         Filter based on comments by user
      --comments number        Filter on number of comments
      --created date           Filter based on created at date
      --include-prs            Include pull requests in results
      --interactions number    Filter on number of reactions and comments
      --involves user          Filter based on involvement of user
  -q, --jq expression          Filter JSON output using a jq expression
      --json fields            Output JSON with the specified fields
      --label strings          Filter on label
      --language string        Filter based on the coding language
  -L, --limit int              Maximum number of results to fetch (default 30)
      --locked                 Filter on locked conversation status
      --match strings          Restrict search to specific field of issue: {title|body|comments}
      --mentions user          Filter based on user mentions
      --milestone title        Filter by milestone title
      --no-assignee            Filter on missing assignee
      --no-label               Filter on missing label
      --no-milestone           Filter on missing milestone
      --no-project             Filter on missing project
      --order string           Order of results returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
      --owner string           Filter on owner
      --project number         Filter on project board number
      --reactions number       Filter on number of reactions
      --repo strings           Filter on repository
      --sort string            Sort fetched results: {comments|created|interactions|reactions|reactions-+1|reactions--1|reactions-heart|reactions-smile|reactions-tada|reactions-thinking_face|updated} (default "best-match")
      --state string           Filter based on state: {open|closed}
      --team-mentions string   Filter based on team mentions
  -t, --template string        Format JSON output using a Go template
      --updated date           Filter on last updated at date
      --visibility strings     Filter based on repository visibility: {public|private|internal}
  -w, --web                    Open the search query in the web browser

### `gh search prs [<query>] [flags]`

Search for pull requests

      --app string              Filter by GitHub App author
      --archived                Restrict search to archived repositories
      --assignee string         Filter by assignee
      --author string           Filter by author
  -B, --base string             Filter on base branch name
      --checks string           Filter based on status of the checks: {pending|success|failure}
      --closed date             Filter on closed at date
      --commenter user          Filter based on comments by user
      --comments number         Filter on number of comments
      --created date            Filter based on created at date
      --draft                   Filter based on draft state
  -H, --head string             Filter on head branch name
      --interactions number     Filter on number of reactions and comments
      --involves user           Filter based on involvement of user
  -q, --jq expression           Filter JSON output using a jq expression
      --json fields             Output JSON with the specified fields
      --label strings           Filter on label
      --language string         Filter based on the coding language
  -L, --limit int               Maximum number of results to fetch (default 30)
      --locked                  Filter on locked conversation status
      --match strings           Restrict search to specific field of issue: {title|body|comments}
      --mentions user           Filter based on user mentions
      --merged                  Filter based on merged state
      --merged-at date          Filter on merged at date
      --milestone title         Filter by milestone title
      --no-assignee             Filter on missing assignee
      --no-label                Filter on missing label
      --no-milestone            Filter on missing milestone
      --no-project              Filter on missing project
      --order string            Order of results returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
      --owner string            Filter on owner
      --project number          Filter on project board number
      --reactions number        Filter on number of reactions
      --repo strings            Filter on repository
      --review string           Filter based on review status: {none|required|approved|changes_requested}
      --review-requested user   Filter on user requested to review
      --reviewed-by user        Filter on user who reviewed
      --sort string             Sort fetched results: {comments|reactions|reactions-+1|reactions--1|reactions-smile|reactions-thinking_face|reactions-heart|reactions-tada|interactions|created|updated} (default "best-match")
      --state string            Filter based on state: {open|closed}
      --team-mentions string    Filter based on team mentions
  -t, --template string         Format JSON output using a Go template
      --updated date            Filter on last updated at date
      --visibility strings      Filter based on repository visibility: {public|private|internal}
  -w, --web                     Open the search query in the web browser

### `gh search repos [<query>] [flags]`

Search for repositories

      --archived                    Filter based on archive state
      --created date                Filter based on created at date
      --followers number            Filter based on number of followers
      --forks number                Filter on number of forks
      --good-first-issues number    Filter on number of issues with the 'good first issue' label
      --help-wanted-issues number   Filter on number of issues with the 'help wanted' label
      --include-forks string        Include forks in fetched repositories: {false|true|only}
  -q, --jq expression               Filter JSON output using a jq expression
      --json fields                 Output JSON with the specified fields
      --language string             Filter based on the coding language
      --license strings             Filter based on license type
  -L, --limit int                   Maximum number of repositories to fetch (default 30)
      --match strings               Restrict search to specific field of repository: {name|description|readme}
      --number-topics number        Filter on number of topics
      --order string                Order of repositories returned, ignored unless '--sort' flag is specified: {asc|desc} (default "desc")
      --owner string                Filter on owner
      --size string                 Filter on a size range, in kilobytes
      --sort string                 Sort fetched repositories: {forks|help-wanted-issues|stars|updated} (default "best-match")
      --stars number                Filter on number of stars
  -t, --template string             Format JSON output using a Go template
      --topic strings               Filter on topic
      --updated date                Filter on last updated at date
      --visibility strings          Filter based on visibility: {public|private|internal}
  -w, --web                         Open the search query in the web browser

## `gh secret <command>`

Manage GitHub secrets

### `gh secret list [flags]`

List secrets

  -a, --app string   List secrets for a specific application: {actions|codespaces|dependabot}
  -e, --env string   List secrets for an environment
  -o, --org string   List secrets for an organization
  -u, --user         List a secret for your user

### `gh secret remove <secret-name> [flags]`

Remove secrets

  -a, --app string   Remove a secret for a specific application: {actions|codespaces|dependabot}
  -e, --env string   Remove a secret for an environment
  -o, --org string   Remove a secret for an organization
  -u, --user         Remove a secret for your user

### `gh secret set <secret-name> [flags]`

Create or update secrets

  -a, --app string           Set the application for a secret: {actions|codespaces|dependabot}
  -b, --body string          The value for the secret (reads from standard input if not specified)
  -e, --env environment      Set deployment environment secret
  -f, --env-file file        Load secret names and values from a dotenv-formatted file
      --no-store             Print the encrypted, base64-encoded value instead of storing it on Github
  -o, --org organization     Set organization secret
  -r, --repos repositories   List of repositories that can access an organization or user secret
  -u, --user                 Set a secret for your user
  -v, --visibility string    Set visibility for an organization secret: {all|private|selected} (default "private")

## `gh ssh-key <command>`

Manage SSH keys

### `gh ssh-key add [<key-file>] [flags]`

Add an SSH key to your GitHub account

  -t, --title string   Title for the new key

### `gh ssh-key list`

Lists SSH keys in your GitHub account

## `gh status [flags]`

Print information about relevant issues, pull requests, and notifications across repositories

  -e, --exclude strings   Comma separated list of repos to exclude in owner/name format
  -o, --org string        Report status within an organization

## `gh workflow <command>`

View details about GitHub Actions workflows

### `gh workflow disable [<workflow-id> | <workflow-name>]`

Disable a workflow

### `gh workflow enable [<workflow-id> | <workflow-name>]`

Enable a workflow

### `gh workflow list [flags]`

List workflows

  -a, --all         Show all workflows, including disabled workflows
  -L, --limit int   Maximum number of workflows to fetch (default 50)

### `gh workflow run [<workflow-id> | <workflow-name>] [flags]`

Run a workflow by creating a workflow_dispatch event

  -F, --field key=value       Add a string parameter in key=value format, respecting @ syntax
      --json                  Read workflow inputs as JSON via STDIN
  -f, --raw-field key=value   Add a string parameter in key=value format
  -r, --ref string            The branch or tag name which contains the version of the workflow file you'd like to run

### `gh workflow view [<workflow-id> | <workflow-name> | <filename>] [flags]`

View the summary of a workflow

  -r, --ref string   The branch or tag name which contains the version of the workflow file you'd like to view
  -w, --web          Open workflow in the browser
  -y, --yaml         View the workflow yaml file


title=Ghostly
tags=tool, windows, language
summary=A GitHub notification client for Windows 10/11.
~~~~~~

[Website](https://ghostlyapp.net/) | [Source](https://github.com/patriksvensson/ghostly)

To get the most out of Ghostly, you can use the Ghostly Query Language (shortened GQL) to search among your pull request, issues, releases, vulnerabilities and commits. All queries made with GQL are local and does not require an internet connection.

### Examples

Query | Explanation
----- | ------------
`(org:microsoft OR org:cake-build) AND is:pullrequest AND is:open` | Return all open pull requests that originiated in a repository belonging to either the microsoft or cake-build organisation.
`is:pullrequest AND is:open AND !muted AND mentions:patriksvensson` | Return all open pullrequests that you haven't muted that mentions the user patriksvensson in the comment.


title=Github Actions
tags=tool, cloud, devops
summary=Server-side pipeline execution on the GitHub platform.
~~~~~~

[Docs](https://developer.github.com/actions/)

## Blogs
["Securing GitHub Actions with Trivy and Cosign"](https://blog.aquasec.com/trivy-github-actions-security-cicd-pipeline)

## Examples/references

https://github.com/half-ogre/github-actions: A collection of reusable GitHub Actions I use across my projects: 

### Actions

| Action | Description | Key Inputs | Key Outputs |
|--------|-------------|------------|-------------|
| [create-issue](./create-issue) | Create GitHub issues with standardized formatting and labels | `issue-title`, `issue-label`, `github-token` | `issue-number` |
| [find-issue](./find-issue) | Search for existing open issues by title to prevent duplicates | `issue-title`, `github-token` | `issue-number`, `issue-exists` |
| [close-issue](./close-issue) | Close issues with optional comments and proper state reasons | `issue-number`, `github-token`, `comment-body` (optional) | `comment-id` |
| [comment-issue](./comment-issue) | Add automated comments to existing issues | `issue-number`, `comment-body`, `github-token` | `comment-id` |
| [get-latest-semver-tag](./get-latest-semver-tag) | Get the latest semantic version tag from the current repository (supports pre-release and build metadata) | `prefix` (optional), `default-version` (optional) | `tag`, `version`, `major`, `minor`, `patch`, `prerelease`, `build`, `found` |
| [get-next-semver](./get-next-semver) | Calculate the next semantic version based on increment type | `current-version`, `increment-major` (optional), `increment-minor` (optional), `prefix` (optional) | `version`, `version-core`, `major`, `minor`, `patch`, `increment-type` |

Reference actions from this repository using the standard GitHub Actions syntax:

```yaml
- name: Create approval issue
  uses: half-ogre/github-actions/create-issue@main
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
    issue-title: "Deployment Approval Required"
    issue-label: "deployment-approval"
    issue-body: |
      Please review and approve this deployment.
```

For detailed documentation on each action, click the action name in the table above to view its individual README.

## Related projects
[act](https://github.com/nektos/act): Run your GitHub Actions locally. Uses Docker images to pull down and execute GitHub Actions as faithfully as possible on your local machine. (Possibly replacing your make/build files?) "When you run act it reads in your GitHub Actions from .github/workflows/ and determines the set of actions that need to be run. It uses the Docker API to either pull or build the necessary images, as defined in your workflow files and finally determines the execution path based on the dependencies that were defined. Once it has the execution path, it then uses the Docker API to run containers for each action based on the images prepared earlier. The environment variables and filesystem are all configured to match what GitHub provides."



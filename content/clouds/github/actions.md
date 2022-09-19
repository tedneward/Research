title=Github Actions
tags=tool, cloud, devops
summary=Server-side pipeline execution on the GitHub platform.
~~~~~~

[Docs](https://developer.github.com/actions/)

## Blogs
["Securing GitHub Actions with Trivy and Cosign"](https://blog.aquasec.com/trivy-github-actions-security-cicd-pipeline)



## Related projects
[act](https://github.com/nektos/act): Run your GitHub Actions locally. Uses Docker images to pull down and execute GitHub Actions as faithfully as possible on your local machine. (Possibly replacing your make/build files?) "When you run act it reads in your GitHub Actions from .github/workflows/ and determines the set of actions that need to be run. It uses the Docker API to either pull or build the necessary images, as defined in your workflow files and finally determines the execution path based on the dependencies that were defined. Once it has the execution path, it then uses the Docker API to run containers for each action based on the images prepared earlier. The environment variables and filesystem are all configured to match what GitHub provides."



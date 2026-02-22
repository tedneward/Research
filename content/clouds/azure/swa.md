title=Azure Static Web Apps (SWA)
tags=cloud, azure, tool, presentation
summary=All-in-One Local Development Tool For Azure Static Web Apps.
~~~~~~

[Website](https://azure.github.io/static-web-apps-cli/)

The Static Web Apps (SWA) CLI is an open-source commandline tool that streamlines local development and deployment for Azure Static Web Apps.

## Installing the CLI

**See:** [@azure/static-web-apps-cli](https://www.npmjs.com/package/@azure/static-web-apps-cli) .

1.  To install this globally, use:

```
npm install -g @azure/static-web-apps-cli
```

##### Note

You can also install the SWA CLI inside a project (instead of globally) as a development dependency using:

```
npm install -D @azure/static-web-apps-cli
```

## Validate the install

Installing the package will make the **`swa`** command available on your development machine. To validate your install, you can check the installed version with:

```
swa --version# Should print out the version number
```

## Basic usage

The best way to get started is to run the `swa` command alone and follow the interactive prompts.

```
swa
```

It will generate a configuration for you, then build your project and ask if you want to deploy it to Azure.

See [swa](https://azure.github.io/static-web-apps-cli/docs/cli/swa) for more details.

## Extended usage

Here are the currently supported `swa` commands. Use `swa <command> --help` to learn about options and usage for that particular command.

-   [`login`](https://azure.github.io/static-web-apps-cli/docs/cli/swa-login): login into Azure
-   [`init`](https://azure.github.io/static-web-apps-cli/docs/cli/swa-init): initialize a new static web app project
-   [`start`](https://azure.github.io/static-web-apps-cli/docs/cli/swa-start): start the emulator from a directory or bind to a dev server
-   [`deploy`](https://azure.github.io/static-web-apps-cli/docs/cli/swa-deploy): deploy the current project to Azure Static Web Apps
-   [`build`](https://azure.github.io/static-web-apps-cli/docs/cli/swa-build): build your project

## Run using npx

The [npx](https://docs.npmjs.com/cli/v7/commands/npx) command (aka "npm exec") lets you run an arbitrary command from a local or remote npm package. If the command was not installed globally on the device, this installs it for you in a central cache - making it a useful option if you want to use different versions of the same command on the local device.

You can run any Static Web Apps CLI commands directly using npx. For example:

```
npx @azure/static-web-apps-cli --version
```

Or use this command to start the emulator:

```
npx @azure/static-web-apps-cli start
```


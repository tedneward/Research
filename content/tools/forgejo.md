title=Forgejo
tags=tool, cloud, backend
summary=Open-source cloud repository tool platform built around Git.
~~~~~~

[Website](https://forgejo.org/) | [Source](https://codeberg.org/forgejo/forgejo) | [Docs](https://forgejo.org/docs/latest/)

Forgejo is a self-hosted lightweight software forge. Easy to install and low maintenance, it just does the job.

Built in Go, looks like.

# [Delightful Forgejo](https://codeberg.org/teaserbot-labs/delightful)

## Official resources
Resources maintained as part of the primary Forgejo project.
- [![][forgejo] Forgejo website](https://forgejo.org/)
- [![][forgejo] Forgejo documentation](https://forgejo.org/docs/latest/)
- [![][forgejo] Forgejo issue tracker](https://codeberg.org/forgejo/forgejo)
- [![][forgejo] Forgejo releases](https://forgejo.org/releases) ([RSS feed](https://forgejo.org/releases/rss.xml); [Release notes](https://codeberg.org/forgejo/forgejo/src/branch/forgejo/RELEASE-NOTES.md))
- [![][forgejo] Forgejo runner](https://code.forgejo.org/forgejo/runner)
- [![][forgejo] Forgejo container images](https://codeberg.org/forgejo/-/packages/container/forgejo/versions)
- [![][forgejo] Forgejo Mastodon account](https://floss.social/@forgejo)
- [![][forgejo] Forgejo identity proofs (Keyoxide)](https://keyoxide.org/contact@forgejo.org)


## Documentation
In addition to [![][forgejo] Forgejo's official documentation](https://forgejo.org/docs/latest/), the following resources may be useful.

- [Codeberg documentation](https://docs.codeberg.org/) - contains some Codeberg-specific parts but is mostly applicable to every Forgejo instance.
- [Gitea documentation](https://docs.gitea.io/) - mostly applicable to Forgejo as well as Gitea.

### Tutorials
- [Forgejo in a nutshell](https://devforum.roblox.com/t/forgejo-in-a-nutshell/2505867) - guide to setup Forgejo.
- [Forgejo with LFS behind a VPN](https://blog.gibson.sh/2023/05/28/server-with-wireguard-and-forgejo/) - guide to set up a Linux web server running Forgejo, Git-LFS, and a Wireguard VPN.
- [UberLab installation guide](https://lab.uberspace.de/guide_forgejo/) - Forgejo installation guide for [Uberspace](https://uberspace.de/).
- [Setting up a Self-Hosted Forgejo Actions Runner with Docker Compose](https://linus.dev/posts/setting-up-a-self-hosted-forgejo-actions-runner-with-docker-compose/).
- [Running a runner for codeberg/forgejo on RHEL9 (Red Hat Enterprise Linux) with podman as user systemd service](https://jan.wildeboer.net/2024/08/Running-a-runner-codeberg/)

## Public instances
Forgejo instances with open registration.
- [Codeberg](https://codeberg.org) - free and open *for FOSS projects only*, run by a German non-profit organization. Also provides hosted Woodpecker (CI) and Weblate (localisation).
- [CodeFloe](https://codefloe.com) - free and open. Legally operated by [devXY](https://devxy.io), a Swiss DevOps company. Open to community engagement and management.
  Provides Crow CI and Forgejo Actions for CI/CD and a [Forum](https://forum.codefloe.com) for public user discussions.
- [Disroot](https://disroot.org/en/services/git) - a platform providing online services based on principles of freedom, privacy, federation and decentralization. Also provides many other free hosted services.
- [pub.solar](https://git.pub.solar) - Register/Login via [pub.solar ID](https://auth.pub.solar), run by a German tech collective with the goal to enable more people to use free software, have secure digital communications, and to take control over their private data.
- [KaKi's git](https://git.kaki87.net) - free and open, run by a French web developer.
- [sij.ai](https://sij.ai) - Free and open platform run by a public interest environmental lawyer that is open for anyone but especially intended for AI-ML hobbyists & enthusiasts.
- [git.gay](https://git.gay/) - instance run by [Besties](https://besties.house/), a queer collective. Uses modified version of Forgejo.
- [bolha.dev](https://bolha.dev/) - instance run by [bolha.us](https://bolha.us/), and [bolha.io](https://bolha.io/) a Brazilian IT collective. Running the vanilla version.


## Packaging
Platform-specific packages to easily install and update Forgejo on your system. These are generally maintained either by distro packagers or by community volunteers.

<a href="https://repology.org/project/forgejo/versions">
	<img src="https://repology.org/badge/vertical-allrepos/forgejo.svg" alt="Packaging status" align="right" />
</a>

Also see [forgejo package versions on Repology](https://repology.org/project/forgejo/versions).
- **Alpine**
	- [Alpine community `forgejo` package](https://pkgs.alpinelinux.org/packages?name=forgejo)
	- [Alpine community `forgejo-lts` package](https://pkgs.alpinelinux.org/packages?name=forgejo-lts)
- **Arch Linux**
	- [Arch extra `forgejo` package](https://archlinux.org/packages/extra/x86_64/forgejo)
<!-- - **AOSC OS**
	- 👻 [AOSC OS stable `forgejo` package](https://packages.aosc.io/packages/forgejo)-->
- **Debian/Ubuntu**
	- [Unofficial `forgejo-deb` packages + repo](https://codeberg.org/forgejo-contrib/forgejo-deb) <img src="https://codeberg.org/forgejo-contrib/forgejo-deb/badges/release.svg" alt="package version">
- **Fedora**
	- [Fedora `forgejo` package](https://packages.fedoraproject.org/pkgs/forgejo/)
	- [RPM copr repo](https://copr.fedorainfracloud.org/coprs/mdwalters/forgejo/) <img src="https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fcopr.fedorainfracloud.org%2Fapi_3%2Fpackage%2F%3Fownername%3Dmdwalters%26projectname%3Dforgejo%26packagename%3Dforgejo%26with_latest_build%3Dfalse%26with_latest_succeeded_build%3Dfalse&query=%24.builds.latest_succeeded.source_package.version&label=version" alt="package version">
- **FreeBSD**
	- [Port `www/forgejo` / package `forgejo`](https://www.freshports.org/www/forgejo) - binary packages available in latest and quarterly 2024Q2 or newer.
- **Gentoo**
	- [Gentoo GURU `www-apps/forgejo` package](https://gitweb.gentoo.org/repo/proj/guru.git/tree/www-apps/forgejo)
- **Kubernetes**
	- [Helm chart](https://codeberg.org/forgejo-contrib/forgejo-helm) - Helm chart for Forgejo, forked from the official Gitea helm chart
	- [c4k-forgejo](https://repo.prod.meissa.de/meissa/c4k-forgejo) - Convention 4 Kubernetes, generates a kubernetes manifest for Forgejo including backup & monitoring.
- **NixOS**
	- [NixOS `forgejo` service](https://nixos.org/manual/nixos/stable/options#opt-services.forgejo.enable)
- **Snapcraft**
	- [Unofficial `forgejo` snap package](https://codeberg.org/forgejo-contrib/snap) - building in [launchpad](https://launchpad.net/~popey/forgejo-snap/+snap/forgejo-snap) <img src="https://snapcraft.io/forgejo/badge.svg" alt="package version">
- **Termux (Android)**
	- [Termux `forgejo` package](https://github.com/termux/termux-packages/tree/master/packages/forgejo)
- **YunoHost**
	- [YunoHost package](https://github.com/YunoHost-Apps/forgejo_ynh) - install Forgejo quickly and simply on a YunoHost server
<!-- - **Cloudron**
	- 👻 [Cloudron package](https://codeberg.org/bart/forgejo-app) - Install Forgejo on a Cloudron server-->


## CI/CD

CI/CD tools that integrate via Forgejo officially or inofficially.

- [Forgejo Actions](#forgejo-actions) - the integrated CI/CD solution with external runners. See below.
- [Woodpecker CI](https://woodpecker-ci.org/) - a community-maintained powerful CI/CD based on Docker containers, historically forked from Drone CI.
	- [Crow CI](https://crowci.dev/) - a soft-fork of Woodpecker CI.
- [Jenkins](https://www.jenkins.io/) - an extensible CI/CD with a large plugin ecosystem.
	- [Gitea Plugin](https://plugins.jenkins.io/gitea/) - use Jenkins with Forgejo (API-compatible to Gitea).
	- [Gitea Checks Plugin](https://plugins.jenkins.io/gitea-checks/) - use Forgejo status checks with Jenkins.
- [yoyo Sourcehut CI bridge](https://codeberg.org/emersion/yojo) - develop on Forgejo and run builds within the Sourcehut CI.
- [agola](https://agola.io/) - containerized and flexible CI/CD platform.
- [Buildbot](https://www.buildbot.net/) - a flexible CI/CD framework. Can be used [with a plugin](https://github.com/lab132/buildbot-gitea).
- [mvoCI](https://codeberg.org/snaums/mvoCI) - a simple and personal CI/CD solution.


## Forgejo Actions
Learn about Forgejo actions in the [![][forgejo] Actions admin guide](https://forgejo.org/docs/latest/admin/actions/) and [![][forgejo] Actions user guide](https://forgejo.org/docs/latest/user/actions/).

### Actions runners
- [![][forgejo] Forgejo runner](https://code.forgejo.org/forgejo/runner) - supports LXC & Docker & shell with binaries for GNU/Linux (amd64, arm64)
- [act runner](https://gitea.com/gitea/act_runner) - supports Docker & shell with binaries for GNU/Linux (amd64, arm64, arm[567]), FreeBSD, Windows, MacOS

### Actions runner deployment tools
- [forgejo-hetzner-runner](https://codeberg.org/pierreprinetti/forgejo-hetzner-runner) - Deploy Forgejo Actions runners on Hetzner infrastructure
- [helm-chart](https://codeberg.org/wrenix/helm-charts/src/branch/main/forgejo-runner) - Deploy a Forgejo Actions runner on the specified Forgejo instance

### Actions
- [trust-self-signed-cert](https://code.forgejo.org/Seltsamsel/trust-self-signed-cert) - Trust a self-signed SSL certificate for future operations (e.g. checkout action).
- [forgejo-todo-checker](https://codeberg.org/kemitix/forgejo-todo-checker) - Checks your source files for TODO and FIXME comments, where they don't have an open issue number.
- [forgejo-commit-path-rules](https://codeberg.org/kemitix/forgejo-commit-path-rules) - Enforce consistency between commit messages and file changes in your repository.
- [Native-CI](https://codeberg.org/Native-CI/) - A collection of actions for helping maintain native projects (C/C++/...) that may require cross-platform builds.

## Clients

### CMS (Content Management System)
- [Sveltia CMS](https://github.com/sveltia/sveltia-cms) - Configurable admin panel for static site generator authoring.
- [DecapCMS](https://decapcms.org/docs/gitea-backend/) ([repo](https://github.com/decaporg/decap-cms)) - Configurable admin panel for static site generator authoring.

### Mobile
- [GitNex](https://gitnex.com/) ([repo](https://codeberg.org/gitnex/GitNex)) - Android client for Forgejo and Gitea (`Android – GPL`)
- 👻 [GitTouch](https://github.com/git-touch/git-touch) - Mobile client for Forgejo, Gitea, GitHub, GitLab, Bitbucket (`Android, iOS – Apache`)

### Command-line
- [codeberg-cli](https://codeberg.org/Aviac/codeberg-cli) - CLI tool for Forgejo similar to `gh`, `glab` and `tea` (`cross-platform - AGPL`)
- [forgejo-cli](https://codeberg.org/forgejo-contrib/forgejo-cli) - CLI tool for interacting with Forgejo (`cross-platform - Apache/MIT`)
- [![][forgejo] forgejo-curl](https://code.forgejo.org/forgejo/forgejo-curl) - a thin curl wrapper that helps with Forgejo authentication
- [tea](https://gitea.com/gitea/tea) - the official Gitea CLI client, works with Forgejo (`cross-platform – MIT`)

### Emacs
- [fj.el](https://codeberg.org/martianh/fj.el) - a basic Emacs client for Forgejo.


## Tools

### Infrastructure as Code
- [Terraform & Ansible playbook](https://forgejo.dev/forgejo.dev/infrastructure-as-code/) - Deploy Forgejo, Minio, Nginx & Woodpecker in the cloud via [Docker Compose](https://docs.docker.com/compose/), depends on related [geerlingguy](https://github.com/geerlingguy) playbooks.
- [Terraform Provider for Forgejo](https://registry.terraform.io/providers/svalabs/forgejo/latest/docs) - Allows managing resources (organizations, repositories, users) within Forgejo.
- [Ansible Collection l3d.git.gitea](https://galaxy.ansible.com/ui/repo/published/l3d/git/content/role/gitea/) - Ansible collection to install and configure forgejo.

### Monitoring
- [Monitoring plugin to check Forgejo instance upgrade status](https://gitea.zionetrix.net/bn8/check_forgejo_upgrade) has the sources and is published in the [Icinga exchange repository](https://exchange.icinga.com/brenard/check_forgejo_upgrade).

### Bots
- 👻 [gitcat](https://codeberg.org/spla/gitcat.git) - Python script that allows sign-up to a Forgejo instance to all local users of a Mastodon server. (`Python - GPLv3`)
- [Renovate](https://docs.renovatebot.com/modules/platform/gitea/#gitea-and-forgejo) - Dependency update tool (similar to dependabot) with Forgejo support. (`TypeScript - AGPLv3`)
- [Nayrah](https://codeberg.org/kita/nayrah) - A Discord bot that retrieves various information from a Forgejo instance like Codeberg. (`Python - AGPLv3`)
- 👻 [forgejo-guardian](https://git.4rs.nl/awiteb/forgejo-guardian) - Simple Forgejo instance guardian, banning users and alerting admins based on certain regular expressions. (`Rust - AGPLv3`)
- [git-next](https://codeberg.org/kemitix/git-next) - Trunk-based development manager (with Forgejo & Github support).

### Scripts
- [github2gitea/github2forgejo](https://github.com/maxkratz/github2gitea-mirror) - Bash script that creates mirrors for various GitHub resources like orgs, users and starred repos (incl. private repos). (`Bash - AGPLv3`)
- [Enhancements for Forgejo](https://git.kaki87.net/KaKi87/userscripts/src/branch/master/enhancementsForForgejo/README.md) - Violentmonkey userscript that adds minor UX improvements to the web UI. (`JavaScript - MIT`)

### Package deployment
- [lein-forgejo-wagon](https://codeberg.org/rome-user/lein-forgejo-wagon) - Leiningen plugin for deployment and downloading of JARs in Maven repositories hosted on Forgejo packages.

### API client libraries
- [Cyborus/forgejo-api](https://codeberg.org/Cyborus/forgejo-api) - Rust crate to interact with the Forgejo API (`Rust - Apache or MIT`)
- [harabat/pyforgejo](https://codeberg.org/harabat/pyforgejo) - Python client library to interact with the Forgejo API (`Python - MIT`)
- [mvdkleijn/forgejo-sdk](https://codeberg.org/mvdkleijn/forgejo-sdk) - Go client library to interact with the Forgejo API (fork of [gitea/go-sdk](https://gitea.com/gitea/go-sdk)) (`Go - MIT`)
- [forgejo-js](https://codeberg.org/anbraten/forgejo-js) - JavaScript / Typescript
 library to interact with the Forgejo API (fork of [gitea-js](https://github.com/anbraten/gitea-js)) (`JavaScript / Typescript - MIT`)

## Forks
Actively maintained Forgejo forks.

- [Fordj](https://fordj.org/) - a git-based design-platform for the AEC (Architecture, Engineering and Construction).
- [Forgejo-aneksajo](https://codeberg.org/forgejo-aneksajo/forgejo-aneksajo/) - (temporary) fork of Forgejo that adds an integration with git-annex.

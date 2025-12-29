title=Caddy
tags=distribution, tool, homelab
summary=Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS.
~~~~~~

[Website](https://caddyserver.com/) | [Source](https://github.com/caddyserver/caddy) | [Docs](https://caddyserver.com/docs/)

Every site on HTTPS. Caddy is an extensible server platform that uses TLS by default.

## [Features](https://caddyserver.com/features)

- **Easy configuration** with the [Caddyfile](https://caddyserver.com/docs/caddyfile)
- **Powerful configuration** with its [native JSON config](https://caddyserver.com/docs/json/)
- **Dynamic configuration** with the [JSON API](https://caddyserver.com/docs/api)
- [**Config adapters**](https://caddyserver.com/docs/config-adapters) if you don't like JSON
- **Automatic HTTPS** by default
	- [ZeroSSL](https://zerossl.com) and [Let's Encrypt](https://letsencrypt.org) for public names
	- Fully-managed local CA for internal names & IPs
	- Can coordinate with other Caddy instances in a cluster
	- Multi-issuer fallback
	- Encrypted ClientHello (ECH) support
- **Stays up when other servers go down** due to TLS/OCSP/certificate-related issues
- **Production-ready** after serving trillions of requests and managing millions of TLS certificates
- **Scales to hundreds of thousands of sites** as proven in production
- **HTTP/1.1, HTTP/2, and HTTP/3** all supported by default
- **Highly extensible** [modular architecture](https://caddyserver.com/docs/architecture) lets Caddy do anything without bloat
- **Runs anywhere** with **no external dependencies** (not even libc)
- Written in Go, a language with higher **memory safety guarantees** than other servers
- Actually **fun to use**
- So much more to [discover](https://caddyserver.com/features)

## Install

The simplest, cross-platform way to get started is to download Caddy from [GitHub Releases](https://github.com/caddyserver/caddy/releases) and place the executable file in your PATH.

## Quick start

The [Caddy website](https://caddyserver.com/docs/) has documentation that includes tutorials, quick-start guides, reference, and more.

**We recommend that all users -- regardless of experience level -- do our [Getting Started](https://caddyserver.com/docs/getting-started) guide to become familiar with using Caddy.**

If you've only got a minute, [the website has several quick-start tutorials](https://caddyserver.com/docs/quick-starts) to choose from! However, after finishing a quick-start tutorial, please read more documentation to understand how the software works. 🙂

## Overview

Caddy is most often used as an HTTPS server, but it is suitable for any long-running Go program. First and foremost, it is a platform to run Go applications. Caddy "apps" are just Go programs that are implemented as Caddy modules. Two apps -- `tls` and `http` -- ship standard with Caddy.

Caddy apps instantly benefit from [automated documentation](https://caddyserver.com/docs/json/), graceful on-line [config changes via API](https://caddyserver.com/docs/api), and unification with other Caddy apps.

Although [JSON](https://caddyserver.com/docs/json/) is Caddy's native config language, Caddy can accept input from [config adapters](https://caddyserver.com/docs/config-adapters) which can essentially convert any config format of your choice into JSON: Caddyfile, JSON 5, YAML, TOML, NGINX config, and more.

The primary way to configure Caddy is through [its API](https://caddyserver.com/docs/api), but if you prefer config files, the [command-line interface](https://caddyserver.com/docs/command-line) supports those too.

Caddy exposes an unprecedented level of control compared to any web server in existence. In Caddy, you are usually setting the actual values of the initialized types in memory that power everything from your HTTP handlers and TLS handshakes to your storage medium. Caddy is also ridiculously extensible, with a powerful plugin system that makes vast improvements over other web servers.

To wield the power of this design, you need to know how the config document is structured. Please see [our documentation site](https://caddyserver.com/docs/) for details about [Caddy's config structure](https://caddyserver.com/docs/json/).

Nearly all of Caddy's configuration is contained in a single config document, rather than being scattered across CLI flags and env variables and a configuration file as with other web servers. This makes managing your server config more straightforward and reduces hidden variables/factors.

## Reading

### Articles

* [Why I use Caddy for every self-hosted service I run](https://www.xda-developers.com/why-i-use-caddy-for-every-self-hosted-service/)

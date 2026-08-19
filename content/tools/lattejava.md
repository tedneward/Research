title=Latte Java
tags=tool, jvm
summary=Make Java simple and easy to use.
~~~~~~

[Website](https://lattejava.org/) | [Source](https://github.com/latte-java)

## Getting Started

### 1\. Install Java

```bash
curl -fsSL https://lattejava.org/javaenv/install | bash
```

```bash
javaenv install 25
```

```bash
javaenv global 25
```

### 2\. Install Latte

```bash
curl -fsSL https://lattejava.org/cli/install | bash
```

### 3\. Create a project

```bash
mkdir my-project && cd my-project
```

```bash
latte init
```

_Write some code…._

### 4\. Login into Latte

```bash
latte login
```

### 5\. Create a Group

Visit [https://app.lattejava.org/app/groups/new](https://app.lattejava.org/app/groups/new) to create your Group in the Latte repository.

_If you use a reverse-DNS Group, you’ll also need to verify your domain._

### 6\. Release & public the project

```bash
latte release
```

That’s it!

## Subprojects

### [javaenv](https://lattejava.org/javaenv/)

Manage multiple Java versions on your machine

### [groovyenv](https://lattejava.org/groovyenv/)

Manage multiple Groovy versions on your machine

### [cli](https://lattejava.org/cli/)

A Java project management tool

### [web](https://lattejava.org/web/)

A simple, yet powerful, web framework for Java

### [jwt](https://lattejava.org/jwt/)

Fast and easy JSON Web Token library for Java

### [json](https://lattejava.org/json/)

A small, hardened JSON library for Java 25 with compile-time codegen — no reflection, nothing on your runtime path

### [http](https://lattejava.org/http/)

A zero-dependency HTTP server for Java, powered by virtual threads

### [database](https://lattejava.org/database/)

SQL migrations for Java — a zero-dependency runner that applies versioned scripts in order, at build time or on startup


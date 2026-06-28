title=Latte Java
tags=platform, jvm
summary=Make Java simple and easy to use.
~~~~~~

[Website](https://lattejava.org/) | [Source](https://github.com/latte-java)

## Getting Started

1. Install Java

```
curl -fsSL https://lattejava.org/javaenv/install | bash
javaenv install 25
javaenv global 25
```

2. Install Latte

`curl -fsSL https://lattejava.org/cli/install | bash`

3. Create a project

```
mkdir my-project && cd my-project
latte init
```

Write some code….

4. Login into Latte

`latte login`

5. Create a Group

Visit https://app.lattejava.org/app/groups/new to create your Group in the Latte repository.

If you use a reverse-DNS Group, you’ll also need to verify your domain.

6. Release & public the project

```
latte release
```

That’s it!

Your project will now have a tag based on the version in project.latte and it will be released to the Latte repository for the world to enjoy.

## Projects

* javaenv: Manage multiple Java versions on your machine
* groovyenv: Manage multiple Groovy versions on your machine
* cli: A Java project management tool
* web: A simple, yet powerful, web framework for Java
* jwt: Fast and easy JSON Web Token library for Java
* json: A small, hardened JSON library for Java 25 with compile-time codegen — no reflection, nothing on your runtime path
* http: A zero-dependency HTTP server for Java, powered by virtual threads


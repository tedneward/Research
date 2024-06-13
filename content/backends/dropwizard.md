title=Dropwizard
tags=backend, jvm
summary=A Java framework for developing ops-friendly, high-performance, RESTful web services.
~~~~~~

[Website](https://dropwizard.io/) | [Source](https://github.com/dropwizard/dropwizard)

## [Getting Started](https://www.dropwizard.io/en/stable/getting-started.html)
Dropwizard straddles the line between being a library and a framework. Its goal is to provide performant, reliable implementations of everything a production-ready web application needs. Because this functionality is extracted into a reusable library, your application remains lean and focused, reducing both time-to-market and maintenance burdens.

* ***Jetty for HTTP***: Because you can’t be a web application without HTTP, Dropwizard uses the Jetty HTTP library to embed an incredibly tuned HTTP server directly into your project. Instead of handing your application off to a complicated application server, Dropwizard projects have a main method which spins up an HTTP server. Running your application as a simple process eliminates a number of unsavory aspects of Java in production (no PermGen issues, no application server configuration and maintenance, no arcane deployment tools, no class loader troubles, no hidden application logs, no trying to tune a single garbage collector to work with multiple application workloads) and allows you to use all of the existing Unix process management tools instead.

* ***Jersey for REST***: For building RESTful web applications, we’ve found nothing beats Jersey (the JAX-RS reference implementation) in terms of features or performance. It allows you to write clean, testable classes which gracefully map HTTP requests to simple Java objects. It supports streaming output, matrix URI parameters, conditional GET requests, and much, much more.

* ***Jackson for JSON***: In terms of data formats, JSON has become the web’s lingua franca, and Jackson is the king of JSON on the JVM. In addition to being lightning fast, it has a sophisticated object mapper, allowing you to export your domain models directly.

* ***Metrics for metrics***: The Metrics library rounds things out, providing you with unparalleled insight into your code’s behavior in your production environment.

* ***And Friends***: In addition to Jetty, Jersey, and Jackson, Dropwizard also includes a number of libraries to help you ship more quickly and with fewer regrets.

    * Logback and slf4j for performant and flexible logging.
    * Hibernate Validator, the JSR 349 reference implementation, provides an easy, declarative framework for validating user input and generating helpful and i18n-friendly error messages.
    * The Apache HttpClient and Jersey client libraries allow for both low- and high-level interaction with other web services.
    * JDBI is the most straightforward way to use a relational database with Java.
    * Liquibase is a great way to keep your database schema in check throughout your development and release cycles, applying high-level database refactorings instead of one-off DDL scripts.
    * Freemarker and Mustache are simple templating systems for more user-facing applications.

Now that you’ve gotten the lay of the land, let’s dig in!

### Creating a Configuration Class

```
package com.example.helloworld;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.dropwizard.core.Configuration;
import jakarta.validation.constraints.NotEmpty;

public class HelloWorldConfiguration extends Configuration {
    @NotEmpty
    private String template;

    @NotEmpty
    private String defaultName = "Stranger";

    @JsonProperty
    public String getTemplate() {
        return template;
    }

    @JsonProperty
    public void setTemplate(String template) {
        this.template = template;
    }

    @JsonProperty
    public String getDefaultName() {
        return defaultName;
    }

    @JsonProperty
    public void setDefaultName(String name) {
        this.defaultName = name;
    }
}
```

### Creating an Application Class

```
package com.example.helloworld;

import io.dropwizard.core.Application;
import io.dropwizard.core.setup.Bootstrap;
import io.dropwizard.core.setup.Environment;

public class HelloWorldApplicationStart extends Application<HelloWorldConfiguration> {
    public static void main(String[] args) throws Exception {
        new HelloWorldApplicationStart().run(args);
    }

    @Override
    public String getName() {
        return "hello-world";
    }

    @Override
    public void initialize(Bootstrap<HelloWorldConfiguration> bootstrap) {
        // nothing to do yet
    }

    @Override
    public void run(HelloWorldConfiguration configuration, Environment environment) {
        // nothing to do yet
    }
}
```

### Creating a Representation Class
For 
```
{
  "id": 1,
  "content": "Hi!"
}
```
we build
```
package com.example.helloworld.api;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Saying {
    private long id;
    private String content;

    public Saying() {
        // Jackson deserialization
    }

    public Saying(long id, String content) {
        this.id = id;
        this.content = content;
    }

    @JsonProperty
    public long getId() {
        return id;
    }

    @JsonProperty
    public String getContent() {
        return content;
    }
}
```

### Creating a Resource Class

```
package com.example.helloworld.resources;

import com.codahale.metrics.annotation.Timed;
import com.example.helloworld.api.Saying;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicLong;

@Path("/hello-world")
@Produces(MediaType.APPLICATION_JSON)
public class HelloWorldResource {
    private final String template;
    private final String defaultName;
    private final AtomicLong counter;

    public HelloWorldResource(String template, String defaultName) {
        this.template = template;
        this.defaultName = defaultName;
        this.counter = new AtomicLong();
    }

    @GET
    @Timed
    public Saying sayHello(@QueryParam("name") Optional<String> name) {
        final String value = String.format(template, name.orElse(defaultName));
        return new Saying(counter.incrementAndGet(), value);
    }
}
```

### Registering a Resource

```
HelloWorldResource resource = new HelloWorldResource(
        configuration.getTemplate(),
        configuration.getDefaultName()
);
environment.jersey().register(resource);
```

### Creating a Health Check

```
package com.example.helloworld.health;

import com.codahale.metrics.health.HealthCheck;

public class TemplateHealthCheck extends HealthCheck {
    private final String template;

    public TemplateHealthCheck(String template) {
        this.template = template;
    }

    @Override
    protected Result check() throws Exception {
        final String saying = String.format(template, "TEST");
        if (!saying.contains("TEST")) {
            return Result.unhealthy("template doesn't include a name");
        }
        return Result.healthy();
    }
}
```

### Adding a Health Check
```
TemplateHealthCheck healthCheck = new TemplateHealthCheck(configuration.getTemplate());
environment.healthChecks().register("template", healthCheck);
```


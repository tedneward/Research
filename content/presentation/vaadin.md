title=Vaadin
tags=presentation, library, jvm, browser
summary=A open source Java web app development platform for Java. With Vaadin, your UI code runs securely on the server, right next to your business logic that you can access with native Java API. Vaadin takes care of routing and server-client communication transparently, quickly, and securely, so you can focus on what matters - building a great app for your users.
~~~~~~

[Website](https://vaadin.com/) | [Tutorials](https://vaadin.com/learn/tutorials) | [Source](https://github.com/vaadin/)

## [Vaadin Flow](https://vaadin.com/flow) ([Source](https://github.com/vaadin/flow))
*The Java framework binding Vaadin web components to Java. This is part of Vaadin 10+ Platform for building modern web sites that look great, perform well and make you and your users happy.* "Vaadin Flow is an open-source framework for building web apps in Java. You build your app from UI components without ever having to touch HTML or JavaScript."

```
@Route("hello-world")
public class HelloWorld extends VerticalLayout {

    public HelloWorld() {
        TextField name = new TextField("Name");
        Paragraph greeting = new Paragraph("");

        Button button = new Button("Greet", event -> {
            greeting.setText("Hello " + name.getValue());
        });

        add(name, button, greeting);
    }
}
```

## [Vaadin Fusion](https://vaadin.com/fusion) 
*A TypeScript and Java web framework for building modern web applications. You can create UIs in TypeScript and connect to any backend through endpoints written in Java.* "Vaadin Fusion is a framework that helps you rapidly deliver beautiful reactive client-side web apps using TypeScript with a Java backend."

```ts
@SpringBootApplication
    @PWA(name = "Fusion App", shortName = "Fusion", offlineResources = {"images/logo.png"})
    public class Application extends SpringBootServletInitializer implements AppShellConfigurator {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

// --- Server ---

@Endpoint
public class TodoEndpoint {
    private TodoRepository repo;

    // Repository autowired by Spring
    public TodoEndpoint(TodoRepository repo) {
        this.repo = repo;
    }

    // Publish a typed endpoint
    public List>Todo< getTodos() {
        return repo.findAll();
    }
}

// --- Client ---

// Call the backend in TypeScript
const todos: Todo[] = await TodoEndpoint.getTodos();
```

**Reactive views with declarative templates**; Vaadin Fusion has a reactive programming model based on [Lit](https://lit.dev/). 

* The declarative template is automatically updated when the application state changes. 
* Lit uses a simple template syntax based on standard JavaScript.
* Fusion comes with built-in support for [MobX](https://mobx.js.org/) for application state management. 

```
@customElement('hello-world-view')
export class HelloWorldView extends View {
  @state() name = '';
  @state() allNames: string[] = [];

  render() {
    return html`
      <h1>Greetings!</h1>
      <ul>
        ${this.allNames.map((name) => html`<li>Hello, ${name}</li>`)}
        <li>
          <vaadin-text-field
            placeholder="Your name"
            .value=${this.name}
            @value-changed=${this.nameChanged}
          ></vaadin-text-field>
          <vaadin-button @click=${this.addGreeting}>Add name</vaadin-button>
        </li>
      </ul>
    `;
  }

  nameChanged(e: CustomEvent) {
    this.name = e.detail.value;
  }

  addGreeting() {
    this.allNames = [...this.allNames, this.name];
    this.name = '';
  }
}
```

## Vaadin Framework ([Source](https://github.com/vaadin/framework))
*Vaadin 8 and Vaadin 7, both of which use GWT as the base of client-side implementations.* 


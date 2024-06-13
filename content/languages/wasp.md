title=Wasp
tags=language, browser, nodejs
summary=Web Application Specification Language. Extensible DSL (domain-specific language) for building modern web apps with less code.
~~~~~~

[Website](https://wasp-lang.dev) | [Source](https://github.com/wasp-lang/wasp) | [HN](https://news.ycombinator.com/item?id=26091956) 

Builds on top of [React](/presentation/react), NodeJS, and [Prisma](/libraries/prisma)

Example: [ToDo app](https://github.com/wasp-lang/wasp/tree/main/examples/tutorials/TodoApp)
```
app TodoApp {
  title: "Todo app",

  auth: {
    userEntity: User,
    methods: [ EmailAndPassword ],
    onAuthFailedRedirectTo: "/login"
  },

  dependencies: [
    ("react-clock", "3.0.0")
  ]
}

route RootRoute { path: "/", to: MainPage }
page MainPage {
  authRequired: true,
  component: import Main from "@ext/MainPage.js"
}

route SignupRoute { path: "/signup", to: SignupPage }
page SignupPage {
  component: import Signup from "@ext/SignupPage"
}

route LoginRoute { path: "/login", to: LoginPage }
page LoginPage {
  component: import Login from "@ext/LoginPage"
}

entity User {=psl
    id          Int     @id @default(autoincrement())
    email       String  @unique
    password    String
    tasks       Task[]
psl=}

entity Task {=psl
    id          Int     @id @default(autoincrement())
    description String
    isDone      Boolean @default(false)
    user        User?    @relation(fields: [userId], references: [id])
    userId      Int?
psl=}

query getTasks {
  fn: import { getTasks } from "@ext/queries.js",
  entities: [Task]
}

action createTask {
  fn: import { createTask } from "@ext/actions.js",
  entities: [Task]
}

action updateTask {
  fn: import { updateTask } from "@ext/actions.js",
  entities: [Task]
}
```


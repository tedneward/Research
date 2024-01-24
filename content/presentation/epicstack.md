title=EPIC stack
tags=library, presentation, browser
summary=Javascript/Web project starter stack.
~~~~~~

[Website](https://www.epicweb.dev/epic-stack) | [Source](https://github.com/epicweb-dev/epic-stack)

The primary goal of the Epic Stack is to help your team get over analysis paralysis by giving you solid opinions for technologies to use to build your web application. The Epic Stack is really two things:

* A project starter
* A reference implementation

For those of you starting a new project, you can use the `create-remix CLI` custom stacks feature to bootstrap your app with `npx create-remix@latest --typescript --install --template epicweb-dev/epic-stack` and you’ll be set.

With that context, here are a few things you get today:

* Remix is the Web Framework of choice
* Fly app deployment with Docker
* Multi-region, distributed, production-ready SQLite Database with LiteFS.
* Healthcheck endpoint for Fly backups region fallbacks
* Grafana Dashboards of the running app
* GitHub Actions with testing and deploy on merge for both production and staging environments
* Email/Password Authentication with cookie-based sessions
* Transaction email with Mailgun and forgot password/password reset support.
* Progressively Enhanced and fully type safe forms with Conform
* Database ORM with Prisma
* Role-based User Permissions.
* Custom built image hosting
* Caching via cachified: Both in-memory and SQLite-based (with better-sqlite3)
* Styling with Tailwind
* An excellent, customizable component library with Radix UI
* End-to-end testing with Playwright
* Local third party request mocking with MSW
* Unit testing with Vitest and Testing Library with pre-configured Test Database
* Code formatting with Prettier
* Linting with ESLint
* Static Types with TypeScript
* Runtime schema validation with zod


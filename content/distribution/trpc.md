title=tRPC
tags=distribution, javascript
summary=Typescript-centric client/server RPC over HTTP.
~~~~~~

[Website](https://trpc.io/) | [Source](https://github.com/trpc/trpc)

## Examples

Minimal Node.js:
```
import { createTRPCClient, httpBatchLink } from '@trpc/client';
import type { AppRouter } from '../server';
import './polyfill';

const trpc = createTRPCClient<AppRouter>({
  links: [
    httpBatchLink({
      url: 'http://localhost:3000',
    }),
  ],
});

async function main() {
  /**
   * Inferring types
   */
  const users = await trpc.userList.query();
  console.log('Users:', users);

  const createdUser = await trpc.userCreate.mutate({ name: 'sachinraja' });
  console.log('Created user:', createdUser);

  const user = await trpc.userById.query('1');
  console.log('User 1:', user);
}

main().catch(console.error);
```

```
import { createHTTPServer } from '@trpc/server/adapters/standalone';
import { z } from 'zod';
import { db } from './db';
import { publicProcedure, router } from './trpc';

const appRouter = router({
  userList: publicProcedure.query(async () => {
    // Retrieve users from a datasource, this is an imaginary database
    const users = await db.user.findMany();
    return users;
  }),
  userById: publicProcedure.input(z.string()).query(async (opts) => {
    const { input } = opts;
    // Retrieve the user with the given ID
    const user = await db.user.findById(input);
    return user;
  }),
  userCreate: publicProcedure
    .input(z.object({ name: z.string() }))
    .mutation(async (opts) => {
      const { input } = opts;
      // Create a new user in the database
      const user = await db.user.create(input);
      return user;
    }),
});

// Export type router type signature,
// NOT the router itself.
export type AppRouter = typeof appRouter;

const server = createHTTPServer({
  router: appRouter,
});

server.listen(3000);
```

---

# Awesome tRPC

## 🧩 Extensions & community add-ons

### Extensions

| Description                                                                    | Link                                                 |
| ------------------------------------------------------------------------------ | ---------------------------------------------------- |
| tRPC panel automatically generates a UI for manually testing your tRPC backend | https://github.com/iway1/trpc-panel                  |
| tRPC-OpenAPI - OpenAPI & REST support for your tRPC routers                    | https://github.com/jlalmes/trpc-openapi              |
| tRPC Client Devtools browser extension                                         | https://github.com/rhenriquez28/trpc-client-devtools |
| tRPC Playground - sandbox for testing tRPC queries in the browser              | https://github.com/sachinraja/trpc-playground        |
| tRPC-Chrome - Web extensions messaging support for tRPC                        | https://github.com/jlalmes/trpc-chrome               |
| Step CI - Automated API Testing and Quality Assurance                          | https://github.com/stepci/stepci                     |
| msw-trpc - tRPC support for MSW                                                | https://github.com/maloguertin/msw-trpc              |

### Frontend frameworks

| Description                               | Link                                         |
| ----------------------------------------- | -------------------------------------------- |
| tRPC-SvelteKit - SvelteKit tRPC extension | https://github.com/icflorescu/trpc-sveltekit |
| tRPC-Remix - Adapter for Remix            | https://github.com/ggrandi/trpc-remix        |
| tRPC Client For SolidJS W/ Solid Query    | https://github.com/OrJDev/solid-trpc         |
| tRPC API Handler For SolidStart           | https://github.com/OrJDev/solid-start-trpc   |
| tRPC-nuxt - Nuxt 3 module                 | https://github.com/wobsoriano/trpc-nuxt      |

### Bootstrappers

| Description                                                                                         | Link                                            |
| --------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| create-t3-app - Scaffold a starter project using the T3 Stack (Next.js, tRPC, Tailwind CSS, Prisma) | https://create.t3.gg                            |
| sidebase - Scaffold a starter project using sidebase (Nuxt 3, tRPC, Tailwind CSS, Prisma)           | https://sidebase.io                             |
| Create JD App - Scaffold a starter project using the JD Stack (SolidStart, tRPC, Tailwind, Prisma)  | https://github.com/OrJDev/create-jd-app         |
| Create tRPC App - Create tRPC-powered apps with one command                                         | https://github.com/omar-dulaimi/create-trpc-app |
| viteRPC - Monorepo template powered by Vite (Vite, tRPC, Tailwind CSS)                              | https://github.com/mnik01/viteRPC               |

### Library adapters

| Description                                                                                         | Link                                                                  |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| tRPC-uWebSockets - Adapter for uWebSockets.js server                                                | https://github.com/romanzy-1612/trpc-uwebsockets                      |
| jotai-trpc - Jotai wrapper around tRPC vanilla client                                               | https://github.com/jotai-labs/jotai-trpc                              |
| @h4ad/serverless-adapter - Connect tRPC with AWS SQS, AWS API Gateway, and many more event sources. | https://viniciusl.com.br/serverless-adapter/docs/main/frameworks/trpc |
| trpc-koa-adapter - tRPC adapter for Koa server                                                      | https://github.com/BlairCurrey/trpc-koa-adapter                       |
| tRPC - iron-session                                                                                 | https://github.com/parkgang/trpc-iron-session                         |
| electron-trpc - Electron support for tRPC                                                           | https://github.com/jsonnull/electron-trpc                             |
| cloudflare-pages-plugin-trpc - Quickly create a tRPC server with a Cloudflare Pages Function        | https://github.com/toyamarinyon/cloudflare-pages-plugin-trpc          |
| ZenStack - Full-stack toolkit adds access control to Prisma and generates trpc routers from schema  | https://github.com/zenstackhq/zenstack                                |
| tRPC-SWR - tRPC adapter for Vercel's SWR client                                                     | https://trpc-swr.vercel.app/                                          |
| trpc-rtk-query - Automatically generate RTK Query api endpoints from your tRPC setup                | https://github.com/otahontas/trpc-rtk-query                           |
| k6-trpc - k6 compatible tRPC client                                                                 | https://github.com/dextertanyj/k6-trpc                                |
| trpc-token-refresh-link - Link to refresh access tokens and refresh tokens                          | https://github.com/larskarbo/trpc-token-refresh-link                  |
| trpc-bun-adapter - tRPC adapter for Bun runtime environment                                         | https://github.com/cah4a/trpc-bun-adapter                             |

## 🍀 Starting points, example projects, etc

| Description                                                                                             | Link                                                            |
| ------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| **Recommended:** Starter project with Prisma, Next.js, tRPC, E2E-testing                                | https://github.com/trpc/examples-next-prisma-starter            |
| **create-t3-turbo** - Clean and simple starter repo using the T3 Stack along with Expo React Native     | http://github.com/t3-oss/create-t3-turbo                        |
| **create-t3-app** - Scaffold a starter project using the T3 Stack (Next.js, tRPC, Tailwind CSS, Prisma) | https://create.t3.gg                                            |
| WebSockets Starter Project                                                                              | https://github.com/trpc/examples-next-prisma-starter-websockets |
| tRPC Kitchen Sink - A collection of tRPC usage patterns.                                                | https://github.com/trpc/examples-kitchen-sink                   |
| Turborepo + Expo + tRPC Starter                                                                         | https://github.com/gunnnnii/turbo-expo-trpc-starter             |
| tRPC-SvelteKit Example Application                                                                      | https://github.com/icflorescu/trpc-sveltekit-example            |
| tRPC + Ultra                                                                                            | https://github.com/sachinraja/trpc-ultra                        |
| Nx Monorepo + tRPC + Prisma                                                                             | https://github.com/nowlena/nx-trpc-test                         |
| tRPC (w/ Fetch Adapter) + SvelteKit + Tailwind CSS                                                      | https://github.com/austins/trpc-sveltekit-fetchadapter-example  |
| Sign-In With Ethereum tRPC + ViteJS React                                                               | https://github.com/codingwithmanny/trpc-siwe-monorepo           |
| tRPC + Vue3 todo example project (tRPC, Express.js, Vue3, Prisma, vue-query)                            | https://github.com/guushamann/Todo-tRPC-Vue3                    |
| Vite + Svelte + tRPC                                                                                    | https://github.com/mishankov/vite-svelte-trpc                   |
| V3 - A T3 Inspired Nuxt Stack                                                                           | https://github.com/CRBroughton/V3                               |
| sidebase - Scaffold a starter project using sidebase (Nuxt 3, tRPC, Tailwind CSS, Prisma)               | https://sidebase.io                                             |
| Twitter clone - A simple Twitter clone built with T3 Stack + NextAuth + Supabase + Prisma               | https://github.com/AlandSleman/t3-twitter-clone                 |
| Separate backend & frontend repositories                                                                | https://github.com/mkosir/trpc-api-boilerplate                  |
| tRPC + Deno + fresh                                                                                     | https://github.com/LunaTK/fresh-trpc-example                    |

## 🏁 Open-source projects using tRPC

| Description                                                                                                                                  | Link                                                |
| -------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| [Cal.com](https://cal.com) - Scheduling infrastructure                                                                                       | https://github.com/calcom/cal.com                   |
| [Skill Recordings](https://github.com/skillrecordings/products) - Hosting courses by Matt Pocock, Kent C Dodds, Dan Abramov, and many others | https://github.com/skillrecordings/products         |
| [SST](https://sst.dev) - A framework that makes it easy to build serverless apps.                                                            | https://github.com/serverless-stack/sst             |
| [Beam](https://planetscale.com/blog/introducing-beam) - A simple message board for your organization or project.                             | https://github.com/planetscale/beam                 |
| [Rallly](https://rallly.co) - Self-hostable doodle poll alternative.                                                                         | https://github.com/lukevella/rallly                 |
| [Hilde](http://hilde.gg) - Match-making app for games like foosball, air hockey and similar                                                  | https://github.com/nehalist/hilde                   |
| [Answer Overflow](https://www.answeroverflow.com/) - Discord bot that indexes help channel content into Google                               | https://github.com/AnswerOverflow/AnswerOverflow    |
| [Prisma Editor](https://prisma-editor.vercel.app/) - Powerful tool to visualize and edit Prisma Schema                                       | https://github.com/mohammed-bahumaish/prisma-editor |
| [Saleor Apps](https://saleor.io/) - Official apps/integrations for Saleor Commerce                                                           | https://github.com/saleor/apps                      |
| [Rao Pics App](https://github.com/rao-pics/rao-pics) - Visit Photo on any device. Supported MacOS/Windows                                    | https://github.com/rao-pics/rao-pics                |

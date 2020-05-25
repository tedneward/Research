title=Deno
tags=platform, nodejs
summary=A NodeJS-esque platform using V8 seeking to fix some of Node's quirks.
~~~~~~

"Deno is a simple, modern and secure runtime for JavaScript and TypeScript that uses V8 and is built in Rust.

* Secure by default. No file, network, or environment access, unless explicitly enabled.
* Supports TypeScript out of the box.
* Ships only a single executable file.
* Has built-in utilities like a dependency inspector (deno info) and a code formatter (deno fmt).
* Has a set of reviewed (audited) standard modules that are guaranteed to work with Deno.

"Try running a simple program: `deno run https://deno.land/std/examples/welcome.ts`

"Or a more complex one:

```
import { serve } from "https://deno.land/std@0.53.0/http/server.ts";
const s = serve({ port: 8000 });
console.log("http://localhost:8000/");
for await (const req of s) {
  req.respond({ body: "Hello World\n" });
}
```

[Website](https://deno.land/) | [Manual](https://deno.land/manual) and [Standard Library Docs](https://deno.land/std) | [Github](https://github.com/denoland)

Cannot help but notice that "deno" is an anagram of "node".

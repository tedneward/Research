title=Supertokens
tags=security, cloud, distribution, service
summary=Open source alternative to Auth0 / Firebase Auth / AWS Cognito.
~~~~~~

[Website](https://supertokens.com/) | [Source](https://github.com/supertokens/supertokens-core) | [Docs](https://supertokens.io/docs/community/introduction)

Supertokens architecture is optimized to add secure authentication for your users without compromising on user and developer experience

Three building blocks of SuperTokens architecture

* Frontend SDK: Manages session tokens and renders login UI widgets
* Backend SDK: Provides APIs for sign-up, sign-in, signout, session refreshing, etc. Your Frontend will talk to these APIs
* SuperTokens Core: The HTTP service for the core auth logic and database operations. This service is used by the Backend SDK

SuperTokens is an open-core alternative to proprietary login providers like Auth0 or AWS Cognito. We are different because we offer:

- Open source: SuperTokens can be used for free, forever, with no limits on the number of users.
- An on-premises deployment so that you control 100% of your user data, using your own database.
- An end-to-end solution with login, sign-ups, user and session management, without all the complexities of OAuth protocols.
- Ease of implementation and higher security.
- Extensibility: Anyone can contribute and make SuperTokens better!

### Philosophy

Authentication directly affects the UX, dev experience, and security of any app. We believe that current solutions cannot optimize for all three "pillars", leading to many applications hand-rolling their own auth. This not only leads to security issues but is also a massive time drain.

We want to change that - we believe the only way is to provide a solution that has the right level of abstraction gives you maximum control, is secure, and is simple to use - just like if you build it yourself, from scratch (minus the time to learn, build, and maintain).

We also believe in the principle of least vendor lock-in. Your having full control of your user's data means that you can switch away from SuperTokens without forcing your existing users to logout, reset their passwords, or in the worst case, sign up again.

---

# SuperTokens and "vanilla" JS

[Docs](https://supertokens.com/docs/web-js/index.html) | [Source](https://github.com/supertokens/supertokens-web-js)

Using SuperTokens with vanilla JS involves two main parts: the frontend using the `supertokens-web-js` SDK and a backend that uses a SuperTokens Backend SDK (for Node.js, Python, Go, etc.). 

Installation: `npm i -s supertokens-website`

Usage:
```
supertokens.init({
    apiDomain: "<URL to your auth backend>"
});
```



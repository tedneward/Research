title=OAuth
tags=format, distribution, security, authentication
summary=Specification for third-party authentication.
~~~~~~

Specifications: [RFC 6749](https://datatracker.ietf.org/doc/html/rfc6749) and [RFC 6750](https://datatracker.ietf.org/doc/html/rfc6750) - Grants and access tokens | [RFC 7519](https://datatracker.ietf.org/doc/html/rfc7519) - JSON Web Tokens (JWTs) - see also [RFC 7515](https://datatracker.ietf.org/doc/html/rfc7515), [RFC 7516](https://datatracker.ietf.org/doc/html/rfc7516), [RFC 7517](https://datatracker.ietf.org/doc/html/rfc7517), [RFC 7518](https://datatracker.ietf.org/doc/html/rfc7518) and [RFC 7520](https://datatracker.ietf.org/doc/html/rfc7520) | [RFC 7662](https://datatracker.ietf.org/doc/html/rfc7662) - introspection/access token verification | [RFC 7636](https://datatracker.ietf.org/doc/html/rfc7636) - PKCE

Specialized standards: 

* [RFC 8252](https://datatracker.ietf.org/doc/html/rfc8252) discusses OAuth grants and mobile applications. Since mobile applications cannot maintain secrets and each application has a high level of control over the user input, there are certain additional steps you must take to ensure security. This is especially important if the client and the IdP are not controlled by the same organization.
* [RFC 7591](https://datatracker.ietf.org/doc/html/rfc7591), dynamic client registration, allows clients to register themselves. In core OAuth, client registration occurs rarely and is typically done in a manual manner. With this RFC, clients can discover everything they need to register themselves. This is useful when you want to have many unique clients.
* [RFC 8628](https://datatracker.ietf.org/doc/html/rfc8628) creates an additional grant, the device grant, designed specifically for clients that have limited user input options, such as televisions or other appliances. With this grant, people may log in using a secondary input device, such as a computer or phone, and still have the original client receive the access token.
* [RFC 9068](https://datatracker.ietf.org/doc/html/rfc9068) covers how to specify JWT access tokens in a standard format, allowing different IdPs and resource servers to interoperate.
* [DPoP](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-dpop-04)/[MTLS](https://datatracker.ietf.org/doc/html/rfc8705) addresses an issue left unresolved with the core token RFC, 6750, because of implementation complexity. These documents (the former of which is a draft, not a full-fledged RFC) outline how to bind a token to a particular client. Each of these uses a different mechanism, but if the idea of a bearer token being stolen and used by a malicious actor is unacceptable to you or your security team, using these can help.

[OAuth2 Security Best Practices](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics-19)

[OAuth IETF Working Group](https://datatracker.ietf.org/wg/oauth/about/)

[What is OAuth? A Breakdown for Beginners](https://nordicapis.com/oauth-a-breakdown-for-beginners/)

## Reading

Dan Moore

* ["The complete guide to protecting your APIs with OAuth2"](https://stackoverflow.blog/2022/12/22/the-complete-guide-to-protecting-your-apis-with-oauth2/)
* ["The Authorization Code grant in excrutiating detail"](https://stackoverflow.blog/2022/04/14/the-authorization-code-grant-in-excruciating-detail/)

## Future

[OAuth 2.1](https://oauth.net/2.1/) - This specification consolidates best practices around security and usability which have been added to OAuth over the years since it was released. The authors have explicitly ruled out any breaking changes or radical modifications.

[GNAP](https://oauth.net/gnap/) - A reimagination of the OAuth protocol, in the same way that OAuth2 was a reimagining of earlier protocols. This early draft includes breaking changes such as introducing new software actors and changing the core communication format from form parameters to JSON.



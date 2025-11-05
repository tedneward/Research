title=Web Security
tags=security
summary=Collections of links about security on the WWW.
~~~~~~

### Organizations

- [OWASP](http://www.owasp.org) - The Open Web Application Security Project (OWASP) is a 501(c)(3) worldwide not-for-profit charitable organization focused on improving the security of software.
- [Portswigger](https://portswigger.net) - PortSwigger offers tools for web application security, testing & scanning. Choose from a wide range of security tools & identify the very latest vulnerabilities.

### Web Application Firewall

- [ModSecurity](http://www.modsecurity.org/) - ModSecurity is a toolkit for real-time web application monitoring, logging, and access control.
- [BunkerWeb](https://github.com/bunkerity/bunkerweb) - BunkerWeb is a full-featured open-source web server with ModeSecurity WAF, HTTPS with transparent Let's Encrypt renewal, automatic ban of strange behaviors based on HTTP codes, bot and bad IPs block, connection limits, state-of-the-art security presets, Web UI and much more.
- [NAXSI](https://github.com/nbs-system/naxsi) - NAXSI is an open-source, high performance, low rules maintenance WAF for NGINX, NAXSI means Nginx Anti Xss & Sql Injection.
- [sql_firewall](https://github.com/uptimejp/sql_firewall) SQL Firewall Extension for PostgreSQL
- [ironbee](https://github.com/ironbee/ironbee) - IronBee is an open source project to build a universal web application security sensor. IronBee as a framework for developing a system for securing web applications - a framework for building a web application firewall (WAF).
- [Curiefense](https://github.com/curiefense/curiefense) - Curiefense adds a broad set of automated web security tools, including a WAF to Envoy Proxy.
- [open-appsec](https://github.com/openappsec/openappsec) - open-appsec is an open source machine-learning security engine that preemptively and automatically prevents threats against Web Application & APIs.

### Scanning / Pentesting

- [Spyse](https://spyse.com/) - Spyse is an OSINT search engine that provides fresh data about the entire web. All the data is stored in its own DB for instant access and interconnected with each other for flexible search.
Provided data: IPv4 hosts, sub/domains/whois, ports/banners/protocols, technologies, OS, AS, wide SSL/TLS DB and more.
- [sqlmap](http://sqlmap.org/) - sqlmap is an open source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers. It comes with a powerful detection engine, many niche features for the ultimate penetration tester and a broad range of switches lasting from database fingerprinting, over data fetching from the database, to accessing the underlying file system and executing commands on the operating system via out-of-band connections.
- [ZAP](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) - The Zed Attack Proxy (ZAP) is an easy to use integrated penetration testing tool for finding vulnerabilities in web applications. It is designed to be used by people with a wide range of security experience and as such is ideal for developers and functional testers who are new to penetration testing. ZAP provides automated scanners as well as a set of tools that allow you to find security vulnerabilities manually.
- [OWASP Testing Checklist v4](https://www.owasp.org/index.php/Testing_Checklist) -  List of some controls to test during a web vulnerability assessment. Markdown version may be found [here](https://github.com/amocrenco/owasp-testing-checklist-v4-markdown/blob/master/README.md).
- [w3af](http://w3af.org/) - w3af is a Web Application Attack and Audit Framework. The project’s goal is to create a framework to help you secure your web applications by finding and exploiting all web application vulnerabilities.
- [Recon-ng](https://github.com/lanmaster53/recon-ng) - Recon-ng is a full-featured Web Reconnaissance framework written in Python. Recon-ng has a look and feel similar to the Metasploit Framework.
- [PTF](https://github.com/trustedsec/ptf) - The Penetration Testers Framework (PTF) is a way for modular support for up-to-date tools.
- [Infection Monkey](https://github.com/guardicore/monkey) - A semi automatic pen testing tool for mapping/pen-testing networks. Simulates a human attacker.
- [ACSTIS](https://github.com/tijme/angularjs-csti-scanner) - ACSTIS helps you to scan certain web applications for AngularJS Client-Side Template Injection (sometimes referred to as CSTI, sandbox escape or sandbox bypass). It supports scanning a single request but also crawling the entire web application for the AngularJS CSTI vulnerability.
- [padding-oracle-attacker](https://github.com/KishanBagaria/padding-oracle-attacker) - padding-oracle-attacker is a CLI tool and library to execute padding oracle attacks (which decrypts data encrypted in CBC mode) easily, with support for concurrent network requests and an elegant UI.
- [is-website-vulnerable](https://github.com/lirantal/is-website-vulnerable) - finds publicly known security vulnerabilities in a website's frontend JavaScript libraries.
- [PhpSploit](https://github.com/nil0x42/phpsploit) - Full-featured C2 framework which silently persists on webserver via evil PHP oneliner. Built for stealth persistence, with many privilege-escalation & post-exploitation features.
- [Keyscope](https://github.com/SpectralOps/keyscope) - Keyscope is an extensible key and secret validation for checking active secrets against multiple SaaS vendors built in Rust  
- [Cyclops](https://github.com/v8blink/Chromium-based-XSS-Taint-Tracking) - The Cyclops is a web browser with XSS detection feature, it is chromium-based xss detection that used to find the flows from a source to a sink.  
- [Scanmycode CE (Community Edition)](https://github.com/marcinguy/scanmycode-ce) - Code Scanning/SAST/Static Analysis/Linting using many tools/Scanners with One Report. Currently supports: PHP, Java, Scala, Python, Ruby, Javascript, GO, Secret Scanning, Dependency Confusion, Trojan Source, Open Source and Proprietary Checks (total ca. 1000 checks)
- [recon](https://github.com/rusty-ferris-club/recon) - a fast Rust based CLI that uses SQL to query over files, code, or malware with content classification and processing for security experts
- [CakeFuzzer](https://github.com/Zigrin-Security/CakeFuzzer) - The ultimate web application security testing tool for CakePHP-based web applications. CakeFuzzer employs a predefined set of attacks that are randomly modified before execution. Leveraging its deep understanding of the Cake PHP framework, Cake Fuzzer launches attacks on all potential application entry points.
- [Artemis](https://github.com/CERT-Polska/Artemis/) - A modular vulnerability scanner with automatic report generation capabilities.

### Runtime Application Self-Protection

- [Sqreen](https://www.sqreen.io/) - Sqreen is a Runtime Application Self-Protection (RASP) solution for software teams. An in-app agent instruments and monitors the app. Suspicious user activities are reported and attacks are blocked at runtime without code modification or traffic redirection.
- [OpenRASP](https://github.com/baidu/openrasp) - An open source RASP solution actively maintained by Baidu Inc. With context-aware detection algorithm the project achieved nearly no false positives. And less than 3% performance reduction is observed under heavy server load.

### Development

- [API Security in Action](https://www.manning.com/books/api-security-in-action) - Book covering API security including secure development, token-based authentication, JSON Web Tokens, OAuth 2, and Macaroons. (early access, published continuously, final release summer 2020)
- [Secure by Design](https://www.manning.com/books/secure-by-design?a_aid=danbjson&a_bid=0b3fac80) - Book that identifies design patterns and coding styles that make lots of security vulnerabilities less likely. (early access, published continuously, final release fall 2017)
- [Understanding API Security](https://www.manning.com/books/understanding-api-security) - Free eBook sampler that gives some context for how API security works in the real world by showing how APIs are put together and how the OAuth protocol can be used to protect them.
- [OAuth 2 in Action](https://www.manning.com/books/oauth-2-in-action) - Book that teaches you practical use and deployment of OAuth 2 from the perspectives of a client, an authorization server, and a resource server.
- [OWASP ZAP Node API](https://github.com/zaproxy/zap-api-nodejs) - Leverage the OWASP Zed Attack Proxy (ZAP) within your NodeJS applications with this official API.
- [GuardRails](https://github.com/apps/guardrails) - A GitHub App that provides security feedback in Pull Requests.
- [Bearer](https://github.com/Bearer/bearer) - Scan code for security risks and vulnerabilities leading to sensitive data exposures.
- [Checkov](https://github.com/bridgecrewio/checkov/) - A static analysis tool for infrastucture as code (Terraform).
- [TFSec](https://github.com/tfsec/tfsec/) - A static analysis tool for infrastucture as code (Terraform).
- [KICS](https://github.com/Checkmarx/kics) - Scans IaC projects for security vulnerabilities, compliance issues, and infrastructure misconfiguration. Currently working with Terraform projects, Kubernetes manifests, Dockerfiles, AWS CloudFormation Templates, and Ansible playbooks.
- [Insider CLI](https://github.com/insidersec/insider) - A open source Static Application Security Testing tool (SAST) written in GoLang for Java (Maven and Android), Kotlin (Android), Swift (iOS), .NET Full Framework, C# and Javascript (Node.js).
- [Full Stack Python Security](https://www.manning.com/books/full-stack-python-security) - A comprehensive look at cybersecurity for Python developers
- [Making Sense of Cyber Security](https://www.manning.com/books/making-sense-of-cyber-security) - A jargon-free, practical guide to the key concepts, terminology, and technologies of cybersecurity perfect for anyone planning or implementing a security strategy. (early access, published continuously, final release early 2022)
- [Security Checklist by OWASP](https://owasp.org/www-project-application-security-verification-standard/) - A checklist by OWASP for testing web applications based on assurance level. Covers multiple topics like Architecture, IAM, Sanitization, Cryptography and Secure Configuration. 

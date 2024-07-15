title=BLint
tags=tool, security, linux, macos, windows
summary=A Binary Linter designed to evaluate your executables’ security properties and capabilities, utilizing LIEF for its operations; from version 2, can also produce Software Bill-of-Materials (SBOM) for compatible binaries.
~~~~~~

[Source](https://github.com/owasp-dep-scan/blint)

Several source code analysis tools can examine a code repository and generate an SBOM. But what about a binary executable, where the code repository may not be available and the executable is the only artifact to work with? Enter BLint, which aids in generating an SBOM for a binary executable. Creating BLint as open source and adopting it into the OWASP family means that it will be available to all and will grow and evolve.

* Can be used to detect overlooked security weaknesses and code signing or authenticode issues of compiled binaries in CI/CD pipelines. Third-party or proprietary dependencies in the form of binaries should be analyzed as part of software supply chain security efforts
* Does not rely on signatures but instead focuses on capabilities
* Does not execute the target, preserving resources and avoiding the need for a live environment

Supported binary formats:

* Android (apk, aab)
* ELF (GNU, musl)
* PE (exe, dll)
* Mach-O (x64, arm64)

The SBOM feature is supported for these types:

* Android (apk/aab)
* .NET executable binaries
* Go binaries

They are looking at adding the following capabilities:

1. Detecting libraries dynamically loaded during runtime
2. Offering a deep mode that will list symbols within static libraries.
3. Add additional annotations and refine existing ones.
4. Add CycloneDx 1.6 support for the SBOM feature.

["BLint: Open-source tool to check the security properties of your executables"](https://www.helpnetsecurity.com/2024/05/14/blint-open-source-check-security-properties-executables/)


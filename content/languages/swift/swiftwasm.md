title=SwiftWasm
tags=language, web assembly
summary=Compiles your Swift code to WebAssembly.
~~~~~~

[Website](https://swiftwasm.org/) | [Source](https://github.com/swiftwasm/swift) | [Docs ("the SwiftWasm book")](https://book.swiftwasm.org/)

We use LLVM as a compiler backend to produce WebAssembly binaries. Our resulting binaries also depend on WASI, which is a modular system interface for WebAssembly. WASI is mainly required to compile Swift Standard Library.

Important note: In 2024, Apple introduced [Swift Embedded](https://github.com/swiftlang/swift/blob/main/docs/EmbeddedSwift/UserManual.md). While both projects benefit from each other, it is important to understand that they are different targets at the build phase, consequentially with different sets of abilities. Embedded Swift very limited but can produce small binaries. Example.

Project Status: All compiler and standard library changes have been upstreamed to the official Swift repository, and the upstream CI is now testing WebAssembly targets.

The remaining works are: Integrating the build system with the official Swift CI.

## Installation

Before installing the Swift SDK, you need to ensure the following:

* You need to install an Open Source toolchain from swift.org. (Not the Xcode toolchain)
* You cannot use toolchains bundled with Xcode to use the Swift SDK.
* If you are using macOS, please follow the official guide to install the toolchain.

Please ensure you have installed the Swift 6.1 Open Source toolchain.

Toolchain | Output
--------- | ------
❌ Xcode	 | Apple Swift version 6.1 (swiftlang-6.1.0.110.21 clang-1700.0.13.3)
✅ Open Source (macOS) | Apple Swift version 6.1 (swift-6.1-RELEASE)
✅ Open Source (Others) | Swift version 6.1 (swift-6.1-RELEASE)

Once you have installed the Open Source toolchain, you can install the Swift SDK for WebAssembly:

`swift sdk install "https://github.com/swiftwasm/swift/releases/download/swift-wasm-6.1-RELEASE/swift-wasm-6.1-RELEASE-wasm32-unknown-wasi.artifactbundle.zip" --checksum "7550b4c77a55f4b637c376f5d192f297fe185607003a6212ad608276928db992"`

After installing the Swift SDK, you can see 6.1-RELEASE-wasm32-unknown-wasi in the Swift SDK list:

`swift sdk list`

You can also find other SDKs from the GitHub Releases page.

#### Hello, World
First, create a new directory for your project and navigate into it:

`$ mkdir hello && cd hello`

Create a new Swift package:

`$ swift package init --type executable`

You can use the installed SDKs to cross-compile Swift packages for WebAssembly:

```
$ swift build --swift-sdk wasm32-unknown-wasi
...
$ file .build/wasm32-unknown-wasi/debug/hello.wasm
.build/wasm32-unknown-wasi/debug/hello.wasm: WebAssembly (wasm) binary module version 0x1 (MVP)
```

You can run the built WebAssembly module using wasmtime:

```
$ wasmtime .build/wasm32-unknown-wasi/debug/hello.wasm
Hello, world!
```

#### FAQ
**How to check if I am using Open Source toolchain or Xcode toolchain?**

`$ swift --version | head -n1`

Toolchain | Output
--------- | --------
Xcode | Apple Swift version 6.1 (swiftlang-6.1.0.110.21 clang-1700.0.13.3)
Open Source (macOS) | Apple Swift version 6.1 (swift-6.1-RELEASE)
Open Source (Others) | Swift version 6.1 (swift-6.1-RELEASE)

**<unknown>:0: error: module compiled with Swift 6.1 cannot be imported by the Swift x.y.z**

This error occurs when the Swift toolchain version you are using is different from the version of the Swift SDK you have installed.

To resolve this issue, you can either:

Switch the Swift toolchain to the same version as the Swift SDK you have installed. Check the official guide for how to switch the toolchain.
Install the Swift SDK for the same version as the Swift toolchain you are using. Use the following shell snippet to query compatible Swift SDK for your current toolchain version:

```
(
  V="$(swiftc --version | head -n1)"; \
  TAG="$(curl -sL "https://raw.githubusercontent.com/swiftwasm/swift-sdk-index/refs/heads/main/v1/tag-by-version.json" | jq -r --arg v "$V" '.[$v] | .[-1]')"; \
  curl -sL "https://raw.githubusercontent.com/swiftwasm/swift-sdk-index/refs/heads/main/v1/builds/$TAG.json" | \
  jq -r '.["swift-sdks"]["wasm32-unknown-wasi"] | "swift sdk install \"\(.url)\" --checksum \"\(.checksum)\""'
)
```

**What is the difference between the Swift Toolchain and the Swift SDK?**

The Swift toolchain is a complete package that includes the Swift compiler, standard library, and other tools.

The Swift SDK includes a subset of the Swift toolchain that includes only the necessary components for cross-compilation and some supplementary resources.

**What is included in the Swift SDK for WebAssembly?**

The Swift SDK for WebAssembly includes only the pre-built Swift standard libraries for WebAssembly. It does not include the Swift compiler or other tools that are part of the Swift toolchain.

6.2 release:

* WASI-threaded: `swift sdk install https://github.com/swiftwasm/swift/releases/download/swift-wasm-6.2-RELEASE/swift-wasm-6.2-RELEASE-wasm32-unknown-wasip1-threads.artifactbundle.zip --checksum df8dee548a572f9325e997e1378f4dbab1dbfc986f92a35887b313e19007835d`
* non-threaded: `swift sdk install https://github.com/swiftwasm/swift/releases/download/swift-wasm-6.2-RELEASE/swift-wasm-6.2-RELEASE-wasm32-unknown-wasip1.artifactbundle.zip --checksum f206a9ff2352f726d88a59d2241b9581264326471265229b7ffd133d2593b92b`

## Tutorials

* [WebAssembly example with React and SwiftWasm](https://expressflow.com/blog/posts/webassembly-example-with-react-and-swiftwasm) - A quick overview (with [example code](https://github.com/expressflow/webassembly-example-react) provided) of how SwiftWasm code can be integrated in a React app.

## Libraries and frameworks

* [JavaScriptKit](https://github.com/kateinoigakukun/JavaScriptKit/) - Swift framework to interact with JavaScript through WebAssembly.
* [SwiftWebUI](https://github.com/carson-katri/SwiftWebUI) - SwiftUI with support for WebAssembly.
* [Tokamak](https://github.com/swiftwasm/Tokamak) - SwiftUI-compatible framework for building browser apps with WebAssembly.
* [BluetoothWeb](https://github.com/PureSwift/BluetoothWeb) - Swift framework to interact with [Web Bluetooth API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Bluetooth_API) through WebAssembly.

## Developer tools

* [carton](https://github.com/swiftwasm/carton) - Watcher, bundler, and test runner for your SwiftWasm apps.
* [swift-webpack-plugin](https://github.com/swiftwasm/swift-webpack-plugin) - [webpack.js](https://webpack.js.org/) plugin for SwiftWasm.
* [swiftwebui-scripts](https://github.com/carson-katri/swiftwebui-scripts) - Scripts to make working with SwiftWebUI and SwiftWasm easier.
* [webidl2swift](https://github.com/Apodini/webidl2swift) - Generate Swift bridging code from Web IDL files.
* [Chrome Timeline Demangler](https://observablehq.com/d/0f532c6afb81f2d8) - Modify Chrome Timeline profiles to show demangled Swift symbols, which makes it easier to analyze how your code is performing. A [Firefox version](https://observablehq.com/d/1ab06632b2f63dc3) is also available.
* [WasmTransformer](https://github.com/swiftwasm/WasmTransformer) - A Swift package for reading, writing, and transformation of Wasm binaries.
* [WAKit](https://github.com/akkyie/WAKit) - A WebAssembly Runtime written in Swift. 
* [wamr-swift](https://github.com/swiftwasm/wamr-swift/) - Swift bindings for [WebAssembly Micro Runtime](https://github.com/bytecodealliance/wasm-micro-runtime).
* [SwiftyWasmer](https://github.com/AlwaysRightInstitute/SwiftyWasmer) - A Swift API for the Wasmer WebAssembly Runtime.

## Sample projects

* [LifeGame with SwiftWasm](https://github.com/kateinoigakukun/life-game-with-swiftwasm) - The Conway's Game of Life built with SwiftWasm.
* [swift-web-github-example](https://github.com/swiftwasm/swift-web-github-example) - Demo project built with SwiftWasm that utilizes the GitHub search API.
* [swift-webpack-template](https://github.com/swiftwasm/swift-webpack-template) - Kickstart your Swift, WebAssembly and webpack.js project.
* [SwiftWebUI-WASM-CFs](https://github.com/1amageek/SwiftWebUI-WASM-CFs) - An example of a SwiftWebUI project deployed to Firebase Cloud Functions.
* [Swift + WebAssembly](https://github.com/hassan-shahbazi/swiftwasm-go) - Use Swift + WebAssembly in a Go application. 
* [Swift, Wasm, and Algorithms](https://github.com/johngarrett/swal-wasm) - Interactive documentation for [the Swift Algorithms project](https://github.com/apple/swift-algorithms).
* [tic-tac-toe](https://github.com/johngarrett/tic-tac-toe) - [Tic-tac-toe game](https://garrepi.dev/tic-tac-toe/) built with SwiftWasm.
* [memes](https://github.com/nerdsupremacist/memes) - An online Multi-Player Meme Party Game that uses Vapor for backend, and SwiftWasm/Tokamak for frontend.
* [Ogol](https://github.com/fcanas/ogol) - A compiler and virtual machine for [Ogol](https://fabiancanas.com/wogol/). Ogol is currently a variant of the Logo computer language, and its browser version is built with SwiftWasm.

## Resources

[Awesome-SwiftWasm](https://github.com/swiftwasm/awesome-swiftwasm): A community-driven curated list of SwiftWasm projects and content


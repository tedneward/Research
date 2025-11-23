title=FEX
tags=vm, emulator, linux, assembly
summary=A fast usermode x86 and x86-64 emulator for Arm64 Linux.
~~~~~~

[Website](https://fex-emu.com/) | [Source](https://github.com/FEX-Emu/FEX)

FEX allows you to run x86 applications on ARM64 Linux devices, similar to qemu-user and box64. It offers broad compatibility with both 32-bit and 64-bit binaries, and it can be used alongside Wine/Proton to play Windows games.

It supports forwarding API calls to host system libraries like OpenGL or Vulkan to reduce emulation overhead. An experimental code cache helps minimize in-game stuttering as much as possible. Furthermore, a per-app configuration system allows tweaking performance per game, e.g. by skipping costly memory model emulation. We also provide a user-friendly FEXConfig GUI to explore and change these settings.


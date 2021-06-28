title=EFI (Executable Firmware Interface)
tags=format, platform, pe
summary=The specification (describing PE files as the standard) for executable format in EFI environments.
~~~~~~

See [UEFI](/platforms/uefi.html) for details. An EFI-executable file is a [PE](pe.html) file at its heart, but usually makes use of UEFI system-table system calls rather than any sort of standard-C library linked to the operating system.
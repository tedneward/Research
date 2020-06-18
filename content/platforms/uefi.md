title=UEFI (Unified Extensible Firmware Interface)
tags=platform, macos, linux, windows
summary=A new model for the interface between personal-computer operating systems and platform firmware; the interface consists of data tables that contain platform-related information, plus boot and runtime service calls that are available to the operating system and its loader. Together, these provide a standard environment for booting an operating system and running pre-boot applications.
~~~~~~

[Website](https://uefi.org/)

[Shell Specification](https://uefi.org/sites/default/files/resources/UEFI_Shell_2_2.pdf) | [Intel Shell Command Reference Manual](https://manuais.iessanclemente.net/images/a/a6/EFI-ShellCommandManual.pdf) | [Intel Basic Instructions for Using the
Extensible Firmware Interface (EFI)](https://www.intel.com/content/dam/support/us/en/documents/motherboards/server/sb/efi_instructions.pdf)

["How to Access the EFI Shell to carry out Systems Diagnostics or Updates"](https://kb.stonegroup.co.uk/index.php?View=entry&EntryID=84): Turns out the shell can read USB-key drives and execute .EFI executable files--which is interesting in of itself--and this article describes how to boot into an Intel machine and use the UEFI shell to do that.
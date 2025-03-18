title=Linux and Gaming
tags=platform, linux
summary=Various links and pages around using Linux to play games.
~~~~~~

## Articles

["How to turn a USB flash drive into a portable gaming console"](https://www.pcworld.com/article/2615386/how-to-turn-a-usb-flash-drive-into-a-portable-gaming-console.html#):

    * Download the Linux ISO; article recommends [Batocera](https://batocera.org/)
    * Use BalenaEtcher to flash the OS to the drive
    * Boot to the flash drive

        * If it doesn't automatically boot, choose a method below
        * Method 1 (Windows)

            * Type recovery options into the Windows start menu and under Advanced Startup hit Restart now.
            * Now select Use a device and then UEFI: Removable Device. It should boot now. If you didn’t see the option to select the UEFI: Removable Device, use the next method.

        * Method 2 (Windows)

            * Power down your PC and power it up again.
            * While your PC is powering up hit the F12 key to enter your PC’s BIOS menu.
            * When given the choice to pick a boot device select UEFI: USB, Partition (your USB flash device). This should boot you in.


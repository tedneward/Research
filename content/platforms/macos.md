title=macOS (OS)
tags=platform, macos
summary=The Apple operating system (on top of the open-source Darwin kernel) that ships with Apple computers.
~~~~~~

## Running macOS in a VirtualBox VM
(Some details swiped from https://techsviewer.com/install-macos-10-15-catalina-on-virtualbox-on-windows-pc/)

Basic steps:
* Make sure Virtual Box Extension Pack is installed. Necessary (?) for USB setting below.

* *Obtain a macOS ISO.* The most "legal" thing to do seems to be to download the "Install macOS {version}" where "{version}" is Catalina, High Sierra, whatever, and then convert the installer application into an ISO via [this Gist](https://gist.github.com/tedneward/5d4710983caf55906f834dc7c576a418).

* *Create the VBox Guest.* Select "Type: macOS" and "Version: (Latest macOS version)", where the latest macOS version offered was High Sierra when I tried this. Set RAM to be high--I chose 16GB on my 64GB MBP--and create a hard disk--I chose 100GB dynamic. Then set the following options:
  * "System"/"Motherboard": set "Chipset: PIIX 3"; set "Enable EFI" on.
  
  * "System"/"Processor": set "Cores" to 2 (or 4, if you can); set "Enable PAE/NX" on.
  
  * "Display"/"Screen": set "Video Memory" to 128MB; set "Graphics Controller" to "VMSVGA". (On my running VBox right now, it's set to VBoxVGA, and wouldn't be set to anything else, so this may only be required for Windows machines. Verify.); I left 3D and 2D acceleration turned off.
  
  * "Ports"/"USB": set "Enable USB Controller" on; select "USB 3.0 (xHCI) Controller". Apparently macOS doesn't support USB 2.0 or 1.1 Controllers.
  
  Then mount the macOS ISO as the ISO image.

* *Tweak the VBox settings by hand.* Next run the following shell commands (with VirtualBox on the command-line path):
  ```
  VBoxManage modifyvm "Your VM Name" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
  VBoxManage setextradata "Your VM Name" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
  VBoxManage setextradata "Your VM Name" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
  VBoxManage setextradata "Your VM Name" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
  VBoxManage setextradata "Your VM Name" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
  VBoxManage setextradata "Your VM Name" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
  ```
  No clue what these do but they appear to be necessary. I suspect they're Apple anti-piracy settings.

* *Boot the ISO.* The ISO won't immediately install to the created hard drive because it needs to be formatted first. From the "macOS Utilities" dialog select "Disk Utility" and Erase the VirtualBox hard drive as "Format: MacOS Extended (Journaled)" and "Scheme: GUID Partition Map". Name can be whatever. When that's done, quit "Disk Utility" and "Install macOS" to the VBox hard drive.

* *Finish the macOS install.* Remove the ISO, boot the VBox, and it should begin the installation process as per normal installation procedures. Create an account, and by the time that's all done, it should be good to go.

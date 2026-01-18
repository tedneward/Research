title=Glim
tags=tool, operating system, loader, boot, usb, linux
summary=A set of grub configuration files to turn a simple VFAT formatted USB memory stick with many GNU/Linux distribution ISO images into a neat device from which many different Live environments can be used.
~~~~~~

[Source](https://github.com/thias/glim) | [Docs](https://glee.thias.es/GLIM)

Advantages over extracting files or using special Live USB creation tools :

* A single USB memory can hold all Live environments (the limit is its size)
* ISO images stay available to burn real CDs or DVDs
* ISO images are quick to manipulate (vs. hundreds+ files)

Disadvantages :

* There is no persistence overlay for distributions which normally support it
* Setting up isn't as easy as a simple cat from the ISO image to a block device

My experience has been that the safest filesystem to use is FAT32 (surprisingly!), though it will mean that ISO images greater than 4GB won't be supported. Other filesystems supported by GRUB2 also work, such as ext3/ext4, NTFS and exFAT, but the boot of the distributions must also support it, which isn't the case for many with NTFS (Ubuntu does, Fedora doesn't) and exFAT (Ubuntu doesn't, Fedora does). So FAT32 stays the safe bet; make sure your device is partitioned with MBR (not GPT) for legacy BIOS and EFI hybrid support for peak compatibility.

## Reading

### Articles

* [Glim is the Ventoy alternative Linux enthusiasts should use instead](https://www.xda-developers.com/glim-ventoy-alternative-linux-enthusiasts-should-use-instead/)


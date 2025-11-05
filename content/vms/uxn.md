title=Uxn
tags=vm, native
summary=A portability layer and an attempt at crafting a comfortable bedrock for personal computing that is capable of hosting a variety of small interactive graphical software.
~~~~~~

[Website](https://wiki.xxiivv.com/site/uxn.html)

To get started, equip yourself with an assembler to convert tal source files into rom binary files, and an emulator to evaluate the rom files. The minimal system below includes the Console device:

    # Build the emulator
    cc uxnmin.c -o uxnmin

    # Build the assembler
    xxd -r -p uxnasm.rom.txt uxnasm.rom

    # Assemble a tal file
    cat opctest.tal | uxnmin uxnasm.rom > opctest.rom

    # Run a rom file
    uxnmin opctest.rom


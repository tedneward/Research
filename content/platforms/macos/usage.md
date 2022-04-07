title=macOS (OS) usage
tags=platform, macos
summary=Tips on using the Apple desktop operating system (on top of the open-source Darwin kernel) that ships with Apple computers.
~~~~~~

## Terminal Tricks
* ["Change your MAC address with a shell script"](https://josh.works/shell-script-basics-change-mac-address)

* ["macOS terminal commands every mac user should know"](https://www.techrepublic.com/article/macos-terminal-commands-every-mac-user-should-know/):
    * Update macOS via SoftwareUpdate in the terminal: `softwareupdate -i -a`

    * Copy output of a command to the clipboard: `cat ~/Desktop/myfile.txt | pbcopy`

    * View system utilization: `top`

    * Keep Mac from turning off/sleeping: `caffeinate`

    * Clear the DNS cache: `sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache`

    * Find diffs in files: `opendiff ~/Desktop/text1.txt ~/Desktop/text2.txt`

    * Find out how long the Mac has been on: `uptime`

    * Force macOS to shut down: `shutdown -r now`

    * Get a QuickLook preview of a file: `qlmanage -p ~/Desktop/text.txt`

* ["16 Terminal commands every user should know"](https://www.techrepublic.com/article/16-terminal-commands-every-user-should-know/):

    * Copy contents of a folder to a new folder: `ditto`

    * Get one-line description for a command: `whatis`

    * Keep the Mac from hibernating/sleeping: `caffeinate`

## A/V Tricks

* ["Take a screenshot on your Mac"](https://support.apple.com/en-us/HT201361):

    * **How to take a screenshot on your Mac**: To take a screenshot, press and hold these three keys together: Shift, Command, and 3. If you see a thumbnail in the corner of your screen, click it to edit the screenshot. Or wait for the screenshot to save to your desktop.

    * **How to capture a portion of the screen**: Press and hold these three keys together: Shift, Command, and 4. Drag the crosshair  to select the area of the screen to capture. To move the selection, press and hold Space bar while dragging. To cancel taking the screenshot, press the Esc (Escape) key.

    * **How to capture a window or menu**: Open the window or menu that you want to capture. Press and hold these keys together: Shift, Command, 4, and Space bar. The pointer changes to a camera icon. To cancel taking the screenshot, press the Esc (Escape) key. Click the window or menu to capture it. To exclude the window's shadow from the screenshot, press and hold the Option key while you click. If you see a thumbnail in the corner of your screen, click it to edit the screenshot. Or wait for the screenshot to save to your desktop.

    * **Where to find screenshots**: By default, screenshots save to your desktop with the name "Screen Shot [date] at [time].png." 
    
    * In macOS Mojave or later, you can change the default location of saved screenshots from the Options menu in the Screenshot app. You can also drag the thumbnail to a folder or document.

    * In macOS Mojave or later, you can also set a timer and choose where screenshots are saved with the Screenshot app. To open the app, press and hold these three keys together: Shift, Command, and 5. Learn more about the Screenshot app.

    * Some apps, such as the Apple TV app, might not let you take screenshots of their windows.

    * To copy a screenshot to the Clipboard, press and hold the Control key while you take the screenshot. You can then paste the screenshot somewhere else. Or use Universal Clipboard to paste it on another Apple device.

* ["How to Record Your Face and Screen"](https://macreports.com/record-face-screen-mac/):

    1. 1-Launch QuickTime player. It can be found in the applications folder.

    2. Select File > New Movie Recording.

    3. Select View > Float on top so that your camera window will be on top of any other application anywhere on your screen. If you do not select this, your video may not record you.

    4. Now you can resize the camera window. You can move this camera view anywhere you want (left, right, top, bottom, etc).

    5. Now  again, in QuickTime Player, select File > New Screen Recording. You can change some settings by clicking the arrow next to the Record button. You can record your full screen or part of your Mac screen. You may want to arrange your screen (where will your camera be etc?) before you start your recording.

    6. When you are ready to start recording, click the red record button. You have two options: (a) if you want to record your entire screen, click anywhere on your screen to start the actual recording (b) or you may drag to select an area.

    7. Now you are recording your screen and your camera view (e.g. your face). When you are done recording you may press the Command-Control-Esc keys. After you done, you may also edit your video using Quicktime. For instance, you may go to QuickTime > Edit  > Trim to remove the unwanted parts of your video.

    Additional notes:

    * You can also press Shift-Command (⌘)-5  to create video and capture still images of your screen.
    * Please note that if your Mac does not have a built-in camera, you can use an external camera.
    * You can use an iOS device connected to your Mac to record a video on your device.


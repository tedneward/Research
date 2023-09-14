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

* ["Useful macOS shortcuts"](https://www.makeuseof.com/tag/useful-mac-osx-shortcuts-pdf/):

    Startup: Intel

    Action | Keystroke(s)
    ------ | ------------
    Boot without automatic login | Left shift (Press and hold when macOS progress indicator appears)
    Boot in Safe Mode (Intel) | Shift (Press and hold)
    Boot in Single User Mode (Intel, unavailable in macOS Mojave and later) | Cmd + S
    Boot in Verbose Mode (Intel) | Cmd + V
    Boot in Target Disk Mode (Intel) | T
    Boot from a NetBoot network server | N
    Boot to Startup Manager (Intel) | Option
    Load macOS Recovery (Intel) | Cmd + R
    Load macOS Recovery over the internet (Intel) | Option + Cmd + R
    Enter Apple Diagnostics (Intel) | D
    Load Apple Diagnostics over the internet | Option + D
    Reset NVRAM or PRAM (Intel, unnecessary on Apple Silicon Macs) | Option + Cmd + P + R
    Eject removable media | F12

    Startup: Apple Silicon

    Action | Keystroke(s)
    ------ | ------------
    Boot without automatic login | Left shift (Press and hold when macOS progress indicator appears)
    Boot in Safe Mode (Apple Silicon) | Power (Press and hold), then select a volume, then hold Shift while clicking Continue in Safe Mode
    Boot to Startup Manager (Apple Silicon) | Power
    Enter Apple Diagnostics (Apple Silicon) | Cmd + D
    Load macOS Recovery (Apple Silicon) | Power, then select Options, then click Continue
    Load Apple Diagnostics over the internet | Option + D
    Boot from a NetBoot network server | N
    Eject removable media | F12

    Finder

    Action | Keystroke(s)
    ------ | ------------
    Go to folder | Cmd + Shift + G
    Show/hide the Path Bar | Option + Cmd + P
    Show/hide the Status Bar | Option + Cmd + / (Slash)

    General

    Action | Keystroke(s)
    ------ | ------------
    Lock the screen | Cmd + Control + Q
    Log out | Shift + Cmd + Q
    Log out without confirmation | Option + Shift + Cmd + Q
    Display the macOS screenshotting tools | Cmd + 5
    Take a screenshot of the entire screen | Shift + Cmd + 3
    Take a screenshot of a portion of the screen | Shift + Cmd + 4 (then hold Space to drag the selection, if needed)
    Take a screenshot of a specific window or menu | Cmd + Shift + 4, then Space
    Close all windows | Option + Cmd + W
    Paste and delete original items | Option + Cmd + V
    Paste and match style | Shift + Option + Cmd + V
    Zoom in | Cmd + + (Plus)
    Zoom out | Cmd + - (Minus)
    Open preferences for the current app | Cmd + , (Comma)
    Open Spotlight search | Cmd + Space
    Hide/show the Dock | Option + Cmd + D
    Show the Character Viewer | Control + Cmd + Space
    Show the emoji picker | Fn
    Show desktop icons as stacks | Cmd + Control + 0
    Switch the current app to fullscreen mode | Control + Cmd + F
    Quit the selected app in the app switcher | Cmd + Shift, then Q
    Force quit apps | Option + Cmd + Esc
    Switch to the next window in the current app | Cmd + ~ (Tilde)
    Put display(s) to sleep | Shift + Control + Eject
    Put your computer to sleep | Option + Cmd + Eject
    Quit all apps and restart | Control + Cmd + Eject 
    Quit all apps and shut down | Control + Option + Cmd + Power
    Choose from Sleep, Restart, and Shutdown options | Control + Eject

## A/V Tricks

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


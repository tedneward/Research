title=macOS (OS) usage
tags=platform, macos
summary=Tips on using the Apple desktop operating system (on top of the open-source Darwin kernel) that ships with Apple computers.
~~~~~~

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


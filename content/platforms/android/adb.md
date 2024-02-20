title=Android Device Bus (adb)
tags=tool, platform, mobile, android
summary=The Swiss-Army knife command-line tool for Android development against either emulator AVD or physical device.
~~~~~~

# Interesting combos

- To test runtime permission – Go to Settings -> Applications -> Application info of the app you are looking for and disable that permission.
- To test a fresh install – adb shell pm clear-data com.example
- To test your app under the battery-saver mode – turn on the battery saver mode by expanding the notification bar
- To stop the execution of an app –  kill it via activity manager, `adb shell am kill com.example`
- To test your app under doze mode – first, make the device believe that it is unplugged via `adb shell dumpsys battery unplug`, then, make it think that it is discharging via `adb shell dumpsys battery set status 3`, and then enable doze mode via `adb shell dumpsys deviceidle force-idle`. And don’t forget to execute a set of unrelated complementary commands once you are done to bring the device back to its normal state.
- To see the overdraw of the app – Go to the developer options and enable/disable it there.

# Articles

["Introducing adb-enhanced"](https://ashishb.net/tech/introducing-adb-enhanced-a-swiss-army-knife-for-android-development/): a Python script to make it easier to drive adb - `pip3 install adb-enhanced` - [Source](https://github.com/ashishb/adb-enhanced)



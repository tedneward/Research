title=XCode Playgrounds
tags=tool, macos, ios
summary=The REPL-like environment for macOS and iOS in Apple's XCode.
~~~~~~

## [Playgrounds loading Storyboards](https://stackoverflow.com/questions/39078307/is-it-possible-to-load-a-storyboard-in-an-ios-playground)

1. Compile the storyboard using

        ibtool --compile MainMenu.storyboardc MainMenu.storyboard

    (Note the "c" at the end of the .storyboard filename is NOT a typo.)

    May need to specify module name using --module flag when compiling. Otherwise, your outlets may cause a runtime error. For the playground book, the module name is Book_Sources. For your own playground, the module name is [Playground name]_Sources. Note I didn't find any of this in Apple's documentation, so it is subject to change. The final command looks like this:

        ibtool --compile MainMenu.storyboardc MainMenu.storyboard --module Book_Sources

    (When I tried this on 11 Apr 2022, it worked w/o the module flag.)

2. Place the compiled storyboardc file in the Resources folder of the playground, not the Sources folder

3. Instantiate it in the Playground and set the instantiated ViewController to be the one loaded by the Playground:

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        PlaygroundPage.current.liveView = storyboard.instantiateInitialViewController()


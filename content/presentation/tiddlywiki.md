title=Tiddlywiki
tags=presentation, tool, browser, wiki
summary=A self-contained JavaScript wiki for the browser, Node.js, AWS Lambda etc.
~~~~~~

[Website/Demo](https://tiddlywiki.com/) | [Source](https://github.com/TiddlyWiki/TiddlyWiki5) | [Desktop](https://tiddlywiki.com/#TiddlyDesktop)

TiddlyWiki is a complete interactive wiki in JavaScript. It can be used as a single HTML file in the browser or as a powerful Node.js application. It is highly customisable: the entire user interface is itself implemented in hackable WikiText.

[Scripts in TiddlyWiki](https://kookma.github.io/TW-Scripts/)

It can be run client-server mode in nodejs:

# [Installing TiddlyWiki on Node.js](https://github.com/TiddlyWiki/TiddlyWiki5?tab=readme-ov-file#installing-tiddlywiki-on-nodejs)

TiddlyWiki is a [SingleFileApplication](https://tiddlywiki.com/static/SingleFileApplication.html), which is easy to use. For advanced users and developers there is a possibility to use a Node.js client / server configuration. This configuration is also used to build the TiddlyWiki [SinglePageApplication](https://tiddlywiki.com/static/SinglePageApplication.html)

1.  Install [Node.js](https://tiddlywiki.com/static/Node.js.html)
    -   Linux:
        
        > _Debian/Ubuntu_:  
        > `apt install nodejs`  
        > May need to be followed up by:  
        > `apt install npm`
        > 
        > _Arch Linux_  
        > `yay -S tiddlywiki`  
        > (installs node and tiddlywiki)
        
    -   Mac
        
        > `brew install node`
        
    -   Android
        
        > [Termux for Android](https://tiddlywiki.com/static/Serving%2520TW5%2520from%2520Android.html)
        
    -   Other
        
        > See [http://nodejs.org](http://nodejs.org/)
        
2.  Open a command line terminal and type:
    
    > `npm install -g tiddlywiki`
    > 
    > If it fails with an error you may need to re-run the command as an administrator:
    > 
    > `sudo npm install -g tiddlywiki` (Mac/Linux)
    
3.  Ensure TiddlyWiki is installed by typing:
    
    > `tiddlywiki --version`
    
    -   In response, you should see [TiddlyWiki](https://tiddlywiki.com/static/TiddlyWiki.html) report its current version (eg "5.3.8". You may also see other debugging information reported.)
4.  Try it out:
    1.  `tiddlywiki mynewwiki --init server` to create a folder for a new wiki that includes server-related components
    2.  `tiddlywiki mynewwiki --listen` to start [TiddlyWiki](https://tiddlywiki.com/static/TiddlyWiki.html)
    3.  Visit [http://127.0.0.1:8080/](http://127.0.0.1:8080/) in your browser
    4.  Try editing and creating tiddlers
5.  Optionally, make an offline copy:
    -   click the **save changes** button in the sidebar, **OR**
    -   `tiddlywiki mynewwiki --build index`

The `-g` flag causes [TiddlyWiki](https://tiddlywiki.com/static/TiddlyWiki.html) to be installed globally. Without it, [TiddlyWiki](https://tiddlywiki.com/static/TiddlyWiki.html) will only be available in the directory where you installed it.

**Warning**

If you are using Debian or Debian-based Linux and you are receiving a `node: command not found` error though node.js package is installed, you may need to create a symbolic link between `nodejs` and `node`. Consult your distro's manual and `whereis` to correctly create a link. See github [issue 1434](http://github.com/TiddlyWiki/TiddlyWiki5/issues/1434).  
  
Example Debian v8.0: `sudo ln -s /usr/bin/nodejs /usr/bin/node`

  

**Tip**

You can also install prior versions like this:  
`npm install -g tiddlywiki@5.1.13`

---

## [Community Resources](https://tiddlywiki.com/#Community)

### [Saving to a Git service](https://tiddlywiki.com/#Saving%20to%20a%20Git%20service)

Saving to a Git service is configured in the $:/ControlPanel in the Git Service Saver tab under the Saving tab. The following settings are supported:

* Type - (mandatory) the type of the service (e.g. GitHub, GitLab)
* Username - (mandatory) the username for the Git service account used for saving changes
* Password - (mandatory) the OAUTH token or personal access token for the specified account. Note that GitHub deprecated password authentication, permitted authentication methods are shown in the API documentation.
* Repository - (mandatory) the name of the Git repository. Both the owner name and the repository name must be specified. For example Jermolene/TiddlyWiki5
* Branch - (optional) the name of the branch to be used within the Git repository. Defaults to main (GitHub) or master (GitLab)"
* Path - (optional) the path to the target file. Defaults to /
* Filename - (mandatory) the filename of the target file

### [GitHub Saver Tutorial by Mohammad](https://tiddlywiki.com/#GitHub%20Saver%20Tutorial%20by%20Mohammad)

GitHub Saver is a step by step tutorial that shows how to integrate Tiddlywiki 5 and GitHub Pages to create websites hosted on https://github.com/.

https://kookma.github.io/TW5-GitHub-Saver/

This instruction is based on Tiddlywiki single html file model, while it can use subfolder for extra materials like images, audios, videos, pdfs,... in separate folders.

Other tutorials

- Tiddlywiki, Travis-CI and GitHub Pages

    https://kookma.github.io/Tiddlywiki-Travis-CI/

    This wiki shows how to set up websites hosted on GitHub Pages using Travis-CI and Tiddlywiki 5 on Node.js.

- Tiddlywiki and GitHub Pages

    https://kookma.github.io/Tiddlywiki-and-GitHub-Pages/

    This instruction is based on local edit, save and push to GitHub. It does NOT use the new GitHub Saver mechanism (requires TW 5.1.20+) which lets edit and save directly from Tiddlywiki!

### [TiddlyPWA](https://tiddly.packett.cool/)

[Source](https://codeberg.org/valpackett/tiddlypwa)

Runs TW as a progressive web app. Secure offline storage and cross-device synchronization solution for TiddlyWiki 5.

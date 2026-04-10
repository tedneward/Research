title=HTML Slidy
tags=format, presentation, slides
summary=W3C's HTML-based slide system.
~~~~~~

[Website](https://www.w3.org/Talks/Tools/Slidy2/Overview.html#(1)) 

## What you need to do

-   Each presentation is a single XHTML file
-   Each slide is enclosed in _<div class="slide"> ... </div>_
    -   The div element will be created automatically for h1 elements that are direct children of the body element.
-   Use regular markup within each slide
-   The document head includes two links:
    -   The slide show style sheet: [http://www.w3.org/Talks/Tools/Slidy2/styles/slidy.css](https://www.w3.org/Talks/Tools/Slidy2/styles/slidy.css)
    -   The slide show script: [http://www.w3.org/Talks/Tools/Slidy2/scripts/slidy.js](https://www.w3.org/Talks/Tools/Slidy2/scripts/slidy.js)
    -   Or you can link to the compressed version of the script which is about one seventh the size, see [http://www.w3.org/Talks/Tools/Slidy2/scripts/slidy.js.gz](https://www.w3.org/Talks/Tools/Slidy2/scripts/slidy.js.gz)
    -   If you are using XHTML, remember to use </script> and </style> as per [Appendix C.3](https://www.w3.org/TR/xhtml1/#C_3)

            <?xml version="1.0" encoding="utf-8"?>
            <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
            "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"> 
            <head> 
            <title>Slide Shows in XHTML</title> 
            <meta name="copyright" 
            content="Copyright © 2005 your copyright notice" /> 
            <link rel="stylesheet" type="text/css" media="screen, projection, print" 
            href="http://www.w3.org/Talks/Tools/Slidy2/styles/slidy.css" /> 
            <script src="http://www.w3.org/Talks/Tools/Slidy2/scripts/slidy.js" 
            charset="utf-8" type="text/javascript"></script> 
            <style type="text/css"> 
                <!-- your custom style rules --> 
            </style> 
            </head>
            <body>
            ... your slides marked up in XHTML ...
            </body>
            </html>

## To get the W3C Blue Style

The head element should include the following link to the style sheet:

        <link rel="stylesheet" type="text/css" media="screen, projection, print"
        href="http://www.w3.org/Talks/Tools/Slidy2/styles/w3c-blue.css" /> 

The body element's content should start with the following markup:

        <div class="background"> 
        <img id="head-icon" alt="graphic with four colored squares"
            src="http://www.w3.org/Talks/Tools/Slidy2/graphics/icon-blue.png" /> 
        <object id="head-logo" title="W3C logo" type="image/svg+xml"
            data="http://www.w3.org/Talks/Tools/Slidy2/graphics/w3c-logo-white.svg"><img
        src="http://www.w3.org/Talks/Tools/Slidy2/graphics/w3c-logo-white.gif" 
        alt="W3C logo" id="head-logo-fallback" /></object>
        </div> 

This adds the logos on the top left and right corners of the slide.

You are of course welcome to create your own slide designs. You can provide different styles and backgrounds for different slides (more details later).

Use the _meta element_ with _name="copyright"_ for use in the slide show footer:

        <meta name="copyright" 
        content="Copyright © 2005-2009 W3C (MIT, ERCIM, Keio)" />

## To use it off-line

-   You can download [slidy.zip](https://www.w3.org/Talks/Tools/Slidy2/slidy.zip) and unzip it to create a Slidy directory on your machine
-   If you have cvs access to the W3C site you can check out the Slidy directory
-   Remember to periodically check for updates
-   You then have two choices:
    1.  Use relative URIs depending on your local setup to access the appropriate files. Use the same directory structure as on the W3C server, ie, ".../2005/Talks/...".
    2.  Run a Web server on your machine so that the directory above can be accessed via `http://localhost/Talks/Tools/Slidy2` and use the URIs of the form "/Talks/Tools/Slidy2/styles/slidy.css", "/Talks/Tools/Slidy2/scripts/slidy.js".
-   In both cases you can then publish your files on the W3C server unchanged.
-   **NOTE** Internet Explorer on Windows XP now disables scripting for web pages loaded directly from the local file system, a work around is to use another browser, e.g. Firefox or Opera
-   Please feel free to create your own designs, and help us to build a gallery of Slidy styles.
-   My [Google TechTalk](https://www.w3.org/2006/02/woa/) (1st Feb 2006) uses a notebook themed style

## # Timing Your Presentation

-   Sometimes it is handy to know just how much time you have to left to finish your presentation
-   To get this feature, add the following markup to the content of the head element, replacing 5 by the duration of your presentation in minutes
    
    <meta name="duration" content="5" />
    
-   The time left in minutes and seconds is shown in the footer next to the slide number
-   The clock starts to run when you move away from the first slide
-   Moving back to the first slide pauses the clock










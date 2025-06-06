<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>Research Notes</h1>
	</div>
	
	<hr />

<h1>Welcome to my Research Notes</h1>
<p>Historically, I've kept a lot of bookmarks in my browsers of choice--first Navigator, then IE, then Chrome, then.... I got tired of migrating bookmarks, and trying to organize the thousands of them. Plus, then I started trying to store notes in OneNote, and before long, I had research notes just scattered all over the Internet. Way less than optimal.</p>

<p>I've always been just a touch in love (and envious) of people who maintained their notes and links and such on the web, like <a href="http://gee.cs.oswego.edu/">Doug Lea's workstation home page</a> (which does not seem to have substantively changed in twenty years). Doesn't matter! The format--simply text arranged into lists and links, with a clean background and little to no decoration--has always been something I've wanted to have for myself. I actually did, at one point, decades ago, on a long-since-defunct statically-maintained website and HTML pages. Note the word "statically-maintained"; keeping them all up to date was quite painful.</p>

<p>"Surely there must be a better way..." Such are the words that get many a software developer into deep, deep trouble.</p>

<p>Martin Fowler built his "bliki" back in the day, and I liked where he went with that, but I never wanted to build a static site generator myself--got too much research to do! I played around with Hugo (which is what my blog is written in), and it was... OK, but not great. Still vastly overkill for what I really wanted to do with this, which was really just "text and bullets". I tried to understand Gatsby, I really did. I can write React well enough, but Gatsby's internal model just defeated me time and again, and I just didn't need even a tenth of the power that it encompasses. Finally, enter JBake, which hits the spot quite nicely.</p>

<p>If you're super-curious to have a copy of my notes/links on your own machine, you're welcome to <a href="https://github.com/tedneward/Research">fork the repo</a>. It comes with two very important caveats: One, these are my notes, so I will not be accepting pull requests or accept additional contributors (at least for now, never say never), and two, I make zero warranty about anything regarding what's there. I won't even guarantee that forking the repo won't destroy your hard drive, your computer, or your life. <i>Caveat emptor.</i> The repo is made available purely out of a potentially-misguided notion that people might find it interesting, and nothing more.</p>

<p>By the way, the following is copied out of the README from the repo, just in case you were curious about the categorization structure:
<ul>
<li><em>AI</em>: Artificial Intelligence links/research</li>
<li><em>Architecture</em>: Software architecture links/research</li>
<li><em>Backend</em>: An implementation of storage and middleware--sort of a platform, but not as general-purpose</li>
<li><em>Clouds</em>: Links and articles about "their dirt, their hardware" on which one can run or host programs</li>
<li><em>Conferences</em>: A place collecting software developer conferences and links and such</li>
<li><em>DevRel</em>: Developer Relations links and material</li>
<li><em>Distribution</em>: Distributed system research--how information flows between processes</li>
<li><em>Formats</em>: Pages dedicated to different file and data formats (binary, data-storage, whatever)</li>
<li><em>GameDev</em>: Specifically around the development of any sort of game (game frameworks, etc)</li>
<li><em>Hardware</em>: Links about hardware, and links to hardware I'm curious about</li>
<li><em>LangDev</em>: Links and notes about (software) language development</li>
<li><em>Languages</em>: Any and all programming-related languages</li>
<li><em>Libraries</em>: Collection of code; includes O-O frameworks</li>
<li><em>Management</em>: Links and notes about running teams, development or otherwise</li>
<li><em>Patterns</em>: Links and notes about patterns, "design" or otherwise</li>
<li><em>Philosophy</em>: Links and notes about philosophical topics</li>
<li><em>Places</em>: Websites with a wide variety of material, like developer portals</li>
<li><em>Platforms</em>: Environments in which programs execute (includes native, VMs, mobile-native)</li>
<li><em>Presentation</em>: Anything and everything to do with the presentation to the user--user interface libraries, data visualization, and so on. Commonly called "front-ends"</li>
<li><em>Reading</em>: Links to topics that are more conceptual; lots of things will relate to other topics here, but it falls under "reading" if it's a little "meta" or has broader application than just one tool, language, or library.</li>
<li><em>Security</em>: Operating systems, networking, application security, and more</li>
<li><em>Speaking</em>: Links and notes about giving talks to technical audiences</li>
<li><em>Storage</em>: Systems specifically designed to store data (a la "databases" but not always)</li>
<li><em>Tools</em>: Programs used as part of the software development process/lifecycle. Build tools, performance tools, and so on</li>
<li><em>VMs</em>: Virtual machine implementations (differing from platforms mostly due to scope)</li>
<li><em>Writing</em>: Links and notes about how to write (prose) well</li>
</ul>

<p>Hopefully you find this collection of notes and links useful, and feel free to <a href="https://twitter.com/tedneward">drop me a Tweet</a> if you find some interesting things you'd like to add</p>

<p>Please note that I assert no copyright over any of the material contained within; this is a collection of notes and materials from a variety of sources, and my own thoughts. Please do the right thing and respect copyright/licensing.

<p>Ted Neward</p>
<p>(1 May 2020)</p>

<h3>How I use this site</h3>
<p>Our former Secretary of Defense, Donald Rumsfeld, once opined that there's three categories of knowledge: the things you know that you know, the things you know that you don't know, and the things that you don't know that you don't know. This site primarily serves as a way for me to move things from category three ("things you don't know you don't know") into category two ("things you know you don't know") by capturing links and very quick overview of each thing. That way, if I ever want to move something from category two into category one ("things you know you know", or to be more honest, "things you know you know a little more than you did before"), I can then go back and research them more deeply, taking notes on the page as seems appropriate.</p>

<p>How might you use this? That's really not something I can say--I built this for me and my study habits. If yours are like mine, you could fork the repo, then head off in your own direction and find more things and build it up. Or, fork the repo, completely nuke everything under "content" (except for `all.md`, since that's just a placeholder page), and build one up for yourself. Or, just passive ride along with me while I study stuff, and pull from my notes as I go.</p>

<p>(At some point, I will figure out a browser-only search function.)</p>

<p>Ted Neward</p>
<p>(27 April 2025)</p>

<#include "footer.ftl">

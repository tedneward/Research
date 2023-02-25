title=RFD (Request For Discussion)
tags=architecture, reading
summary=A means by which architectural (and other) decisions can be made collaboratively.
~~~~~~

Posts: ["Requests for Discussion"](https://oxide.computer/blog/rfd-1-requests-for-discussion) | ["A Tool for Discussion"](https://oxide.computer/blog/a-tool-for-discussion)

Captured:

# RFDs

The best way to describe RFDs is with “RFD 1 Requests for Discussion.” Below is that RFD.

Writing down ideas is important: it allows them to be rigorously formulated (even while nascent), candidly discussed and transparently shared. We capture the written expression of an idea in a Request for Discussion (RFD), a document in the original spirit of the IETF [Request for Comments](https://en.wikipedia.org/wiki/Request_for_Comments), as expressed by [RFC 3](https://tools.ietf.org/html/rfc3):

> The content of a note may be any thought, suggestion, etc. related to the software or other aspect of the network. Notes are encouraged to be timely rather than polished. Philosophical positions without examples or other specifics, specific suggestions or implementation techniques without introductory or background explication, and explicit questions without any attempted answers are all acceptable. The minimum length for a note is one sentence.

> These standards (or lack of them) are stated explicitly for two reasons. First, there is a tendency to view a written statement as ipso facto authoritative, and we hope to promote the exchange and discussion of considerably less than authoritative ideas. Second, there is a natural hesitancy to publish something unpolished, and we hope to ease this inhibition.

Similar to RFCs, our philosophy of RFDs is to allow both timely discussion of rough ideas, while still becoming a permanent repository for more established ones. Depending on their state, RFDs may be quickly iterated on in a branch, discussed actively as part of a pull request to be merged, or commented upon after having been published. The workflow for the RFD process for is based upon those of the Golang proposal process, Joyent RFD process, Rust RFC process, and Kubernetes proposal process.

# When to use an RFD

The following are examples of when an RFD is appropriate, these are intended to be broad:

* Add or change a company process
* An architectural or design decision for hardware or software
* Change to an API or command-line tool used by customers
* Change to an internal API or tool
* Change to an internal process
* A design for testing

RFDs not only apply to technical ideas but overall company ideas and processes as well. If you have an idea to improve the way something is being done as a company, you have the power to make your voice heard by adding to discussion.

# RFD Metadata and State

At the start of every RFD document, we’d like to include a brief amount of metadata. The metadata format is based on the python-markdown2 metadata format. It’d look like:

    —
    authors: Andy Smith <andy@example.computer>, Neal Jones <neal@example.computer>
    state: prediscussion
    —

We keep track of three pieces of metadata:

* authors: the authors (and therefore owners) of an RFD. They should be listed with their name and e-mail address.
* state: must be one of the states discussed below.
* discussion: for RFDs that are in or beyond the discussion state, this should be a link to the PR to integrate the RFD; see below for details.

An RFD can be in one of the following six states:

* prediscussion
* ideation
* discussion
* published
* committed
* abandoned

A document in the prediscussion state indicates that the work is not yet ready for discussion, but that the RFD is effectively a placeholder. The prediscussion state signifies that work iterations are being done quickly on the RFD in its branch in order to advance the RFD to the discussion state.

A document in the ideation state contains only a description of the topic that the RFD will cover, providing an indication of the scope of the eventual RFD. Unlike the prediscussion state, there is no expectation that it is undergoing active revision. Such a document can be viewed as a scratchpad for related ideas. Any member of the team is encouraged to start active development of such an RFD (moving it to the prediscussion state) with or without the participation of the original author. It is critical that RFDs in the ideation state are clear and narrowly defined.

Documents under active discussion should be in the discussion state. At this point a discussion is being had for the RFD in a Pull Request.

Once (or if) discussion has converged and the Pull Request is ready to be merged, it should be updated to the published state before merge. Note that just because something is in the published state does not mean that it cannot be updated and corrected. See the Making changes to an RFD section for more information.

The prediscussion state should be viewed as essentially a collaborative extension of an engineer’s notebook, and the discussion state should be used when an idea is being actively discussed. These states shouldn’t be used for ideas that have been committed to, organizationally or otherwise; by the time an idea represents the consensus or direction, it should be in the published state.

Once an idea has been entirely implemented, it should be in the committed state. Comments on ideas in the committed state should generally be raised as issues — but if the comment represents a call for a significant divergence from or extension to committed functionality, a new RFD may be called for; as in all things, use your best judgment.

Finally, if an idea is found to be non-viable (that is, deliberately never implemented) or if an RFD should be otherwise indicated that it should be ignored, it can be moved into the abandoned state.

We will go over this in more detail. Let’s walk through the life of a RFD.

# RFD life-cycle
There is a prototype script in this repository, scripts/new.sh, that will automate the process.

    $ scripts/new.sh 0042 “My title here”

If you wish to create a new RFD by hand, or understand the process in greater detail, read on.

> Note
> Never at anytime through the process do you push directly to the master branch. Once your pull request (PR) with your RFD in your branch is merged into master, then the RFD will appear in the master branch.

## Reserve a RFD number
You will first need to reserve the number you wish to use for your RFC. This number should be the next available RFD number from looking at the current git branch -r output.

## Create a branch for your RFD
Now you will need to create a new git branch, named after the RFD number you wish to reserve. This number should have leading zeros if less than 4 digits. Before creating the branch, verify that it does not already exist:

    $ git branch -rl *0042

If you see a branch there (but not a corresponding sub-directory in rfd in master), it is possible that the RFD is currently being created; stop and check with co-workers before proceeding! Once you have verified that the branch doesn’t exist, create it locally and switch to it:

    $ git checkout -b 0042

## Create a placeholder RFD
Now create a placeholder RFD. You can do so with the following commands:

    $ mkdir -p rfd/0042
    $ cp prototypes/prototype.md rfd/0042/README.md

Or if you prefer asciidoc

    $ cp prototypes/prototype.adoc rfd/0042/README.adoc

Fill in the RFD number and title placeholders in the new doc and add your name as an author. The status of the RFD at this point should be prediscussion.

If your preference is to use asciidoc, that is acceptable as well, however the examples in this flow will assume markdown.

## Push your RFD branch remotely
Push your changes to your RFD branch in the RFD repo.

    $ git add rfd/0042/README.md
    $ git commit -m ‘0042: Adding placeholder for RFD <Title>’
    $ git push origin 0042

After your branch is pushed, the table in the README on the master branch will update automatically with the new RFD. If you ever change the name of the RFD in the future, the table will update as well. Whenever information about the state of the RFD changes, this updates the table as well. The single source of truth for information about the RFD comes from the RFD in the branch until it is merged.

## Iterate on your RFD in your branch
Now, you can work on writing your RFD in your branch.

    $ git checkout 0042

Now you can gather your thoughts and get your RFD to a state where you would like to get feedback and discuss with others. It’s recommended to push your branch remotely to make sure the changes you make stay in sync with the remote in case your local gets damaged.

It is up to you as to whether you would like to squash all your commits down to one before opening up for feedback, or if you would like to keep the commit history for the sake of history.

## Discuss your RFD
When you are ready to get feedback on your RFD, make sure all your local changes are pushed to the remote branch. At this point you are likely at the stage where you will want to change the status of the RFD from prediscussion to discussionfor a fully formed RFD or to ideation for one where only the topic is specified. Do this in your branch.

## Push your RFD branch remotely
Along with your RFD content, update the RFD’s state to discussion in your branch, then:

    $ git commit -am ‘0042: Add RFD for <Title>’
    $ git push origin 0042

## Open a Pull Request
Open a pull request on GitHub to merge your branch, in this case 0042 into the master branch.

If you move your RFD into discussion but fail to open a pull request, a friendly bot will do it for you. If you open a pull request but fail to update the state of the RFD to discussion, the bot will automatically correct the state by moving it into discussion. The bot will also cleanup the title of the pull request to be RFD {num} {title}. The bot will automatically add the link to the pull request to the discussion: metadata.

After the pull request is opened, anyone subscribed to the repo will get a notification that you have opened a pull request and can read your RFD and give any feedback.

## Discuss the RFD on the pull request
The comments you choose to accept from the discussion are up to you as the owner of the RFD, but you should remain empathetic in the way you engage in the discussion.

For those giving feedback on the pull request, be sure that all feedback is constructive. Put yourself in the other person’s shoes and if the comment you are about to make is not something you would want someone commenting on an RFD of yours, then do not make the comment.

## Merge the Pull Request
After there has been time for folks to leave comments, the RFD can be merged into master and changed from the discussion state to the published state. The timing is left to your discretion: you decide when to open the pull request, and you decide when to merge it. As a guideline, 3-5 business days to comment on your RFD before merging seems reasonable — but circumstances (e.g., time zones, availability of particular expertise, length of RFD) may dictate a different timeline, and you should use your best judgment. In general, RFDs shouldn’t be merged if no one else has read or commented on it; if no one is reading your RFD, it’s time to explicitly ask someone to give it a read!

Discussion can continue on published RFDs! The discussion: link in the metadata should be retained, allowing discussion to continue on the original pull request. If an issue merits more attention or a larger discussion of its own, an issue may be opened, with the synopsis directing the discussion.

Any discussion on an RFD in the can still be made on the original pull request to keep the sprawl to a minimum. Or if you feel your comment post-merge requires a larger discussion, an issue may be opened on it — but be sure to reflect the focus of the discussion in the issue synopsis (e.g., “RFD 42: add consideration of RISC-V”), and be sure to link back to the original PR in the issue description so that one may find one from the other.

## Making changes to an RFD
After your RFD has been merged, there is always opportunity to make changes. The easiest way to make a change to an RFD is to make a pull request with the change you would like to make. If you are not the original author of the RFD name your branch after the RFD # (e.g. 0001) and be sure to @ the original authors on your pull request to make sure they see and approve of the changes.

Changes to an RFD will go through the same discussion and merge process as described above.

## Committing to an RFD
Once an RFD has become implemented — that is, once it is not an idea of some future state but rather an explanation of how a system works — its state should be moved to be committed. This state is essentially no different from published, but represents ideas that have been more fully developed. While discussion on committed RFDs is permitted (and changes allowed), they would be expected to be infrequent.

## Changing the RFD process
The best part about the RFD process is that it itself is expressed in this RFD; if you want to change the process itself, you can apply the RFD process to its own RFD: chime in on the discussion link or open an issue as dictated by its current state!

# Tooling
## API
Because RFDs are so core to everything we do, we automatically update a CSV file of all the RFDs along with their state, links, and other information in the repo for easy parsing. We then have functions in rust that allow us to easily get this information and automate or program tooling with RFD data.

## Short URLs
As you can imagine, keeping track of RFDs and their links is unweidly at scale. To help, we have short URLs. You can link to any RFD on GitHub with {num}.rfd.oxide.computer. So for example, 12.rfd.oxide.computer. The path also works: rfd.oxide.computer/12 if that is preferred.

Any discussion for an RFD can be linked with {num}.rfd.oxide.computer/discussion.

These short URLs get automatically updated when a new RFD is opened.

## Chat bot
In chat you can use !rfd {any text} | {rfd number} to return information about that RFD. For example, `!rfd 1` returns the links to RFD 1, its discussion (if it is in discussion), and information about its state. Remembering the number for an RFD is often hard so any strings you pass to the bot will be fuzzy matched across RFD titles. `!rfd user api` will return the RFD that title matches the text. In this example, it is RFD 4.

## Shared RFD Rendered Site
As a way to share certain RFDs with other parties like potential customers, partners, and friends of the company, we have created a website that renders the RFD markdown or asciidoc into HTML in a nice format. This is a nice way to get feedback without adding everyone to the repo (as well as nicely formatting the content).


title=DeltaDB
tags=storage, tool, version control
summary=A version control system that records the work as it unfolds and keeps every change connected to the conversation that shaped it.
~~~~~~

[Website](https://zed.dev/deltadb) | [Announcement](https://zed.dev/blog/introducing-deltadb) | Currently closed-source/beta

## Announcement
DeltaDB breaks your work into a stream of fine-grained _deltas_. Where Git captures a snapshot at each commit, DeltaDB captures every operation in between and gives each one a stable identity. Because every delta can be addressed on its own, you can point to the code at any moment in its evolution, even as it keeps changing. That lets us version a worktree as it evolves, together with the conversation driving it.

A message and the edit it produced are recorded side by side, so neither drifts away from the other. Because DeltaDB embeds conflict-free replicated worktrees, many people and agents can edit the same files at once across different machines. The files are real: agents work in them through a terminal, and you can mount the whole worktree to disk whenever you want your own tools on it.

**Source code is now source conversation**

Because every reference is anchored to a delta instead of a line number, it survives as the code moves underneath it. From any line in a past conversation, you can jump to that code as it stands now or as it stood the moment the agent wrote it. From any line of code, you can find the conversation that produced it and every conversation that has touched it since.

Agents can draw on it too. They pick up the context behind the code they're touching or convene the prior agents that worked on it and ask why it's written the way it is.

**You shouldn't need to commit to collaborate**

What we're really after is simple: the conversation with the agent becomes the only conversation you need to have. A teammate can join while the work is still happening, talk to the agent that did the work, and annotate as they go, without waiting for you to commit and push first.

Pull requests, review threads, and inline comments exist to reattach a discussion to code after the fact because the discussion and the code lived in separate places. Put them in the same place, and the ceremony disappears. Git and CI stay for what they're good at: running checks and connecting you to the rest of the world, rather than being the place collaboration is forced to happen.


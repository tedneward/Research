title=Writing a Good Claude.md
tags=reading, article, ai, llm, agents
summary=How to write a good agent skills file.
~~~~~~

[Source](https://www.hlyr.dev/blog/writing-a-good-claude-md)

1. CLAUDE.md is for onboarding Claude into your codebase. It should define your project's WHY, WHAT, and HOW.
2. Less (instructions) is more. While you shouldn't omit necessary instructions, you should include as few instructions as reasonably possible in the file.
3. Keep the contents of your CLAUDE.md concise and universally applicable.
4. Use Progressive Disclosure - don't tell Claude all the information you could possibly want it to know. Rather, tell it how to find important information so that it can find and use it, but only when it needs to to avoid bloating your context window or instruction count.
5. Claude is not a linter. Use linters and code formatters, and use other features like Hooks and Slash Commands as necessary.
6. CLAUDE.md is the highest leverage point of the harness, so avoid auto-generating it. You should carefully craft its contents for best results.


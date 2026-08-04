title=Agent Island
tags=tool, ai, coding
summary=An open-source status companion for Claude Code and Codex on macOS and Windows: live session state, your-turn alerts, and local monitoring with no Agent Island account or product telemetry.
~~~~~~

[Website](https://agent-island.dev/) | [Source](https://github.com/tristan666666/agent-island)

It runs on your machine, reads the transcript files your tools already write to disk, and calls the official usage APIs with the tokens you already have locally. No account, no telemetry.

## Getting Started

`brew install tristan666666/tap/agentisland`

Also binaries available for download.

## Comparisons to related tools

* CodexBar
* ClaudeBar
* Usage4Claude
* Vibe Island
* ccusage

|     | Agent Island | CodexBar | ClaudeBar | Usage4Claude | Vibe Island | ccusage |
| --- | --- | --- | --- | --- | --- | --- |
| Price | Free | Free | Free | Free | Paid (from $14.99, one-time) | Free |
| Source and license | MIT, open-source | MIT, open-source | Public GitHub repo; no license declared | MIT, open-source | Closed-source | Public GitHub repo |
| Platforms | macOS + Windows | macOS | macOS | macOS | macOS | CLI (any OS with Node) |
| Where it lives | Menu bar / notch + floating bar | Menu bar | Menu bar | Menu bar | Notch | Terminal |
| Live agent status | ✓ working / your turn / stalled | —   | —   | —   | ✓   | —   |
| Alarm when a run needs you | ✓ turn alarm (sound + popup) | quota alerts only | —   | —   | ✓ event sound alerts | —   |
| Usage & reset countdown | ✓ Claude 5h + weekly Codex weekly | ✓   | ✓   | ✓   | ✓   | Usage reports |
| Agents / providers covered | Claude Code + Codex | Broad multi-provider coverage | Claude, Codex, Gemini, Copilot + others | Claude + Codex | Multiple coding agents | Claude, Codex, Gemini + others |
| Local operation documented | ✓ no Agent Island account or product telemetry | ✓ privacy-first, reuses provider sessions | ✓ native local app | ✓ native local app | ✓ local-first advertised | ✓ local CLI |


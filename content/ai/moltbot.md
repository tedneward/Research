title=OpenClaw / MoltBot / ClawdBot
tags=ai, tool
summary=Clears your inbox, sends emails, manages your calendar, checks you in for flights.
~~~~~~

[Website](https://openclaw.ai/) | [Source](https://github.com/openclaw/openclaw)

---

# Working Clawdbot/Moltbot setup with local Ollama model

[Update 2026-02-02: `nemotron-3-nano` also performs well on same setup; see [comment below](https://gist.github.com/Hegghammer/86d2070c0be8b3c62083d6653ad27c23?permalink_comment_id=5966361#gistcomment-5966361)]

This is a guide to setting up Clawdbot/Moltbot with a local Ollama model that actually works -- meaning it has good tool use and decent speed. The main requirement is 48GB of VRAM. I have yet to find a model that fits on less than this and still works on Moltbot. 

The setup involves creating a tool-tuned variant of `qwen2.5:72b` and modifying a range of configs in Moltbot. At the end you'll get a local Moltbot instance that can use tools (exec, read, write, web search), read skills, and perform agentic tasks without any cloud API dependencies. On my system I get ~16 t/s and have yet to come across a tool/skill that my bot can't use.

Claude Opus wrote the first draft of this Gist, then I (a human) checked and edited it.

## Background

I was keen to find an Ollama model that would fit my 48GB VRAM rig and also work with Moltbot. So I set up two Moltbot agents, EngineerBot and TestBot, and gave the first Claude Opus 4.5 access and the latter only Ollama access. I gave EngineerBot SSH access to TestBot and asked it to craft and run a suite of tool-use tests. EngineerBot and I then iteratively tweaked configs on TestBot together until we found the best setup. 

**Models tested:**
- GLM-4.7-Flash (q4_K_M)
- Qwen3-Coder
- GPT-OSS 20B
- Qwen 2.5 72B Instruct (q4_K_M)
- Qwen 2.5 72B Instruct (q3_K_M)

The winner was a tuned (details below) version of `qwen2.5:72b-instruct-q3_K_M`. The smaller models struggled with Moltbot's system prompt complexity — rambling about identity, calling wrong tools, or hallucinating tool names. The 72B models performed significantly better at tool use, with the Q3 quantization providing the best balance of performance and VRAM headroom.

The process uncovered several non-obvious issues:
- The `api` setting mismatch that causes silent empty responses
- The missing `"read"` permission that prevents skill file access
- The need for a custom system prompt to make Qwen actually *use* tools instead of describing them
- Environment variable inheritance issues with exec subprocesses
- Verbosity problems requiring SOUL.md guidance

What you see below is the configuration that emerged from this testing — the setup that, for me at least, gave the best tool-use performance on 48GB VRAM.

## Prerequisites

### Hardware
- **GPU:** Minimum 24GB VRAM recommended for 72B models (quantized). We used 2x RTX 3090 (48GB total).
- **RAM:** 64GB+ recommended
- **Storage:** ~50GB for the model

**VRAM note:** The Q3 quantized model with 16k context window uses ~43GB VRAM, leaving headroom on a 48GB setup for other tasks.

**Performance:** Expect ~16 tokens/sec on 2x RTX 3090 with flash attention enabled.

### Software
- **Ollama** installed and running (https://ollama.ai)
- **Moltbot** installed (`npm install -g clawdbot`)
- **Node.js** 22+

### Ollama Server Configuration

Set these environment variables for the Ollama server (in your systemd service, Docker compose, or shell):

```bash
OLLAMA_CONTEXT_LENGTH=16384    # Context window size
OLLAMA_FLASH_ATTENTION=1       # Enable flash attention (faster, less VRAM)
OLLAMA_NEW_ENGINE=1            # Use new inference engine
```

For Docker, add to your `docker-compose.yml`:
```yaml
environment:
  - OLLAMA_CONTEXT_LENGTH=16384
  - OLLAMA_FLASH_ATTENTION=1
  - OLLAMA_NEW_ENGINE=1
```

### The Model

The qwen-agentic model is a custom Ollama model built from Qwen 2.5 72B with a tool-tuned system prompt. Create it like this:

#### Step 1: Pull the base model
```bash
ollama pull qwen2.5:72b-instruct-q3_K_M
```

#### Step 2: Create the Modelfile

Save this as `qwen-agentic.Modelfile`:

```
FROM qwen2.5:72b-instruct-q3_K_M

SYSTEM """You are a helpful assistant with access to tools.

CRITICAL TOOL BEHAVIOR:
- When you have tools available, USE THEM directly without asking for confirmation
- Don't describe what you could do — just do it
- If the user asks about weather, check the weather. If they ask to search something, search it
- Never say "I don't have access to X" when you have a tool that provides X
- Check your available tools and use them immediately
- Execute the task, then report results

Be concise. Act decisively. Don't ask permission for routine tool use."""
```

That's it — the tool-calling TEMPLATE is inherited automatically from the base Qwen model.

#### Step 3: Build the model
```bash
ollama create qwen-agentic -f qwen-agentic.Modelfile
```

#### Why this matters

The custom SYSTEM prompt is crucial — it tells the model to:
- **Use tools immediately** without asking for confirmation
- **Be decisive** instead of explaining what it could do
- **Act first, report results** instead of describing plans

Without this, Qwen tends to describe tools rather than use them, or ask permission before every action.

---

## Moltbot Configuration

Create or edit `~/.clawdbot/clawdbot.json`:

### 1. Ollama Provider (Critical Settings)

```json
{
  "models": {
    "providers": {
      "ollama": {
        "baseUrl": "http://localhost:11434/v1",
        "apiKey": "ollama",
        "api": "openai-completions",
        "authHeader": false,
        "models": [
          {
            "id": "qwen-agentic:latest",
            "name": "Qwen 2.5 72B Agentic",
            "reasoning": false,
            "input": ["text"],
            "cost": {
              "input": 0,
              "output": 0,
              "cacheRead": 0,
              "cacheWrite": 0
            },
            "contextWindow": 32768,
            "maxTokens": 8192
          }
        ]
      }
    }
  }
}
```

**⚠️ Critical:** The `api` setting MUST be `"openai-completions"`, NOT `"openai-responses"`.
- `openai-responses` is for OpenAI's newer Responses API
- Ollama uses standard chat completions = `openai-completions`
- **Getting this wrong causes empty responses** — the model runs but Moltbot can't parse the output

### 2. Agent Defaults

```json
{
  "agents": {
    "defaults": {
      "model": {
        "primary": "ollama/qwen-agentic:latest",
        "fallbacks": []
      },
      "models": {
        "ollama/qwen-agentic:latest": {
          "alias": "qwen-agentic"
        }
      },
      "workspace": "/home/youruser/clawd",
      "skipBootstrap": false,
      "memorySearch": {
        "enabled": false
      },
      "compaction": {
        "mode": "safeguard"
      },
      "maxConcurrent": 4,
      "subagents": {
        "maxConcurrent": 8
      }
    }
  }
}
```

### 3. Tools Configuration (Critical for Tool Use)

```json
{
  "tools": {
    "profile": "coding",
    "allow": [
      "read",
      "exec",
      "write",
      "edit"
    ],
    "exec": {
      "host": "gateway",
      "ask": "off",
      "security": "full"
    }
  }
}
```

Add `"web_search"` and `"web_fetch"` to `allow` if you want web search (requires additional config).

**Critical settings explained:**

| Setting | Value | Why |
|---------|-------|-----|
| `allow` includes `"read"` | Required | Without this, the agent can't read skill files! |
| `exec.ask` | `"off"` | Prevents approval popups for every command |
| `exec.security` | `"full"` | Allows all commands, not just an allowlist |
| `exec.host` | `"gateway"` | Commands run on the gateway host |

---

## Complete Working Config

Here's a full, tested configuration:

```json
{
  "diagnostics": {
    "enabled": true,
    "flags": ["*"]
  },
  "models": {
    "providers": {
      "ollama": {
        "baseUrl": "http://localhost:11434/v1",
        "apiKey": "ollama",
        "api": "openai-completions",
        "authHeader": false,
        "models": [
          {
            "id": "qwen-agentic:latest",
            "name": "Qwen 2.5 72B Agentic",
            "reasoning": false,
            "input": ["text"],
            "cost": { "input": 0, "output": 0, "cacheRead": 0, "cacheWrite": 0 },
            "contextWindow": 32768,
            "maxTokens": 8192
          }
        ]
      }
    }
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "ollama/qwen-agentic:latest",
        "fallbacks": []
      },
      "models": {
        "ollama/qwen-agentic:latest": {
          "alias": "qwen-agentic"
        }
      },
      "workspace": "/home/youruser/clawd",
      "memorySearch": { "enabled": false },
      "compaction": { "mode": "safeguard" }
    }
  },
  "tools": {
    "profile": "coding",
    "allow": ["read", "exec", "write", "edit"],
    "exec": {
      "host": "gateway",
      "ask": "off",
      "security": "full"
    }
  }
}
```

---

## Taming Verbosity (SOUL.md)

Local models like Qwen tend to over-explain. They'll dump entire skill documentation, show full JSON responses, and ask for confirmation before every action.

**Fix:** Add explicit brevity instructions to your workspace's `SOUL.md`:

```markdown
## Brevity is a Virtue

**Be concise.** This is critical. You tend to over-explain. Fight that urge.

- Do NOT dump skill documentation at the user — just use it
- Do NOT show full JSON responses — summarize the result
- Do NOT ask for confirmation when env vars or configs are already set — trust your setup
- Do NOT explain what you're about to do in detail — just do it
- One short sentence confirming success is enough: "Done, server lights are on."

**Bad:** "I'll use the curl command to turn on the switch via the Home Assistant API. First, I need to ensure the environment variables..."

**Good:** "Turning on server lights..." *[runs command]* "Done."

When in doubt: fewer words.
```

This won't make it as concise as Claude, but it significantly reduces the verbosity.

---

## Environment Variables

If your skills need environment variables (API tokens, URLs, etc.), there are two approaches:

### Option 1: ~/.clawdbot/.env (Simpler)
Add variables to `~/.clawdbot/.env`:
```bash
HA_URL=https://your-homeassistant.local
HA_TOKEN=your-long-lived-token
```

**Caveat:** These must be present *before* starting the gateway. If you add them later and restart, they may not propagate to exec subprocesses reliably.

### Option 2: Wrapper Scripts (More Robust)
Create wrapper scripts with credentials baked in:

```bash
#!/bin/bash
# ~/bin/ha - Home Assistant wrapper
export HA_URL="https://your-homeassistant.local"
export HA_TOKEN="your-token"

case "$1" in
  on)    curl -s -X POST "$HA_URL/api/services/switch/turn_on" -H "Authorization: Bearer $HA_TOKEN" -H "Content-Type: application/json" -d "{\"entity_id\": \"$2\"}" ;;
  off)   curl -s -X POST "$HA_URL/api/services/switch/turn_off" -H "Authorization: Bearer $HA_TOKEN" -H "Content-Type: application/json" -d "{\"entity_id\": \"$2\"}" ;;
  state) curl -s "$HA_URL/api/states/$2" -H "Authorization: Bearer $HA_TOKEN" ;;
esac
```

Then document in `TOOLS.md`:
```markdown
### Helper Script
Use `~/bin/ha` for Home Assistant:
- `~/bin/ha on switch.living_room`
- `~/bin/ha off switch.living_room`
- `~/bin/ha state switch.living_room`
```

---

## Installing Skills

Skills are just SKILL.md files that tell the agent how to use tools. Copy them to your workspace:

```bash
mkdir -p ~/clawd/skills/skill-name
cp /path/to/SKILL.md ~/clawd/skills/skill-name/
```

The agent will automatically discover skills in `~/clawd/skills/*/SKILL.md`.

---

## Troubleshooting

### Empty Responses
**Symptom:** Model runs (you see it thinking) but returns nothing.
**Cause:** Wrong `api` setting.
**Fix:** Change `api: "openai-responses"` → `api: "openai-completions"`

### Approval Popups for Every Command
**Symptom:** Web UI asks for approval before running commands.
**Fix:** Set `tools.exec.ask: "off"`

### "Permission denied" or Tool Not Available
**Symptom:** Agent says it can't use a tool.
**Fix:** Add the tool to `tools.allow` array. Common missing one: `"read"` (needed for reading skill files).

### Environment Variables Not Working
**Symptom:** 401 Unauthorized or "variable not set" errors.
**Causes:**
1. Variables added after gateway started
2. Shell inheritance issues

**Fixes:**
1. Add vars to `.env` before first start
2. Use wrapper scripts with credentials baked in
3. Add vars to systemd service file directly

### Model Too Verbose
**Symptom:** Agent dumps documentation, explains everything, asks unnecessary questions.
**Fix:** Add brevity instructions to SOUL.md (see above).

---

## Verifying It Works

1. Start the gateway: `clawdbot gateway start`
2. Open the web UI: `http://localhost:18789`
3. Test basic tool use:
   - "What time is it?" (should run `date`)
   - "List files in the current directory" (should run `ls`)
   - "What's the weather?" (if you have the weather skill)

If these work, your setup is good.

---

## Summary Checklist

- [ ] Ollama running with qwen-agentic model
- [ ] `api: "openai-completions"` in provider config
- [ ] `"read"` in `tools.allow` array
- [ ] `exec.ask: "off"` and `exec.security: "full"`
- [ ] Brevity instructions in SOUL.md
- [ ] Environment variables in .env (before first start) or wrapper scripts
- [ ] Skills copied to workspace

---

*Guide based on real debugging sessions, January 2026. Your mileage may vary with different models or Moltbot versions.*

title=OpenClaw / MoltBot / ClawdBot
tags=ai, tool, agent
summary=Clears your inbox, sends emails, manages your calendar, checks you in for flights.
~~~~~~

[Website](https://openclaw.ai/) | [Source](https://github.com/openclaw/openclaw)

OpenClaw is a personal AI assistant you run on your own devices. It answers you on the channels you already use (WhatsApp, Telegram, Slack, Discord, Google Chat, Signal, iMessage, BlueBubbles, IRC, Microsoft Teams, Matrix, Feishu, LINE, Mattermost, Nextcloud Talk, Nostr, Synology Chat, Tlon, Twitch, Zalo, Zalo Personal, WebChat). It can speak and listen on macOS/iOS/Android, and can render a live Canvas you control. The Gateway is just the control plane — the product is the assistant.

If you want a personal, single-user assistant that feels local, fast, and always-on, this is it.

## Resources

### Articles, Blogs, Essays

- [Run OpenClaw Securely in Docker Sandboxes](https://www.docker.com/blog/run-openclaw-securely-in-docker-sandboxes/)
- [Running OpenClaw in Docker](https://til.simonwillison.net/llms/openclaw-docker)
- [How to Set Up OpenClaw and Design an A2A Plugin Bridge](https://www.freecodecamp.org/news/openclaw-a2a-plugin-architecture-guide/)
- [How to Build a Secure Local-First Agent Runtime with OpenClaw Gateway, Skills, and Controlled Tool Execution](https://www.marktechpost.com/2026/04/11/how-to-build-a-secure-local-first-agent-runtime-with-openclaw-gateway-skills-and-controlled-tool-execution/)
- [Running OpenClaw with Ollama](https://www.kdnuggets.com/running-openclaw-with-ollama): Ollama defaults to context lengths based on available VRAM: under 24 GB gets 4k context, 24–48 GB gets 32k, and 48 GB or more gets 256k. The default for most consumer hardware is 4k, which is not enough for an agent doing multi-step tasks. You will need to set context explicitly.

    Model recommendations:

    | **Model** | **Type** | **VRAM** | **Best for** |
    | --- | --- | --- | --- |
    | **[kimi-k2.5:cloud](https://ollama.com/library/kimi-k2.5)** | Cloud | None | Multimodal reasoning and sub-agents |
    | **[qwen3.5:cloud](https://ollama.com/library/qwen3.5)** | Cloud | None | Reasoning, coding, vision |
    | **[minimax-m2.7:cloud](https://ollama.com/library/minimax-m2.7)** | Cloud | None | Fast productivity tasks |
    | **[glm-5.1:cloud](https://ollama.com/library/glm-5.1)** | Cloud | None | Reasoning and code generation |
    | **[qwen3-coder](https://ollama.com/library/qwen3-coder)** | Local | ~25 GB | Coding tasks, full privacy |
    | **[gemma4](https://ollama.com/library/gemma4)** | Local | ~16 GB | Reasoning locally |

    Cloud models have full context length automatically and include web search support without any additional configuration. For most users starting out, `kimi-k2.5:cloud` is the right pick; it is free to start, handles agentic tasks well, and requires no VRAM.

    Once the Gateway is running, you connect your messaging platform with:

    ```
    openclaw configure --section channels
    ```

    This opens an interactive selector listing WhatsApp, Telegram, Slack, Discord, and iMessage. The setup steps differ per platform. Telegram is the cleanest starting point for developers. It requires no phone number linking and uses a proper bot token rather than emulating a personal account.

    **Step 1: Create a bot with BotFather**  
    Open Telegram and search for **[@BotFather](https://t.me/botfather)**. Send `/newbot`, choose a name (this is the display name), then choose a username (must end in bot, e.g. `my_openclaw_bot`). BotFather returns a token that looks like:

    ```
    1234567890:AAFxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ```

    Copy this token. You will not be shown it again. If you lose it, you can generate a new one with `/token`.

    **Step 2: Paste the token into OpenClaw**  
    In the `openclaw configure --section channels` menu, select Telegram, then paste the bot token when prompted.

    **Step 3: Select "Finished" to save**  
    After configuring, select Finished in the configurator. This is required. Exiting without selecting Finished discards your configuration.

    **Step 4: Find your bot on Telegram and start a conversation**  
    Search for your bot's username in Telegram. Send `/start`. The Gateway handles the first connection and the bot begins responding.

    For WhatsApp, the process uses the Baileys protocol, which means you scan a QR code in the OpenClaw TUI to link your WhatsApp account. This works, but it links your actual WhatsApp account rather than creating a separate bot account. Be aware of that before proceeding.

    For Slack and Discord, you will need to create an app in each platform's developer portal and supply the bot token and channel IDs. The OpenClaw configurator walks through the required fields for each.

    Noninteractive/headless deployment Dockerfile:

    ```
    # Dockerfile
    # Runs Ollama + OpenClaw as a headless agent service.
    # Build: docker build -t openclaw-agent .
    # Run:   docker run -d --gpus all --env-file .env openclaw-agent
    #
    # Prerequisites for the build machine:
    #   - Docker with nvidia-container-toolkit (for GPU passthrough)
    #   - A .env file with OLLAMA_API_KEY and channel credentials

    FROM ubuntu:22.04

    # ── System dependencies ────────────────────────────────────────────────────────
    # Ubuntu 22.04's default apt repo ships Node.js 12.x, which does not meet
    # OpenClaw's Node.js 18+ requirement, so Node.js 18 is installed via NodeSource.
    RUN apt-get update && apt-get install -y curl \
        && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
        && apt-get install -y nodejs \
        && rm -rf /var/lib/apt/lists/*

    # ── Install Ollama ─────────────────────────────────────────────────────────────
    RUN curl -fsSL https://ollama.com/install.sh | sh

    # ── Install OpenClaw via npm ───────────────────────────────────────────────────
    # Install globally so the `openclaw` binary is in PATH
    RUN npm install -g openclaw

    # ── Set context length for agent workloads ─────────────────────────────────────
    # 64000 is the minimum. Increase if your GPU has VRAM headroom.
    ENV OLLAMA_CONTEXT_LENGTH=64000

    # ── Startup script ─────────────────────────────────────────────────────────────
    # 1. Start the Ollama server in the background
    # 2. Wait for it to be ready
    # 3. Launch OpenClaw headlessly with the specified cloud model
    COPY start.sh /start.sh
    RUN chmod +x /start.sh

    EXPOSE 11434

    CMD ["/start.sh"]

    # start.sh -- runs alongside the Dockerfile above

    #!/bin/bash
    set -e

    # Start the Ollama server in the background
    ollama serve &
    OLLAMA_PID=$!

    # Wait until Ollama's API is responding (up to 30 seconds)
    echo "Waiting for Ollama to start..."
    for i in $(seq 1 30); do
        if curl -s http://localhost:11434/api/tags > /dev/null 2>&1; then
            echo "Ollama ready."
            break
        fi
        sleep 1
    done

    # Launch OpenClaw headlessly -- --yes skips all interactive prompts
    # OLLAMA_MODEL should be set in your .env file or docker run -e flag
    ollama launch openclaw \
        --model "${OLLAMA_MODEL:-kimi-k2.5:cloud}" \
        --yes

    # Keep the container alive and follow OpenClaw's logs
    wait $OLLAMA_PID
    

    Build and run:

    # Create a .env file with your credentials
    cat > .env << EOF
    OLLAMA_MODEL=kimi-k2.5:cloud
    OLLAMA_API_KEY=your_ollama_api_key
    EOF

    # Build the image
    docker build -t openclaw-agent .

    # Run with GPU passthrough (requires nvidia-container-toolkit)
    docker run -d \
        --gpus all \
        --env-file .env \
        --name openclaw \
        openclaw-agent

    # Follow logs
    docker logs -f openclaw
    ```

### Skills

- [awesome-openclaw-skills](https://github.com/VoltAgent/awesome-openclaw-skills)

### Videos

- [How to Setup & Run OpenClaw with Ollama on Mac/macOS and Zero API Cost (2026)](https://www.youtube.com/watch?app=desktop&v=iPH3Le99kqs)

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

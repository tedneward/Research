title=Speakr
tags=tool, platform
summary=A personal, self-hosted web application designed for transcribing audio recordings.
~~~~~~

[Source](https://github.com/murtaza-nasir/speakr)

## Key Features

Speakr turns a recording into organized, searchable, shareable knowledge. Here is the pipeline:

### Capture

-   **Flexible input** - record from your microphone, your computer's system or browser-tab audio, or both mixed together; or drag and drop existing files. A per-OS setup guide and a virtual-device picker surface Pulse / PipeWire monitors, BlackHole, VB-Cable, Voicemeeter, and Stereo Mix as inputs.
-   **Long sessions** - in-app recordings stream to the server during capture, so sessions can run for hours and survive a page reload.
-   **Hands-off intake** - a watched "black hole" folder auto-imports and processes any audio dropped into it.

### Transcribe

-   **Bring your own engine** - self-hosted WhisperX (recommended; it is what enables the speaker features below), OpenAI, Mistral / Voxtral, AssemblyAI, or any custom ASR webservice. The right connector is auto-detected from your configuration.
-   **Speaker diarization** - automatic who-said-what labeling (WhisperX, or OpenAI's diarizing models).
-   **Voice profiles** - recognize the same person across different recordings via voice embeddings (requires the WhisperX ASR backend).
-   **Custom vocabulary and hotwords** (most effective with the WhisperX backend) - bias the transcriber toward names, jargon, and acronyms it would otherwise mishear; configurable globally or per tag / folder.
-   **Synced playback** - click any line to jump to that moment, follow-along highlighting during playback, and a chat-style bubble view.
-   **Language support** - automatic language detection plus a quick-pick of 11 common languages.

### Understand

-   **Summaries** - generated automatically, with prompts you can fully customize per recording, tag, or folder (including reusable prompt variables).
-   **Event extraction** - surface action items and calendar-worthy events from a transcript.
-   **Per-recording chat** - ask questions about a single recording in a floating, dockable panel.
-   **Inquire Mode** - semantic search and natural-language chat across your entire library at once.

### Organize

-   **Folders and bulk operations** to keep a large library tidy.
-   **Smart tags** that carry their own AI prompt and ASR settings - and stack, so multiple tags layer their instructions.
-   **Retention policies** with auto-deletion and per-recording protection from cleanup.
-   **Automated export** to templated files when a recording finishes.

### Collaborate

-   **Multi-user** with **Single Sign-On** against any OIDC provider (Keycloak, Azure AD, Google, Auth0, Pocket ID).
-   **Groups** with group-scoped tags that auto-share recordings to every member.
-   **Granular internal sharing** (view / edit / reshare) and admin-controlled, secure **public links**.

### Automate

-   **REST API v1** with a Swagger UI, for automation tools (n8n, Zapier, Make) and dashboards.
-   **Signed webhooks** - HMAC-signed, SSRF-guarded, retrying outbound notifications on recording lifecycle events.
-   **Usage budgets** for LLM tokens and transcription minutes, per user.

Speakr is also an installable Progressive Web App - mobile-first, offline-capable, with a phone share-target - and ships light/dark themes, an incognito mode, and a UI translated into seven languages.


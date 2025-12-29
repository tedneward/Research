title=8mb.local
tags=tool
summary=A self-hosted solution for GPU-accelerated video encoding. 
~~~~~~

[Website](https://8mb.campuscal.tech/) | [Source](https://github.com/JMS1717/8mb.local)

8mb.local is a self‑hosted, fire‑and‑forget video compressor. Drop a file, choose a target size (e.g., 8MB, 25MB, 50MB, 100MB), and let GPU-accelerated encoding produce compact outputs with AV1/HEVC/H.264. Supports NVIDIA NVENC, Intel/AMD VAAPI (Linux), and CPU fallback. The stack includes a SvelteKit UI, FastAPI backend, Celery worker, Redis broker, and real‑time progress via Server‑Sent Events (SSE).

## Features

* Multi-vendor GPU support: Auto-detects NVIDIA NVENC, Intel/AMD VAAPI (Linux), or falls back to CPU
* Robust encoder validation: Tests actual encoder initialization, not just availability listing
* Automatic CPU fallback: Gracefully handles missing drivers, permission issues, or hardware access problems
* Drag‑and‑drop UI with helpful presets and advanced options (codec, container, tune, audio bitrate)
* Configurable codec visibility: Enable/disable specific codecs in Settings page
* Resolution control: Set max width/height while maintaining aspect ratio
* Video trimming: Specify start/end times (seconds or HH:MM:SS format)
* ffprobe analysis on upload for instant estimates and warnings
* Real‑time progress tracking: Multi-signal progress using actual output size, time processed, bitrate, and wall-clock estimates for smooth, accurate updates
* Real‑time FFmpeg logs: Streaming logs during compression for instant feedback
* Live Queue Management: View all active jobs with real-time progress, cancel individual jobs, or clear entire queue
* One‑click Cancel: Stop an in‑flight encode; worker interrupts FFmpeg immediately
* Queue Clear: Remove all jobs (cancel running, remove queued/completed) with one click
* Automatic file size optimization: If output exceeds target by >2%, automatically re-encodes with adjusted bitrate
* Smart retry notifications: Audio alerts and visual notifications when auto-retry occurs
* History tracking enabled by default: Recent jobs stored in /app/history.json
* Auto‑download enabled by default
* Hardware encoders: AV1, HEVC (H.265), H.264 (GPU-accelerated when available)
* Software fallback: libx264, libx265, libaom-av1 for CPU-only systems
* Output container choice: MP4 or MKV, with compatibility safeguards
* Version tracking: UI displays current version (v125+), backend provides /api/version endpoint


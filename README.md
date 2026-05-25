<p align="center">
  <img src="assets/Logo Icon 3.png" alt="Social Claw" width="80">
</p>

<h1 align="center"><em>Social Claw</em></h1>

<p align="center">
  <strong>Your personal AI agent — secure, containerized, and always reachable.</strong><br>
  <sub>Connect via WhatsApp · Telegram · Discord · Signal · Slack · iMessage · CLI</sub>
</p>

<img width="1918" height="890" alt="social-claw" src="https://github.com/user-attachments/assets/71c6ae6d-f729-4b82-9e49-71870804f59c" />


<p align="center">
  <a href="https://github.com/social-cli/social-claw"><img src="https://img.shields.io/badge/GitHub-social--claw-181717?logo=github" alt="GitHub"></a>&nbsp;
  <a href="https://socialcli.xyz"><img src="https://img.shields.io/badge/Web-socialcli.xyz-D95F2B" alt="Website"></a>&nbsp;
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT">
</p>

---

<br>

## ⚡ Quick Start

```bash
git clone https://github.com/social-cli/social-claw.git
cd social-claw
bash socialclaw.sh
```

> Setup handles everything — Node, pnpm, Docker, container build, and channel pairing. You'll be chatting with your agent in under 5 minutes.

<br>

## 🛡️ Core Features

| | Feature | Description |
|---|---|---|
| 🐳 | **Container Isolation** | Each agent runs in its own Linux container. Commands execute inside the sandbox, never on your host. |
| 💬 | **Multi-Channel** | Telegram, Discord, WhatsApp, Signal, iMessage, Slack, Teams, Matrix, Google Chat, email. Add more with `/add-<channel>`. |
| 🧠 | **Per-Agent Memory** | Every agent has its own workspace, instructions, and persistent memory. Nothing crosses boundaries. |
| ⏰ | **Scheduled Tasks** | Recurring jobs that run your agent on a cron and message you back with results. |
| 🌐 | **Web Access** | Search the web, fetch pages, summarize content — all from within the agent sandbox. |
| 🔐 | **Credential Vault** | API keys never enter the container. Outbound requests route through OneCLI vault which injects auth at request time. |
| 🤖 | **AI-Native Debugging** | Something broke? Describe it in chat. The agent diagnoses and fixes itself. |

<br>

## 📱 Supported Channels

During setup, choose how you want to talk to your agent:

```
● Telegram (recommended)
○ Discord
○ WhatsApp
○ Signal
○ iMessage (experimental)
○ Slack (experimental)
○ Microsoft Teams
○ Terminal (local CLI)
○ Other… (install via /add-<name> after setup)
```

Run multiple channels simultaneously — or add more anytime.

<br>

## 🧩 Skills (Optional Add-ons)

Skills extend what your agent can do. Install only what you need.

| Skill | What it adds |
|-------|-------------|
| **Social CLI** | Post, schedule, and manage content across 15 social platforms. 35+ MCP tools. [Get a key →](https://socialcli.xyz) |
| **Custom** | Build your own skills or install community ones — calendar, code review, docs, anything. |

Once installed, just talk:

```
@agent post "Just shipped v2!" to Twitter and LinkedIn
@agent schedule a thread for tomorrow 9am
@agent check my engagement this week
@agent reply to unanswered DMs
```

<br>

## 🏗️ Architecture

```
┌─────────────┐     ┌──────────────┐     ┌─────────────────────────┐
│  Messaging  │────▶│  Host Process │────▶│  Container (Agent SDK)  │
│  Channels   │◀────│  (Router)     │◀────│  Sandboxed execution    │
└─────────────┘     └──────────────┘     └─────────────────────────┘
                         │    ▲
                    inbound.db  outbound.db
```

One Node process on the host. Per-session containers. Two SQLite files per session (one writer each). No microservices, no IPC, no complexity.

<br>

## 🎨 Customizing

No config files. Just tell your agent what you want:

```
"Change the trigger word to @brand"
"Make responses shorter and more direct"
"Add a daily analytics summary at 9am"
"Store conversation summaries weekly"
"Only respond in Spanish"
```

The codebase is small enough that the agent can safely modify itself.

<br>

## 📋 Requirements

| | Requirement |
|---|---|
| 💻 | macOS, Linux, or Windows (via WSL2) |
| 📦 | Node.js 20+ and pnpm 10+ |
| 🐳 | Docker Desktop or Docker Engine |
| 🔑 | Anthropic API key (for Claude) |

<br>

## 📄 License

MIT


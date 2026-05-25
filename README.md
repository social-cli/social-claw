<p align="center">
  <img src="assets/Logo Icon 3.png" alt="Social Claw" width="72">
</p>

<h1 align="center"><em>Social Claw</em></h1>

<p align="center">
  <strong>Message your agent. It handles the rest.</strong><br><br>
  A containerized AI agent you control through any messaging app.<br>
  Tell it what to post, when to schedule — it executes across 15 platforms, securely in its own sandbox.
</p>

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

> Setup handles everything — Node, pnpm, Docker, container build, and channel pairing. Chatting with your agent in under 5 minutes.

<br>

## 🛡️ Core Features

| | Feature | Description |
|---|---|---|
| 🐳 | **Container Isolation** | Each agent runs in its own Linux container. Commands execute inside the sandbox, never on your host. |
| 💬 | **Multi-Channel** | WhatsApp, Telegram, Discord, Bluesky, Reddit, Threads, Signal, Slack, iMessage, Teams, and more. Add channels with `/add-<channel>`. |
| 🧠 | **Per-Agent Memory** | Every agent has its own workspace, instructions, and persistent memory. Nothing crosses boundaries. |
| ⏰ | **Scheduled Tasks** | Recurring jobs that run your agent on a cron and message you back with results. |
| 🌐 | **Web Access** | Search the web, fetch pages, summarize content — all from within the agent sandbox. |
| 🔐 | **Credential Vault** | API keys never enter the container. Outbound requests route through OneCLI vault which injects auth at request time. |
| 🤖 | **AI-Native** | Something broke? Describe it in chat. The agent diagnoses and fixes itself. |

<br>

## 📱 Connect Via

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

### Installing the Social CLI Skill

```bash
# 1. Get your API key from https://socialcli.xyz/dashboard/api-keys

# 2. Install the skill
gh skill install social-cli/social-cli-skill

# 3. Set your API key
echo 'SOCIAL_CLI_API_KEY=sk_your_key_here' >> .env

# 4. Restart
bash socialclaw.sh
```

### What the Social CLI skill adds

| Capability | Example |
|-----------|---------|
| Cross-platform posting | `@agent post "Hello!" to Twitter and LinkedIn` |
| Scheduling | `@agent schedule "Weekly update" for tomorrow 9am` |
| Analytics | `@agent check my engagement this week` |
| Queue management | `@agent add this to my posting queue` |
| DM replies | `@agent reply to unanswered DMs` |
| Media upload | `@agent post this image to Instagram` |

15 platforms: Twitter/X · Instagram · Facebook · LinkedIn · TikTok · YouTube · Pinterest · Reddit · Telegram · Discord · Bluesky · Snapchat · WhatsApp · Google Business · Threads

### Other Skills

```bash
gh skill install <owner>/<skill-name>
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
"Only allow posting to Twitter and LinkedIn"
"Store conversation summaries weekly"
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

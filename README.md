<p align="center">
  <img src="assets/Logo Icon 3.png" alt="Social Claw" width="72">
</p>

<h1 align="center"><em>Social Claw</em></h1>

<p align="center">
  <img src="assets/splash-preview.png" alt="Social Claw terminal splash" width="700">
</p>

<p align="center">
  <strong>A secure, containerized AI agent that runs on your machine.</strong><br><br>
  Install the Social CLI skill and your agent gains full control over 15 social media platforms —<br>
  post, schedule, analyze, and reply, all from a single conversation.
</p>

<p align="center">
  <a href="https://github.com/social-cli/social-claw"><img src="https://img.shields.io/badge/GitHub-social--claw-181717?logo=github" alt="GitHub"></a>&nbsp;
  <a href="https://socialcli.xyz"><img src="https://img.shields.io/badge/Web-socialcli.xyz-D95F2B" alt="Website"></a>&nbsp;
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT">
</p>

---

## Quick Start

```bash
git clone https://github.com/social-cli/social-claw.git
cd social-claw
bash socialclaw.sh
```

Setup handles everything — Node, pnpm, Docker, container build. Up and running in under 5 minutes.

---

## Core Features

| Feature | Description |
|---------|-------------|
| Container Isolation | Each agent runs in its own Linux container. Commands execute inside the sandbox, never on your host. |
| Per-Agent Memory | Every agent has its own workspace, instructions, and persistent memory. Nothing crosses boundaries. |
| Scheduled Tasks | Recurring jobs that run your agent on a cron and message you back with results. |
| Web Access | Search the web, fetch pages, summarize content — all from within the agent sandbox. |
| Credential Vault | API keys never enter the container. Outbound requests route through OneCLI vault which injects auth at request time. |
| AI-Native Debugging | Something broke? Describe it in chat. The agent diagnoses and fixes itself. No dashboards needed. |

---

## Skills

Skills extend what your agent can do. Social Claw ships with the Social CLI skill — giving your agent full social media automation out of the box.

### Install the Social CLI Skill

```bash
# 1. Get your API key from https://socialcli.xyz/dashboard/api-keys

# 2. Install the skill
gh skill install social-cli/social-cli-skill

# 3. Set your API key
echo 'SOCIAL_CLI_API_KEY=sk_your_key_here' >> .env

# 4. Restart
bash socialclaw.sh
```

### What it adds

| Capability | Example |
|-----------|---------|
| Cross-platform posting | `@agent post "Hello!" to Twitter and LinkedIn` |
| Scheduling | `@agent schedule "Weekly update" for tomorrow 9am` |
| Analytics | `@agent check my engagement this week` |
| Queue management | `@agent add this to my posting queue` |
| DM replies | `@agent reply to unanswered DMs` |
| Media upload | `@agent post this image to Instagram` |

**15 platforms:** Twitter/X · Instagram · Facebook · LinkedIn · TikTok · YouTube · Pinterest · Reddit · Telegram · Discord · Bluesky · Snapchat · WhatsApp · Google Business · Threads

---

## Architecture

```
messaging apps → host process (router) → inbound.db → container (Claude Agent SDK) → outbound.db → host process (delivery) → messaging apps
```

One Node process on the host. Per-session containers. Two SQLite files per session (one writer each). No microservices, no IPC, no complexity.

---

## Customizing

No config files. Just tell your agent what you want:

```
"Change the trigger word to @brand"
"Make responses shorter and more direct"
"Add a daily analytics summary at 9am"
"Only allow posting to Twitter and LinkedIn"
"Store conversation summaries weekly"
```

The codebase is small enough that the agent can safely modify itself.

---

## Requirements

- macOS, Linux, or Windows (via WSL2)
- Node.js 20+ and pnpm 10+
- Docker Desktop or Docker Engine
- Anthropic API key (for Claude)

---

## License

MIT

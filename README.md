<p align="center">
  <strong>Social Claw</strong>
</p>

<p align="center">
  A lightweight AI assistant that runs agents securely in their own containers. Connect via WhatsApp, Telegram, Discord, or CLI. Small enough to understand, secure by isolation, built for the individual user.
</p>

<p align="center">
  <a href="https://github.com/social-cli/social-claw">GitHub</a>&nbsp; • &nbsp;
  <a href="https://socialcli.xyz">socialcli.xyz</a>
</p>

---

## Core Features

- **Container isolation** — Agents run in their own Linux containers with filesystem isolation. Bash access is safe because commands run inside the container, not on your host.
- **Multi-channel messaging** — Telegram, Discord, WhatsApp, Signal, iMessage, Slack, Microsoft Teams, Matrix, Google Chat, email, and more. Choose your channel during setup or add more anytime with `/add-<channel>`.
- **Per-agent workspace** — Each agent has its own memory, instructions, container, and only the mounts you allow. Nothing crosses the boundary.
- **Scheduled tasks** — Recurring jobs that run your agent and can message you back.
- **Web access** — Search and fetch content from the web.
- **Credential security** — Agents never hold raw API keys. Outbound requests route through a vault that injects credentials at request time.
- **AI-native** — When something breaks, describe the problem in chat and the agent handles it. No dashboards or debugging UIs needed.

## Quick Start

```bash
git clone https://github.com/social-cli/social-claw.git
cd social-claw
bash socialclaw.sh
```

The setup walks you from a fresh machine to a named agent you can message. It installs Node, pnpm, and Docker if missing, builds the agent container, and pairs your first channel.

**During setup you'll choose how to connect:**

- Telegram (recommended)
- Discord
- WhatsApp
- Signal
- iMessage (experimental)
- Slack (experimental)
- Microsoft Teams
- Terminal (local CLI)
- Or add any channel later with `/add-<channel>`

## Skills

Social Claw supports installable skills that extend your agent's capabilities. During setup or anytime after, you can inject skills like:

- **Social CLI** — Post, schedule, and manage content across 15 social media platforms (Twitter/X, Instagram, LinkedIn, TikTok, YouTube, Facebook, and more). 35+ MCP tools for social media automation. Get a key at [socialcli.xyz](https://socialcli.xyz).
- **Custom skills** — Build your own or install community skills to give your agent new abilities.

```
@agent post "Just shipped a new feature!" to Twitter and LinkedIn
@agent schedule "Weekly update" for tomorrow 9am on all platforms
@agent check my analytics for this week
```

## Requirements

- macOS or Linux (Windows via WSL2)
- Node.js 20+ and pnpm 10+
- Docker Desktop (macOS/Windows) or Docker Engine (Linux)
- Claude Code (for customization and error recovery)

## Architecture

```
messaging apps → host process (router) → inbound.db → container (Claude Agent SDK) → outbound.db → host process (delivery) → messaging apps
```

A single Node host orchestrates per-session agent containers. Messages arrive, get routed to the right session, and the agent responds through the same channel. Two SQLite files per session, each with exactly one writer.

## Customizing

Tell Claude Code what you want:

- "Change the trigger word to @brand"
- "Make responses shorter and more direct"
- "Add a daily summary at 9am"
- "Store conversation summaries weekly"

The codebase is small enough that the agent can safely modify it.

## License

MIT

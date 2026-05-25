<p align="center">
  <strong>Social Claw</strong>
</p>

<p align="center">
  AI-powered social media assistant that runs agents securely in their own containers. Message your bot on WhatsApp, Telegram, or Discord — it posts, schedules, and manages your social media across 15 platforms.
</p>

<p align="center">
  <a href="https://socialcli.xyz">socialcli.xyz</a>&nbsp; • &nbsp;
  <a href="https://socialcli.gitbook.io/socialcli-docs">docs</a>&nbsp; • &nbsp;
  <a href="https://github.com/social-cli/social-claw">GitHub</a>
</p>

---

## Credits

Social Claw is a fork of [NanoClaw](https://github.com/nanocoai/nanoclaw) by [nanocoai](https://github.com/nanocoai). NanoClaw is licensed under MIT. Full credit to the NanoClaw team for the incredible foundation.

## What is Social Claw?

Social Claw combines [NanoClaw](https://github.com/nanocoai/nanoclaw)'s secure container-based agent architecture with [Social CLI](https://socialcli.xyz)'s 15-platform social media API. The result: a WhatsApp/Telegram/Discord bot that can manage your entire social media presence.

**Message your bot:**
```
@social post "Just shipped a new feature!" to Twitter and LinkedIn
@social schedule "Weekly update" for tomorrow 9am on all platforms
@social check my analytics for this week
@social reply to all unanswered DMs
```

## Quick Start

```bash
git clone https://github.com/social-cli/social-claw.git
cd social-claw
bash socialclaw.sh
```

## Features

- **15 platforms** — Twitter/X, Instagram, Facebook, LinkedIn, TikTok, YouTube, Pinterest, Reddit, Telegram, Discord, Bluesky, Snapchat, WhatsApp, Google Business, Threads
- **Multi-channel** — Control via WhatsApp, Telegram, Discord, Slack, or CLI
- **Container isolation** — Agents run in Docker, never on your host
- **Scheduled tasks** — Recurring posts, analytics reports, DM monitoring
- **MCP-native** — 35+ social media tools via Model Context Protocol
- **Credential security** — API keys never enter the container (OneCLI vault)

## Requirements

- macOS or Linux (Windows via WSL2)
- Node.js 20+ and pnpm 10+
- Docker Desktop (macOS/Windows) or Docker Engine (Linux)
- Claude Code (for customization and error recovery)
- Social CLI API key (get one at [socialcli.xyz](https://socialcli.xyz))

## Architecture

Built on NanoClaw's architecture:

```
messaging apps → host process (router) → inbound.db → container (Claude Agent SDK) → outbound.db → host process (delivery) → messaging apps
```

Social Claw adds the Social CLI MCP server as a default skill, giving every agent access to 35+ social media tools out of the box.

## Customizing

Tell Claude Code what you want:

- "Change the trigger word to @brand"
- "Only allow posting to Twitter and LinkedIn"
- "Add a daily analytics summary at 9am"
- "Make responses match our brand voice"

## License

MIT — Same as NanoClaw.

## Credits

- [NanoClaw](https://github.com/nanocoai/nanoclaw) — The foundation this project is built on
- [Social CLI](https://socialcli.xyz) — The social media infrastructure layer

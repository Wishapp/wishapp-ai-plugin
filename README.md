# WishApp plugin for Claude, ChatGPT and Codex

Manage your [WishApp](https://www.getwish.app) wishlists from an AI assistant. Add wishes from any shop link, share lists, reserve gifts on friends' lists (hidden from the owner by default), keep track of gifts you reserved, gave and received, browse gift ideas and run Secret Santa groups.

The plugin has two parts:

- **The WishApp MCP server** at `https://www.getwish.app/api/mcp`, which you connect with your WishApp account (OAuth sign-in; a free account can be created during connect).
- **The `wishapp` skill**, which tells the assistant how to use those tools: which list to pick, when to ask before a change that emails other people, and what stays private.

## Install

| App | How |
| --- | --- |
| Claude (web, desktop, Cowork) | Install WishApp from the [Claude directory](https://claude.ai/directory), then connect WishApp on the plugin's Connectors tab. |
| Claude Code | `/plugin install wishapp --marketplace Wishapp/wishapp-ai-plugin`, then run `/mcp` and sign in to WishApp. If you already use the WishApp connector in Claude, Claude Code asks you to sign in once more. |
| ChatGPT and Codex | Install WishApp from the ChatGPT plugin directory and connect when prompted. |
| Other MCP clients | See [getwish.app/developers/mcp](https://www.getwish.app/developers/mcp). |

## Data and privacy

The plugin itself stores nothing and runs no code. Everything goes through the WishApp MCP server:

- Your wishlists, wishes, reservations, gifts and Secret Santa groups are read from and saved to `www.getwish.app`, only for the account you connect and only for the scopes you allow (`wishapp:read`, `wishapp:write`).
- Shop links in answers go through WishApp's link redirect at `go.getwish.app` to the shop's own site. Image links in answers point to `cdn.getwish.app`, `www.getwish.app` or the shop's own image host.
- When you add a wish from a link, WishApp's server, with its page-fetching and AI extraction providers, reads the title, image and price from that shop page.
- The tools never show a list's owner who reserved what, and addresses and private Secret Santa links are never available through the tools.

You can disconnect at any time in WishApp under Settings. See the [privacy policy](https://www.getwish.app/privacy) and [terms](https://www.getwish.app/terms).

## Repository layout

| Path | Used by |
| --- | --- |
| `.claude-plugin/plugin.json`, `.mcp.json` | Claude |
| `.claude-plugin/marketplace.json` | Claude Code installs from this repository |
| `plugin.json`, `mcp.json` | ChatGPT and Codex ([Agent Plugins](https://agent-plugins.org) format) |
| `skills/wishapp/` | Both |
| `assets/` | Both |

Both manifests carry the same version. `scripts/build-openai-zip.sh` builds the ChatGPT upload package.

## Support

Questions or problems: [getwish.app/contact](https://www.getwish.app/contact) or open an issue in this repository.

## License

[MIT](LICENSE)

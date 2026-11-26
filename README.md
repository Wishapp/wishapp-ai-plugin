# WishApp AI plugin

The source of the [WishApp](https://www.getwish.app) plugin for Claude, ChatGPT and Codex: manage wishlists, reserve gifts on friends' lists, browse gift ideas and run Secret Santa groups from an AI assistant. What the plugin does, how to install it and what data it uses: [plugin/README.md](plugin/README.md).

| Path | What it is |
| --- | --- |
| `plugin/` | The Claude plugin (`.claude-plugin/plugin.json`, `.mcp.json`) and the `wishapp` skill and logo that both platforms share |
| `openai/` | The ChatGPT and Codex manifest (`plugin.json`, `mcp.json`, [Agent Plugins](https://agent-plugins.org) format) and its composer icon |
| `.claude-plugin/marketplace.json` | Lets Claude Code install the plugin from this repository: `/plugin install wishapp --marketplace Wishapp/wishapp-ai-plugin` |
| `scripts/build-openai-zip.sh` | Builds the ChatGPT upload package from `openai/` plus the shared skill and logo |
| `.github/workflows/check.yml` | Validates both formats on every push and attaches the ChatGPT package to each `v*` release |

Both manifests carry the same name, version and MCP server URL; CI fails if they drift apart. A release raises `version` in `plugin/.claude-plugin/plugin.json` and `openai/plugin.json` together.

## License

[MIT](LICENSE)

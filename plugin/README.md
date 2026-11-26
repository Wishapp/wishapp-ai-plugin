# WishApp

Manage your [WishApp](https://www.getwish.app) wishlists from an AI assistant. Add wishes from any shop link, share lists, reserve gifts on friends' lists (by default the owner can't see what's reserved), keep track of gifts you reserved, gave and received, browse gift ideas and run Secret Santa groups.

The plugin has two parts:

- **The WishApp MCP server** at `https://www.getwish.app/api/mcp`, which you connect with your WishApp account (OAuth sign-in; you can create a free account while connecting).
- **The `wishapp` skill**, which tells the assistant how to use those tools: which list to pick, when to ask before a change that emails other people, and what stays private.

## Use it

After you connect WishApp, ask things like:

- "Add this link to my Christmas wishlist"
- "What's still available on my sister's wishlist?" (paste the getwish.app link)
- "Which gifts have I reserved?"
- "Gift ideas for a 10-year-old who likes science"
- "Start a Secret Santa for my family on December 20 with a 300 kr budget"

The assistant asks before anything that emails other people, such as a Secret Santa draw or reminders.

## Install

| App | How |
| --- | --- |
| Claude (web, desktop, Cowork) | Install WishApp from the [Claude directory](https://claude.ai/directory), then connect WishApp on the plugin's Connectors tab. |
| Claude Code | `/plugin install wishapp --marketplace Wishapp/wishapp-ai-plugin`, then run `/mcp` and sign in to WishApp. Claude Code asks you to sign in separately, even if you already use the WishApp connector in Claude. |
| ChatGPT and Codex | Install WishApp from the ChatGPT plugin directory and connect when prompted. |
| Other MCP clients | See [getwish.app/developers/mcp](https://www.getwish.app/developers/mcp). |

## Data and privacy

The plugin stores nothing and runs nothing when you install or use it: it is one skill and the WishApp connector. Everything you do goes through the WishApp MCP server:

- Your wishlists, wishes, reservations, gifts and Secret Santa groups are read from and saved to `www.getwish.app`, only for the account you connect and the permissions you grant at sign-in (`wishapp:read`, `wishapp:write`, and `profile` and `email` for your name and email address).
- Shop links in answers go through WishApp's link redirect at `go.getwish.app` to the shop's own site. Image links in answers point to `cdn.getwish.app`, `www.getwish.app` or the shop's own image host.
- When you add a wish from a link without a title, image or price, WishApp's server reads them from that shop page, using its page-fetching and AI extraction providers.
- The tools never show a list's owner or collaborators what's reserved on it, or by whom. Addresses and private Secret Santa links are never available through the tools.

You can disconnect at any time in WishApp under Settings. See the [privacy policy](https://www.getwish.app/privacy) and [terms](https://www.getwish.app/terms).

## Support

Questions or problems: [getwish.app/contact](https://www.getwish.app/contact) or open an issue in the [plugin's repository](https://github.com/Wishapp/wishapp-ai-plugin).

## License

[MIT](https://github.com/Wishapp/wishapp-ai-plugin/blob/main/plugin/LICENSE)

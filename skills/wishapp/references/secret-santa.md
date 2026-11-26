# Secret Santa with WishApp

The user can organize a group, or have a spot in someone else's group, or both. `list_exchanges` lists both kinds, upcoming first; `get_exchange` shows one. Organizers see the roster (who joined, who revealed their match, who has a gift ready), the pairs kept apart and whether reminders can be sent. Members see the group details and names. Organizer-only tools refuse anyone else.

## Start a group

1. Collect a title, the date, the people and, if given, a location, notes, a budget and pairs who must not draw each other (couples, for example). Ask only for what's missing and needed.
2. Call `create_exchange`. List everyone except the user in `participants`; the user draws a name too unless you set `organizerJoins: false` (ask when it's unclear whether they take part). A group needs at least three people. An `inviteEmail` only gets reminders to join, never the private link. Nobody is emailed yet.
3. Return the group link and say that names aren't drawn yet.

## Change a group before the draw

- `update_exchange` changes title, date, location, notes or budget; only the fields given change.
- `add_participant` and `remove_participant` change the people. Before the draw nobody is emailed.
- `set_exclusion` keeps two people from drawing each other, in both directions. It only works before the draw.

## Draw names

1. Show the user who's in the group and who hasn't joined yet (from `get_exchange`), then ask them to confirm the draw. Everyone who has joined is emailed and notified; people who haven't joined aren't told, so offer `send_reminders` for them.
2. Call `draw_exchange`. If some people haven't joined, the tool refuses until you call it again with `confirm: true`. The user's confirmation in step 1 covers this, because you showed who hasn't joined.
3. A redraw (`redraw: true`) replaces every match and emails everyone who has joined again. It's only possible while nobody has revealed their match, and it needs `confirm: true`: ask the user first.

## After the draw

- Adding or removing someone re-matches as few people as possible, and those whose match changed are emailed. Once anyone has seen their match, the tool refuses until you call it again with `confirm: true`. Ask the user first, and say who may be emailed.
- `send_reminders` emails people who haven't joined and, after the draw, members without a gift ready. One batch per group a day. Ask first.
- Deleting a group (`delete_exchange`) removes its roster, matches, preferences and addresses. Members aren't notified. After the draw it needs `confirm: true`, because everyone's match is lost for good. Always ask first.

## The user's own spot

- `reveal_my_assignment` shows who the user gives a gift to, with that person's preferences and wishlist. The first reveal in a group means the organizer can no longer redraw all names, so the tool asks for `confirm: true`: ask the user first. Showing an already revealed match again needs no confirmation.
- `update_my_participation` changes the user's own gift preferences (sizes, likes, no-gos), the wishlist attached to their spot and whether their gift is ready.

## Privacy

- Never reveal or guess anyone's match other than the user's own.
- Addresses and private Secret Santa links are never available through the tools. Don't try to find another member's address some other way.

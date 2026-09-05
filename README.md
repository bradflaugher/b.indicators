# b.indicators

Personal Omarchy hover indicators. This is a clone of `omarchy.indicators` with two extras:

- **Screenshot** — left-click takes a screenshot, right-click opens the capture menu
- **Reminder** — opens [Google Tasks](https://tasks.google.com/)

Stock dictation, screen recording, night light, do-not-disturb, and stay-awake indicators are unchanged in behavior besides sitting in this same hover row.

MIT licensed.

## Install on another Omarchy machine

```bash
omarchy plugin add https://github.com/bradflaugher/b.indicators.git --enable
omarchy plugin disable omarchy.indicators
```

If the bar still shows the stock indicators, place this clone next to the clock:

```bash
omarchy bar put b.indicators --section center --before omarchy.clock
```

If this laptop/desktop already has a `b.indicators` clone, skip `plugin add` and pull into the existing folder instead:

```bash
git -C ~/.config/omarchy/plugins/b.indicators pull
```

# brad.indicators

Personal Omarchy hover indicators. This is a clone of `omarchy.indicators` with two extras:

- **Screenshot** — left-click takes a screenshot, right-click opens the capture menu
- **Reminder** — opens [Google Tasks](https://tasks.google.com/)

Stock dictation, screen recording, night light, do-not-disturb, and stay-awake indicators are unchanged in behavior besides sitting in this same hover row.

## Install on another Omarchy machine

```bash
omarchy plugin add https://github.com/bradflaugher/omarchy-indicators.git --enable
omarchy plugin disable omarchy.indicators
```

If the bar still shows the stock indicators, place this clone next to the clock:

```bash
omarchy bar put brad.indicators --section center --before omarchy.clock
```

If this laptop/desktop already has a `brad.indicators` clone, skip `plugin add` and pull into the existing folder instead:

```bash
git -C ~/.config/omarchy/plugins/brad.indicators pull
```

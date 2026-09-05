# b.indicators

Personal Omarchy hover indicators. This is a clone of `omarchy.indicators` with two extras, plus a dictation click that actually records:

- **Screenshot** — left-click takes a screenshot, right-click opens the capture menu
- **Reminder** — opens [Google Tasks](https://tasks.google.com/)
- **Dictation** — click toggles Voxtype, right-click opens Voxtype settings

Screen recording, night light, do-not-disturb, and stay-awake sit in the same hover row.

MIT licensed.

## Install on another Omarchy machine

```bash
omarchy plugin add https://github.com/bradflaugher/b.indicators.git --yes
omarchy plugin enable b.indicators --section center --before omarchy.clock
omarchy plugin disable omarchy.indicators
```

If you already cloned `omarchy.indicators` as something like `brad.indicators`, add `b.indicators` first, then remove the one-off clone. Removing the clone restores stock indicators, so disable those **after**:

```bash
omarchy plugin add https://github.com/bradflaugher/b.indicators.git --yes
omarchy plugin enable b.indicators --section center --before omarchy.clock
omarchy plugin remove brad.indicators --yes
omarchy plugin disable omarchy.indicators
```

If this machine already has `b.indicators`, skip `plugin add` and pull:

```bash
git -C ~/.config/omarchy/plugins/b.indicators pull
```

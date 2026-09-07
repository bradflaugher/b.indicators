# b.indicators

Personal Omarchy hover indicators. This is a clone of `omarchy.indicators` with two extras, plus a dictation click that actually records:

- **Screenshot** — left-click takes a screenshot, right-click opens the capture menu
- **Reminder** — opens [Google Tasks](https://tasks.google.com/)
- **Dictation** — click toggles Voxtype, right-click opens Voxtype settings

Screen recording, night light, do-not-disturb, and stay-awake sit in the same hover row.

## Do not copy stock service lookups

Omarchy only injects live `bar.shell.firstPartyServiceFor(...)` handles into
**first-party** bar widgets. This clone is a third-party `bar-widget`, so those
lookups return `null` and the stock click handlers silently no-op.

Stay awake, night light, and do-not-disturb must use `ToggleCommand` in
`indicators/ToggleCommand.qml`, which calls the public commands
(`omarchy-toggle-idle`, `omarchy-toggle-nightlight`,
`omarchy-toggle-notification-silencing`) via `Quickshell.execDetached` — the
same path Screenshot and Reminder already use.

If you re-clone `omarchy.indicators` or paste stock indicator QML into this
repo, replace any `firstPartyServiceFor` usage with `ToggleCommand` or the
icons will look fine and do nothing on click. `scripts/check.sh` fails the
repo if that lookup comes back.

## Develop from this repo

Edit `~/Work/b.indicators`, then install into the live Omarchy plugin dir
(hot-reload is not enough for Loader-cached indicator QML):

```bash
~/Work/b.indicators/install.sh
```

That copies this tree to `~/.config/omarchy/plugins/b.indicators` and restarts
the shell. Do not treat the live plugin checkout as source of truth.

```bash
./scripts/check.sh   # no firstPartyServiceFor, StayAwake/NightLight/Dnd use ToggleCommand
```

## Updates

Omarchy system updates do not replace this plugin, and they should not break
these three icons. Stay awake, night light, and DND call the public
`omarchy toggle ...` commands rather than stock first-party QML services.

After a `b.indicators` release is on GitHub:

```bash
omarchy plugin update b.indicators --yes
omarchy restart shell
```

`plugin update` only rescans plugins. Restart the shell so Loader-cached
indicator QML actually picks up the new files.

If update says it cannot fast-forward, the live checkout has local edits
(for example from `./install.sh`). Reset it to GitHub, then restart:

```bash
git -C ~/.config/omarchy/plugins/b.indicators fetch origin
git -C ~/.config/omarchy/plugins/b.indicators reset --hard origin/main
omarchy restart shell
```

Do not `omarchy plugin clone omarchy.indicators` again over this install.

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

If this machine already has `b.indicators` installed from git and you only
want to pull GitHub (not `~/Work`):

```bash
git -C ~/.config/omarchy/plugins/b.indicators pull
omarchy restart shell
```

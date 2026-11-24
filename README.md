# termux-smooth-cursor

A smooth, trailing cursor for Termux. One-line install, **no APK, and Termux itself is never modified**.
Remove it and everything goes back to stock.

> **Note:** the trail moves one character cell at a time (not pixel-smooth) and may flicker slightly on some devices.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/kizuyamaki/termux-smooth-cursor/main/install.sh | sh
```

The installer sets up:

- `python` and `curl` (via `pkg`)
- `pyte` (via `pip`)
- the `smoothcursor` command in `$PREFIX/bin`

## Use

Start a shell with the smooth cursor:

```sh
smoothcursor
```

Type `exit` to leave it and go back to the normal shell.

Start it automatically in every new session:

```sh
smoothcursor autostart on
```

Turn automatic start off:

```sh
smoothcursor autostart off
```

## Customize

```sh
smoothcursor set speed 40
```

```sh
smoothcursor set color '#ff88cc'
```

```sh
smoothcursor set enabled false
```

| Key | Value | Meaning |
|---|---|---|
| `speed` | 10-500 | Milliseconds; lower is faster (default 60) |
| `color` | `#rrggbb` | Trail color |
| `enabled` | `true` / `false` | Turn the effect on or off |

Changes apply to new sessions. Settings are stored in `~/.termux/smooth-cursor.conf`.

## Uninstall

```sh
smoothcursor uninstall
```

This removes the program, the config file and the autostart lines. To remove the library too: `pip uninstall pyte`.

## Emergency off

If autostart ever causes trouble, this disables it immediately without editing any other file:

```sh
touch ~/.termux/smooth-cursor.off
```

If a nested shell opened, typing `exit` once returns you to the normal shell. If `pyte` is missing or the program crashes, it falls back to your plain shell instead of locking you out.

## How it works

`smoothcursor` sits between Termux and your shell. It tracks the cursor position and paints a fading trail behind it using ordinary terminal escape codes. Before the shell draws anything new, the trail is erased, so the screen is never corrupted.

## License

MIT

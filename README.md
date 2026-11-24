# termux-smooth-cursor

A smooth, gliding cursor for Termux. One-line install, **no APK, and Termux itself is never modified**.
It starts automatically in every new session. Turn it off or uninstall and everything goes back to stock.

The cursor glides to its new position and leaves a tapered, Neovide-style smear (a diagonal `\` tail when it
moves diagonally). When you press Enter it drops in from above. It is drawn with Unicode block characters
(`▌ ▄ ▚ ▟` ...), so it is sub-cell smooth but not truly pixel-smooth.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/kizuyamaki/termux-smooth-cursor/main/install.sh | sh
```

This installs `python`, `curl`, the `pyte` library (via pip) and the `smoothcursor` command, then turns on
auto-start. Open a new Termux session and the cursor is already smooth.

## Turn it on / off

Auto-start is on by default after install. To switch it off:

```sh
smoothcursor autostart off
```

and back on:

```sh
smoothcursor autostart on
```

Start it by hand in the current session (type `exit` to leave it):

```sh
smoothcursor
```

## Customize

All settings are changed with commands and apply to new sessions.

```sh
smoothcursor set size 60
```

```sh
smoothcursor set width 40
```

```sh
smoothcursor set height 100
```

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
| `size` | 1-100 | Cursor size in percent of one character cell, sets width and height together (default 100) |
| `width` | 1-100 | Cursor width only |
| `height` | 1-100 | Cursor height only |
| `speed` | 10-500 | Milliseconds; lower is faster (default 60) |
| `color` | `#rrggbb` | Cursor color (default white `#ffffff`) |
| `enabled` | `true` / `false` | Turn the effect on or off |

Notes: the glyph grid is 8x8 per cell, so anything below about 14 looks the same as 14. With a size below 100 the
character under the cursor is hidden by the cursor. Programs that ask for an underline or bar cursor (for example
Neovim in insert mode) are honored, using the same proportions as Termux (a quarter of the cell).

Settings live in `~/.termux/smooth-cursor.conf`.

## Uninstall

```sh
smoothcursor uninstall
```

This removes the program, the config file and the auto-start lines. To remove the library too: `pip uninstall pyte`.

## Emergency off

If auto-start ever causes trouble, this disables it immediately:

```sh
touch ~/.termux/smooth-cursor.off
```

If a nested shell opened, typing `exit` once returns you to the normal shell. If `pyte` is missing or the program
crashes, it falls back to your plain shell instead of locking you out.

## How it works

`smoothcursor` sits between Termux and your shell. It hides Termux's own cursor and draws its own, so the cursor you
see always matches the smear. It keeps a model of the screen and follows the real cursor the way Termux does (including
the pending-wrap state in the last column and double-width characters). The four corners of the cursor shape are animated
at different speeds (leading corners fast, trailing corners slow) and painted with block characters. Before the shell
draws anything new, the overlay is erased and redrawn in the same write, so the screen is never corrupted and the cursor
does not flicker. When the window is resized (for example when the keyboard opens), it asks Termux where the cursor
really is and re-syncs.

When it starts it pushes the current screen into scrollback (like `clear`) so its model and the real screen begin identical.

## Reporting bugs

Found a bug? Please open an issue at https://github.com/kizuyamaki/termux-smooth-cursor/issues and include:

- your Termux version and Android version
- the shell you use (bash, fish, zsh) and, if relevant, the program where it happened (for example nvim)
- what you typed and what you expected to see
- a screenshot if the screen looks wrong

To switch it off right away while a bug is investigated: `touch ~/.termux/smooth-cursor.off`

## License

MIT

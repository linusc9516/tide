# Catppuccin for Tide

An unofficial [Catppuccin](https://catppuccin.com) theme for the
[Tide](https://github.com/IlanCosman/tide) prompt for fish, in all four flavors
(Latte, Frappé, Macchiato, Mocha) with a selectable accent colour.

It only sets Tide's colours. Your prompt layout, items and icons from
`tide configure` are left as they are. It is designed for the "Classic" and
"Rainbow" styles, where items have a coloured background.

## Requirements

- [fish](https://fishshell.com) 3.4 or newer
- [Tide](https://github.com/IlanCosman/tide) v6
- A terminal with true colour support

## Installation

With [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install linusc9516/catppuccin-tide
```

Or copy `functions/catppuccin_tide.fish` and `completions/catppuccin_tide.fish`
into the matching directories under `~/.config/fish/`.

## Usage

```fish
catppuccin_tide [-g | --global] FLAVOR [ACCENT]
```

- `FLAVOR`: `latte`, `frappe`, `macchiato` or `mocha`
- `ACCENT`: any Catppuccin accent, e.g. `mauve` (the default), `blue`, `peach`

There are two ways to apply it:

**Once, saved permanently.** This writes universal variables, the same way
`tide configure` does. Run it a single time:

```fish
catppuccin_tide mocha
```

**On every shell start.** If your fish config lives in a dotfiles repository
and you do not track `fish_variables`, call it from `config.fish` with `-g`.
This sets exported global variables for the session only:

```fish
catppuccin_tide -g mocha
```

Global variables take precedence over universal ones, so do not combine `-g`
with another Tide theme that is applied the same way.

## Colours

Text on a segment uses the flavor's `base` colour.

| Item | Colour |
| --- | --- |
| `os`, `time` | accent |
| `pwd` | blue |
| `git` | green; yellow with uncommitted changes; red with conflicts |
| `character` | green; red after a failed command |
| `status` | green; red on failure |
| `cmd_duration`, `direnv` | yellow |
| `context` | flamingo |
| `jobs`, `shlvl` | peach |
| `private_mode` | pink |
| `nix_shell` | sky |
| languages (`node`, `python`, `rustc`, `go`, ...) | sapphire |
| cloud and infrastructure (`aws`, `docker`, `kubectl`, ...) | sky |
| containers (`distrobox`, `toolbox`) | teal |
| `vi_mode` | blue (normal), green (insert), red (replace), mauve (visual) |

## Uninstalling

```fish
fisher remove linusc9516/catppuccin-tide
```

The colour variables stay set. Run `tide configure` to pick new colours.

## Licence

[MIT](LICENSE). Palette by [Catppuccin](https://github.com/catppuccin/catppuccin).

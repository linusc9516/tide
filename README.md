<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Catppuccin for <a href="https://github.com/IlanCosman/tide">Tide</a>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
	<a href="https://github.com/linusc9516/tide/stargazers"><img src="https://img.shields.io/github/stars/linusc9516/tide?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
	<a href="https://github.com/linusc9516/tide/issues"><img src="https://img.shields.io/github/issues/linusc9516/tide?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
	<a href="https://github.com/linusc9516/tide/contributors"><img src="https://img.shields.io/github/contributors/linusc9516/tide?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

An unofficial [Catppuccin](https://catppuccin.com) theme for the
[Tide](https://github.com/IlanCosman/tide) prompt, in all four flavors with a
selectable accent colour.

## Usage

Requires [fish](https://fishshell.com) 3.4 or newer, [Tide](https://github.com/IlanCosman/tide) v6
and a terminal with true colour support.

1. Install the theme with [Fisher](https://github.com/jorgebucaran/fisher):

   ```fish
   fisher install linusc9516/tide
   ```

   Or copy `functions/catppuccin_tide.fish` and `completions/catppuccin_tide.fish`
   into the matching directories under `~/.config/fish/`.

2. Apply a flavor, optionally with an accent (the default is `mauve`):

   ```fish
   catppuccin_tide mocha
   catppuccin_tide latte peach
   ```

   This saves the colours as universal variables, the same way `tide configure`
   does, so it only has to be run once.

Only Tide's colours are changed. Your prompt layout, items and icons from
`tide configure` are left as they are. The theme is designed for the "Classic"
and "Rainbow" styles, where items have a coloured background.

### Colours

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

## 🙋 FAQ

- Q: **_"How can I keep the theme in my dotfiles instead of in universal variables?"_**\
  A: Call it from `config.fish` with `-g`. This sets exported global variables
  for the session only, so nothing is written to `fish_variables`:

  ```fish
  catppuccin_tide -g mocha
  ```

  Global variables take precedence over universal ones, so do not combine `-g`
  with another Tide theme that is applied the same way.

- Q: **_"How do I go back to my old colours?"_**\
  A: Run `fisher remove linusc9516/tide`, then `tide configure` to pick new
  colours. The variables set by this theme are not erased on removal.

## 💝 Thanks to

- [Linus C.](https://github.com/linusc9516)

&nbsp;

<p align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" />
</p>

<p align="center">
	Copyright &copy; 2026 <a href="https://github.com/linusc9516" target="_blank">Linus C.</a>
	Palette by <a href="https://github.com/catppuccin/catppuccin" target="_blank">Catppuccin</a>.
</p>

<p align="center">
	<a href="LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>

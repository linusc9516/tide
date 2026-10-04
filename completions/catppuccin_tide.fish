set -l flavors latte frappe macchiato mocha
set -l accents rosewater flamingo pink mauve red maroon peach yellow green teal sky sapphire blue lavender

complete -c catppuccin_tide -f
complete -c catppuccin_tide -s g -l global -d 'Only apply to the current session'
complete -c catppuccin_tide -s h -l help -d 'Show help'
complete -c catppuccin_tide -n "not __fish_seen_subcommand_from $flavors" -a "$flavors" -d Flavor
complete -c catppuccin_tide -n "__fish_seen_subcommand_from $flavors; and not __fish_seen_subcommand_from $accents" -a "$accents" -d Accent

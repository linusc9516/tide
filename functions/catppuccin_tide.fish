# Catppuccin for Tide
# https://github.com/IlanCosman/tide

function catppuccin_tide --description 'Apply a Catppuccin flavor to the Tide prompt'
    set -l flavors latte frappe macchiato mocha
    set -l accents rosewater flamingo pink mauve red maroon peach yellow green teal sky sapphire blue lavender

    argparse h/help g/global -- $argv
    or return 1

    if set -q _flag_help
        echo 'Usage: catppuccin_tide [-g | --global] FLAVOR [ACCENT]'
        echo
        echo "  FLAVOR  one of: $flavors"
        echo "  ACCENT  one of: $accents (default: mauve)"
        echo
        echo 'Options:'
        echo '  -g, --global  only apply to the current session (exported global'
        echo '                variables) instead of saving universal variables.'
        echo '                Use this when calling from config.fish.'
        echo '  -h, --help    show this help'
        return 0
    end

    if test (count $argv) -eq 0
        echo 'Usage: catppuccin_tide [-g | --global] FLAVOR [ACCENT]' >&2
        return 1
    end

    set -l flavor $argv[1]
    set -l accent_name $argv[2]
    test -n "$accent_name"; or set accent_name mauve

    if not contains -- "$flavor" $flavors
        echo "catppuccin_tide: unknown flavor '$flavor' (use one of: $flavors)" >&2
        return 1
    end
    if not contains -- $accent_name $accents
        echo "catppuccin_tide: unknown accent '$accent_name' (use one of: $accents)" >&2
        return 1
    end

    # https://catppuccin.com/palette
    set -l names rosewater flamingo pink mauve red maroon peach yellow green teal sky sapphire blue lavender \
        text subtext1 subtext0 overlay2 overlay1 overlay0 surface2 surface1 surface0 base mantle crust
    set -l palette
    switch $flavor
        case latte
            set palette dc8a78 dd7878 ea76cb 8839ef d20f39 e64553 fe640b df8e1d 40a02b 179299 04a5e5 209fb5 1e66f5 7287fd \
                4c4f69 5c5f77 6c6f85 7c7f93 8c8fa1 9ca0b0 acb0be bcc0cc ccd0da eff1f5 e6e9ef dce0e8
        case frappe
            set palette f2d5cf eebebe f4b8e4 ca9ee6 e78284 ea999c ef9f76 e5c890 a6d189 81c8be 99d1db 85c1dc 8caaee babbf1 \
                c6d0f5 b5bfe2 a5adce 949cbb 838ba7 737994 626880 51576d 414559 303446 292c3c 232634
        case macchiato
            set palette f4dbd6 f0c6c6 f5bde6 c6a0f6 ed8796 ee99a0 f5a97f eed49f a6da95 8bd5ca 91d7e3 7dc4e4 8aadf4 b7bdf8 \
                cad3f5 b8c0e0 a5adcb 939ab7 8087a2 6e738d 5b6078 494d64 363a4f 24273a 1e2030 181926
        case mocha
            set palette f5e0dc f2cdcd f5c2e7 cba6f7 f38ba8 eba0ac fab387 f9e2af a6e3a1 94e2d5 89dceb 74c7ec 89b4fa b4befe \
                cdd6f4 bac2de a6adc8 9399b2 7f849c 6c7086 585b70 45475a 313244 1e1e2e 181825 11111b
    end
    for i in (seq (count $names))
        set -f $names[$i] $palette[$i]
    end

    set -l accent $$accent_name
    # Text drawn on top of a coloured segment
    set -l on $base

    # variable, value pairs
    set -l theme \
        tide_os_bg_color $accent \
        tide_os_color $on \
        tide_pwd_bg_color $blue \
        tide_pwd_color_anchors $on \
        tide_pwd_color_dirs $on \
        tide_pwd_color_truncated_dirs $on \
        tide_git_bg_color $green \
        tide_git_bg_color_unstable $yellow \
        tide_git_bg_color_urgent $red \
        tide_git_color_branch $on \
        tide_git_color_conflicted $on \
        tide_git_color_dirty $on \
        tide_git_color_operation $on \
        tide_git_color_staged $on \
        tide_git_color_stash $on \
        tide_git_color_untracked $on \
        tide_git_color_upstream $on \
        tide_character_color $green \
        tide_character_color_failure $red \
        tide_status_bg_color $green \
        tide_status_bg_color_failure $red \
        tide_status_color $on \
        tide_status_color_failure $on \
        tide_cmd_duration_bg_color $yellow \
        tide_cmd_duration_color $on \
        tide_time_bg_color $accent \
        tide_time_color $on \
        tide_context_bg_color $flamingo \
        tide_context_color_default $on \
        tide_context_color_root $on \
        tide_context_color_ssh $on \
        tide_jobs_bg_color $peach \
        tide_jobs_color $on \
        tide_direnv_bg_color $yellow \
        tide_direnv_bg_color_denied $red \
        tide_direnv_color $on \
        tide_direnv_color_denied $on \
        tide_nix_shell_bg_color $sky \
        tide_nix_shell_color $on \
        tide_shlvl_bg_color $peach \
        tide_shlvl_color $on \
        tide_private_mode_bg_color $pink \
        tide_private_mode_color $on \
        tide_vi_mode_bg_color_default $blue \
        tide_vi_mode_color_default $on \
        tide_vi_mode_bg_color_insert $green \
        tide_vi_mode_color_insert $on \
        tide_vi_mode_bg_color_replace $red \
        tide_vi_mode_color_replace $on \
        tide_vi_mode_bg_color_visual $mauve \
        tide_vi_mode_color_visual $on \
        tide_prompt_color_frame_and_connection $overlay0 \
        tide_prompt_color_separator_same_color $surface2

    # Language and runtime versions
    for item in bun crystal elixir go java node php python ruby rustc zig
        set -a theme tide_{$item}_bg_color $sapphire tide_{$item}_color $on
    end
    # Cloud and infrastructure
    for item in aws docker gcloud kubectl pulumi terraform
        set -a theme tide_{$item}_bg_color $sky tide_{$item}_color $on
    end
    # Containers
    for item in distrobox toolbox
        set -a theme tide_{$item}_bg_color $teal tide_{$item}_color $on
    end

    for i in (seq 1 2 (count $theme))
        set -l name $theme[$i]
        set -l value $theme[(math $i + 1)]
        if set -q _flag_global
            # Exported, because Tide renders the prompt in a background process
            set -gx $name $value
        else
            # A global of the same name would shadow the universal variable
            set -eg $name
            set -U $name $value
        end
    end

    # Tide bakes some colours into its prompt when it is first loaded, most
    # visibly the background behind the directory. Rebuild those so that
    # applying a flavor takes effect without starting a new shell.
    if functions -q _tide_pwd
        functions -q _tide_cache_variables; and _tide_cache_variables
        for dir in $fish_function_path
            if test -f $dir/_tide_pwd.fish
                source $dir/_tide_pwd.fish
                break
            end
        end
    end
    return 0
end

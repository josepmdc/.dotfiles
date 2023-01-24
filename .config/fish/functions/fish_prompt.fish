# Options
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstashstate 1

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)
set cyan (set_color cyan)

set -g __fish_git_prompt_color_branch yellow
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_cleanstate green
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_merging yellow
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_upstream_ahead green
set -g __fish_git_prompt_color_upstream_behind magenta
set -g __fish_git_prompt_color_stashstate green

# Icons
set -g __fish_git_prompt_char_cleanstate ''
set -g __fish_git_prompt_char_invalidstate '  ✖ '
set -g __fish_git_prompt_char_dirtystate '  ● '
set -g __fish_git_prompt_char_stagedstate '  → '
set -g __fish_git_prompt_char_stateseparator ''
set -g __fish_git_prompt_char_untrackedfiles '  ● '
set -g __fish_git_prompt_char_upstream_ahead '  ⇡ '
set -g __fish_git_prompt_char_upstream_behind '  ⇣ '
set -g __fish_git_prompt_char_upstream_diverged '  ⇡⇣ '
set -g __fish_git_prompt_char_stashstate '  𝌆 '

set -U fish_prompt_pwd_dir_length 0

# Don't display venv so we can display it later at a custom location
set -xg VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_prompt
    echo

    set_color magenta
    printf '» %s ' (set_color white & prompt_pwd)

    # python virtual environment
    if set -q VIRTUAL_ENV
        set_color -o blue
        printf '(%s)' (basename "$VIRTUAL_ENV")
    end

    set_color normal
    printf '%s \n' (set_color magenta & __fish_git_prompt "  %s")

    echo -n (set_color green)'λ '
    set_color normal
    echo
end

function fish_right_prompt
    # vi mode prompt
    fish_default_mode_prompt
end

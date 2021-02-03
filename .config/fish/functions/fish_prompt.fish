# Options
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)
set cyan (set_color cyan)

set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind magenta

# Icons
set __fish_git_prompt_char_cleanstate '   '
set __fish_git_prompt_char_conflictedstate '  ✖ '
set __fish_git_prompt_char_dirtystate '   '
set __fish_git_prompt_char_invalidstate ''
set __fish_git_prompt_char_stagedstate '  → '
set __fish_git_prompt_char_stateseparator ''
set __fish_git_prompt_char_untrackedfiles '  ● '
set __fish_git_prompt_char_upstream_ahead '  ⇡ '
set __fish_git_prompt_char_upstream_behind '  ⇣ '
set __fish_git_prompt_char_upstream_diverged '  ⇡⇣ '

set -U fish_prompt_pwd_dir_length 0

function fish_prompt
    echo
    set last_status $status

    set_color white
    printf '%s' (prompt_pwd)

    set_color normal
    printf '%s \n' (__fish_git_prompt "  %s")

    set_color green
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
    echo
end

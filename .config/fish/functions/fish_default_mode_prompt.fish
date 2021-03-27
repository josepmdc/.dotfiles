function fish_default_mode_prompt
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = fish_vi_key_bindings
        or test "$fish_key_bindings" = fish_hybrid_key_bindings
        switch $fish_bind_mode
            case default
                set_color magenta
                printf 'NORMAL'
            case insert
                set_color yellow
                printf 'INSERT'
            case replace_one
                set_color brgreen
                printf 'REPLACE-1'
            case replace
                set_color cyan
                printf 'REPLACE'
            case visual
                set_color green
                printf 'VISUAL'
        end
        set_color normal
        echo -n ' '
    end
end

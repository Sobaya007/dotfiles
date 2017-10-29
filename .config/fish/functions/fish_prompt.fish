function fish_prompt
	and set retc green
    or set retc red
    tty | string match -q -r tty
    and set tty tty
    or set tty pts

    echo
    set_color 00FFFF
    echo -n [
    echo -n (pwd|sed "s=$HOME=~=")
    echo -n ']'

    echo
    set_color 00FF40
    echo -n [
    set last_status $status
    printf '⭠%s' (__fish_git_prompt)
    echo -n ']'

    echo
    set_color FFFF00
    echo -n '$'
    set_color normal
end

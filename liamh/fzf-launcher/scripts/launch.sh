mapfile -t GUI_APPS < ~/.config/fzf-launcher/gui-programs.txt

is_gui_app() {
    local cmd=$1

    for g in "${GUI_APPS[@]}"; do
        [[ $cmd == "$g" ]] && return 0
    done

    return 1
}

selected=$(compgen -c | fzf)

if [ -n "$selected" ]; then
    if is_gui_app "$selected"; then
        nohup "$selected"
    else
        setsid kitty -e "$selected" & sleep 1
    fi
fi
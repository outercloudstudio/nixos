mapfile -t GUI_APPS < ~/.config/fzf-gui-apps

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
        "$selected" & disown
    else
        exec "$selected"
    fi
fi
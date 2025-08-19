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
        "$selected" & disown
    else
        kitty "$selected"
    fi
fi
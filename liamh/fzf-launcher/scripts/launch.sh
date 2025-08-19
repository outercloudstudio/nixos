mapfile -t GUI_APPS < ~/.config/fzf-launcher/gui-programs.txt
mapfile -t ACTIONS < ~/.config/fzf-launcher/actions.txt

is_gui_app() {
    local cmd=$1

    for g in "${GUI_APPS[@]}"; do
        [[ $cmd == "$g" ]] && return 0
    done

    return 1
}

is_action() {
    local cmd=$1

    for g in "${ACTIONS[@]}"; do
        [[ $cmd == "$g" ]] && return 0
    done

    return 1
}

selected=$((cat ~/.config/fzf-launcher/gui-programs.txt; echo ""; cat ~/.config/fzf-launcher/tui-programs.txt; echo ""; cat ~/.config/fzf-launcher/actions.txt) | fzf)

if [ -n "$selected" ]; then
    if is_gui_app "$selected"; then
        nohup "$selected" & sleep 0.0001
    else
        if is_action "$selected"; then
            nohup kitty -e bash -i -c "$selected && read -p 'Press enter to exit'" & sleep 0.0001
        else
            nohup kitty -e bash -i -c "$selected" & sleep 0.0001
        fi
    fi
fi
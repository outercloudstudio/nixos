mapfile -t GUI_APPS < ~/.config/fzf-launcher/gui-programs.txt
mapfile -t SCRIPTS < ~/.config/fzf-launcher/scripts.txt

is_gui_app() {
    local cmd=$1

    for g in "${GUI_APPS[@]}"; do
        [[ $cmd == "$g" ]] && return 0
    done

    return 1
}

is_script() {
    local cmd=$1

    for g in "${SCRIPTS[@]}"; do
        [[ $cmd == "$g" ]] && return 0
    done

    return 1
}

selected=$((cat ~/.config/fzf-launcher/gui-programs.txt; echo ""; cat ~/.config/fzf-launcher/tui-programs.txt; echo ""; cat ~/.config/fzf-launcher/scripts.txt) | fzf)

if [ -n "$selected" ]; then
    if is_gui_app "$selected"; then
        nohup "$selected" & sleep 0.0001
    else
        if is_script "$selected"; then
            nohup kitty -e bash -i -c "$selected" & sleep 0.0001
        else
            nohup kitty -e "$selected" & sleep 0.0001
        fi
    fi
fi
mapfile -t GUI_APPS < ~/.config/fzf-launcher/gui-programs.txt

is_gui_app() {
    local cmd=$1

    for g in "${GUI_APPS[@]}"; do
        [[ $cmd == "$g" ]] && return 0
    done

    return 1
}

selected=$(cat ~/.config/fzf-launcher/gui-programs.txt ~/.config/fzf-launcher/tui-programs.txt | fzf)

if [ -n "$selected" ]; then
    if is_gui_app "$selected"; then
        nohup "$selected" & sleep 0.0001
    else
        nohup kitty -e "$selected" & sleep 0.0001
    fi
fi
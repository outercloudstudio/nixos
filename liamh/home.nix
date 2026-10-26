{ config, pkgs, ... }:

{
  home.username = "liamh";
  home.homeDirectory = "/home/liamh";

  imports = [
    # ./niri
    # ./quickshell-niri
    
    ./hypr
    ./hyprcursor
    ./hyprpaper
    ./quickshell

    ./alacritty
    # ./kitty

    ./fzf-launcher
    ./scripts
    ./git
    ./bash
    ./helix
    ./discord
    ./nix-direnv
    ./krita
    ./firefox
    ./obsidian
    ./nnn

    ./vscode
    # ./zed
  ];

  home.packages = with pkgs; [
    chromium
    rnote
    fastfetch
    hyprshot
    blender
    unzip
    superfile
    brightnessctl
    lf
    libnotify
    fzf
    btop
    cava
    pavucontrol
    wl-clipboard
    audacity
    lazygit
    speedcrunch
    tio
  ];

  home.stateVersion = "25.05";
}

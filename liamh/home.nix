{ config, pkgs, ... }:

{
  home.username = "liamh";
  home.homeDirectory = "/home/liamh";

  imports = [
    ./hypr
    ./hyprcursor
    ./hyprpaper
    ./kitty
    ./fzf-launcher
    ./scripts
    ./git
    ./bash
    ./helix
    ./discord
    ./quickshell
    ./nix-direnv
    ./krita
    
    ./vscode
    # ./zed
  ];

  home.packages = with pkgs; [
    chromium
    rnote
    brightnessctl
    fastfetch
    hyprshot
    blender
    unzip
  ];

  home.stateVersion = "25.05";
}

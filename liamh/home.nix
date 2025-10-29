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
    # ./krita
    # ./zed
  ];

  home.packages = with pkgs; [
    chromium
    rnote
    brightnessctl
    fastfetch
  ];

  home.stateVersion = "25.05";
}

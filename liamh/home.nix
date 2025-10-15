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
    # ./krita
    ./nix-direnv
  ];

  home.packages = with pkgs; [
    chromium
    rnote
    brightnessctl
  ];

  home.stateVersion = "25.05";
}

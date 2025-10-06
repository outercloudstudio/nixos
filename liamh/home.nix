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
  ];

  home.packages = with pkgs; [];

  home.stateVersion = "25.05";
}

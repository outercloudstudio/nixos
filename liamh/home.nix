{ config, pkgs, ... }:

{
  home.username = "liamh";
  home.homeDirectory = "/home/liamh";

  imports = [
    ./hypr
    ./kitty
    ./hyprcursor
    ./fzf-launcher
    ./scripts
    ./hyprpaper
    ./git
    ./bash
    ./helix
  ];

  home.packages = with pkgs; [];

  home.stateVersion = "25.05";
}

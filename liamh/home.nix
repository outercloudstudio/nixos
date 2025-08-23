{ config, pkgs, ... }:

{
  home.username = "liamh";
  home.homeDirectory = "/home/liamh";

  imports = [
    ./hypr
    ./waybar
    ./kitty
    ./hyprcursor
    ./fzf-launcher
    ./scripts
    ./hyprpaper
    ./git
    ./bash
  ];

  home.packages = with pkgs; [];

  programs.helix = {
    enable = true;
    
    settings = {
      theme = "everforest_dark_transparent";
    };

    themes = {
      everforest_dark_transparent = {
        "inherits" = "everforest_dark";
        "ui.background" = { };
        "ui.statusline" = { };
        "ui.popup" = { };
        "ui.popup.info" = { };
        "ui.menu" = { };
        "ui.prompt" = { };
      };
    };
  };

  home.stateVersion = "25.05";
}

{ config, pkgs, ... }:

{
    home.packages = [ pkgs.hyprpaper ];

    home.file.".config/hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/liamh/hyprpaper/hyprpaper.conf";

    home.file."backgrounds" = {
      source = ../backgrounds;
      recursive = true;
    };
}
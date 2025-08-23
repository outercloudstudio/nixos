{ config, pkgs, ... }:

{
    services.hyprpaper = {
        enable = true;
        
        settings = {
            preload = [ "~/backgrounds/outer-wilds.jpg" ];
        };

        wallpaper = [ "eDP-2,~/backgrounds/outer-wilds.jpg" ];
    };
}
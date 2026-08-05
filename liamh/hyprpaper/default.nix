{ config, pkgs, ... }:

{
    services.hyprpaper = {
        enable = true;
        
        settings = {
            preload = [ "~/backgrounds/outer-wilds-2.jpg" ];
        
            wallpaper = [ "eDP-2,~/backgrounds/outer-wilds-2.jpg" "eDP-1,~/backgrounds/outer-wilds-2.jpg" ];
        };
    };

    home.file."backgrounds" = {
		source = ./backgrounds;
		recursive = true;
	};
}
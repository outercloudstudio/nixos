{ config, pkgs, ... }:

{
    services.hyprpaper = {
        enable = true;
        
        settings = {
            preload = [ "~/backgrounds/black.jpg" ];
        
            wallpaper = [ "eDP-2,~/backgrounds/black.jpg" "eDP-1,~/backgrounds/black.jpg" ];
        };
    };

    home.file."backgrounds" = {
		source = ./backgrounds;
		recursive = true;
	};
}
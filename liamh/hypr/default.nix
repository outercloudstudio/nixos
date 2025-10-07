{ config, pkgs, ... }:

{
    home.file.".config/hypr" = {
		source = ./config;
		recursive = true;
	};

	wayland.windowManager.hyprland = {
        enable = true;
        
		plugins = [
			# pkgs.hyprlandPlugins.hyprscrolling
		];

		settings = {
            source = "~/.config/hypr/user.conf";
        };
	};

 	home.sessionVariables.NIXOS_OZONE_WL = "1";
}
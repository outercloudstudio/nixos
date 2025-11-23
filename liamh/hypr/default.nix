{ config, pkgs, ... }:

{
	home.file.".config/hypr/user.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/liamh/hypr/config/user.conf";

	wayland.windowManager.hyprland = {
        enable = true;
        
		plugins = [
			pkgs.hyprlandPlugins.hyprscrolling
		];

		settings = {
			source = "~/.config/hypr/user.conf";
		};
	};

 	home.sessionVariables.NIXOS_OZONE_WL = "1";
}
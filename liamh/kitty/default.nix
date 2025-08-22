{ config, pkgs, ... }:

{
	programs.kitty = {
		enable = true;

		font = {
			name = "Fira Code";
		};

		themeFile = "everforest_dark_hard";

		settings = {
			confirm_os_window_close = 0;
		};
 	};

	home.file.".config/kitty" = {
		source = ./config;
		recursive = true;
	};
}
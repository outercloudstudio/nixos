{ config, pkgs, ... }:

{
	programs.kitty = {
		enable = true;

		font = {
			name = "Fira Code";
		};

		themeFile = "everforest-dark-hard";

		settings = {
			confirm_os_window_close = 0;
		};
 	};

	home.file.".config/kitty" = {
		source = ./config;
		recursive = true;
	};
}
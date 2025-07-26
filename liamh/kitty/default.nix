{ config, pkgs, ... }:

{
    home.file.".config/kitty" = {
		source = ./config;
		recursive = true;
	};

	programs.kitty = {
		enable = true;

		font = {
			name = "Fira Code";
		};

		themeFile = "gruvbox_dark";
  };
}
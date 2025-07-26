{ config, pkgs, ... }:

{
    home.file.".config/waybar" = {
		source = ./config;
		recursive = true;
	};
}
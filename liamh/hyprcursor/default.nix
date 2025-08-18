{ config, pkgs, ... }:

{
    home.file.".local/share/icons" = {
		source = ./config;
		recursive = true;
	};
}
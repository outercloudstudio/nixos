{ config, pkgs, ... }:

{
    home.file.".config/hypr" = {
		source = ./config;
		recursive = true;
	};
}
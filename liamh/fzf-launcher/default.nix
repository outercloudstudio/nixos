{ config, pkgs, ... }:

{
    home.file.".config/fzf-launcher" = {
		source = ./config;
		recursive = true;
	};

	home.file."bin/fzf-launcher" = {
		source = ./scripts;
		recursive = true;
	};
}
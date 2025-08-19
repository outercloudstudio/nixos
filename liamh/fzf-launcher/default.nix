{ config, pkgs, ... }:

{
    home.file.".config/fzf-launcher" = {
		source = ./config;
		recursive = true;
	};

	home.file."fzf-launcher" = {
		source = ./scripts;
		recursive = true;
	};
}
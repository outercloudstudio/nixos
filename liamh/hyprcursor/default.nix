{ config, pkgs, ... }:

{
    home.file.".local/share/icons/rose-pine-hyprcursor" = {
		source = ./config;
		recursive = true;
	};
}
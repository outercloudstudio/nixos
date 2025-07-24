{ config, pkgs, ... }:

{
    home.file."backgrounds" = {
		source = ./backgrounds;
		recursive = true;
	};
}
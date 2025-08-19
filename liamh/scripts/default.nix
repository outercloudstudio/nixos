{ config, pkgs, ... }:

{
	home.file."bin/" = {
		source = ./scripts;
		recursive = true;
		mode = "0755";
	};
}
{ config, pkgs, ... }:

{
	home.file."bin/" = {
		source = ./scripts;
		recursive = true;
		executable = true;
	};
}
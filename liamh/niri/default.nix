{ config, pkgs, ... }:

{
	home.file.".config/niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/liamh/niri/config.kdl";

	# wayland.windowManager.niri = {
  #   enable = true;
	# };

  home.packages = with pkgs; [
    swaybg
  ];

  home.file."backgrounds" = {
		source = ../backgrounds;
		recursive = true;
	};

 	home.sessionVariables.NIXOS_OZONE_WL = "1";
}
{ config, pkgs, ... }:

{
	home.file.".config/alacritty.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/liamh/alacritty/config.toml";

	home.packages = with pkgs; [
    alacritty
  ];
}
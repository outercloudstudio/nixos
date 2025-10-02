{ config, pkgs-unstable, ... }:

{
    # home.file.".config/quickshell" = {
        # source = ./config;
        # recursive = true;
    # };

    home.file.".config/quickshell".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/liamh/quickshell/config";

    home.packages = with pkgs-unstable; [
        quickshell
    ];
}

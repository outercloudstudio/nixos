{ config, pkgs-unstable, ... }:

{
    home.file.".config/quickshell" = {
        source = ./config;
        recursive = true;
    };

    home.packages = with pkgs-unstable; [
        quickshell
    ];
}

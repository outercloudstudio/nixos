{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        nnn
    ];
}

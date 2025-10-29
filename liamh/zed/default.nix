{ config, pkgs, ... } : {
    programs.zed-editor = {
        enable = true;
        extensions = [ "nix" "toml" "rust" "color-highlight" ];
        userSettings = {
            theme = {
                mode = "dark";
                dark = "Carbonfox - opaque";
                light = "One Light";
            };
        };
    };
}
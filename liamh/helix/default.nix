{ config, pkgs, ... }:

{
    programs.helix = {
        enable = true;
        
        settings = {
          theme = "everforest_dark_transparent";
        };

        themes = {
          everforest_dark_transparent = {
            "inherits" = "everforest_dark";
            "ui.background" = { };
            "ui.statusline" = { };
            "ui.popup" = { };
            "ui.popup.info" = { };
            "ui.menu" = { };
            "ui.prompt" = { };
          };
        };
    };
}
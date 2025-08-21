{ config, pkgs, ... }:

{
  home.username = "liamh";
  home.homeDirectory = "/home/liamh";

  imports = [
    ./hypr
    ./backgrounds
    ./waybar
    ./kitty
    ./hyprcursor
    ./fzf-launcher
    ./scripts
  ];

  home.packages = with pkgs; [];

  programs.git = {
    enable = true;
    userName = "outercloudstudio";
    userEmail = "outercloudstudio@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export EDITOR='nano'
      export PATH="$HOME/bin:$PATH"

      alias rebuild="sudo bash ~/bin/rebuild.sh"
      alias cleanup="sudo nix-collect-garbage -d && sudo nixos-rebuild switch"
      alias gemma="(ollama serve &> /dev/null) & (sleep 1 && ollama pull gemma3:4b-it-qat &> /dev/null && ollama run gemma3:4b-it-qat)"
      alias record="asak rec"
      alias play="asak play"
    '';
  };

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
      };
    };
  };

  home.stateVersion = "25.05";
}

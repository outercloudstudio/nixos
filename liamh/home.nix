{ config, pkgs, ... }:

{
  home.username = "liamh";
  home.homeDirectory = "/home/liamh";

  imports = [
    ./hypr
    ./backgrounds
  ];

  home.packages = with pkgs; [

  ];

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
    '';
  };

  home.stateVersion = "25.05";
}

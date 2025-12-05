{ config, pkgs, ... }:

{
    programs.bash = {
        enable = true;
        enableCompletion = true;
        bashrcExtra = ''
        export EDITOR='code --wait'
        export PATH="$HOME/bin:$PATH"

        PS1="\u \w > "

        alias rebuild="sudo nixos-rebuild switch --flake . --impure"
        alias cleanup="sudo nix-collect-garbage -d && rebuild"
        eval "$(direnv hook bash)"
        '';
    };
}
{ config, pkgs, ... }:

{
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
        eval "$(direnv hook bash)"
        '';
    };
}
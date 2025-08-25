{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig.credential.helper = "manager";
        extraConfig.credential."https://github.com".username = "outercloud";
        extraConfig.credential.credentialStore = "cache";
    };

    programs.seahorse.enable = true;
    
    home.packages = with pkgs; [ git, git-credential-manager ];
}

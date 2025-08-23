{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig.credential.helper = "manager";
        extraConfig.credential."http://github.com".username = "outercloudstudio";
        extraConfig.credential.credentialStore = "cache";
    };
    
    home.packages = with pkgs; [ git-credential-manager ];
}

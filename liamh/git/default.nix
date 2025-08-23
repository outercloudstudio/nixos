{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig.credential.helper = "manager";
        extraConfig.credential."http://github.com".username = "outercloudstudio";
        extraConfig.crednetial.credentialStore = "secretservice";
    };
    
    home.packages = with pkgs; [ git-credential-manager ];
}

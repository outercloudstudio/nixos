{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig.credential = {
            helper = "manager";
            credentialStore = "store";
            
            "https://github.com".username = "outercloudstudio";
        };
    };

    home.packages = with pkgs; [
        git-credential-manager
    ];
}

{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig.credential = {
            helper = "manager";
            extraConfig.credential."https://github.com".username = "outercloudstudio";
            credentialStore = "store";
        };
    };

    home.packages = with pkgs; [
        git-credential-manager
    ];
}

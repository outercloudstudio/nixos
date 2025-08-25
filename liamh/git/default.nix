{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig = {
            credential.helper = "${
                pkgs.git.override { withLibsecret = true; }
                }/bin/git-credential-libsecret";
        };
    };
    
    home.packages = with pkgs; [ git-credential-manager ];
}

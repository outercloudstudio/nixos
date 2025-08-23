{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig.credential.helper = "manager";
        extraConfig.credential."http://git.htlec.org".username = "outercloudstudio";
        extraConfig.crednetial.credentialStore = "cache";
    };
}

{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "outercloudstudio";
        userEmail = "outercloudstudio@gmail.com";

        extraConfig.credential.helper = "libsecret";
    };

    services.pass-secret-service.enable = true;

    home.packages = with pkgs; [
        pass
    ]
}

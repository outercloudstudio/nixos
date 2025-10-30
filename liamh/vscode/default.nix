{ pkgs-unstable, pkgs, ... } : {
    # home.packages = with pkgs-unstable; [
    #     vscode
    # ];

    home.packages = with pkgs; [
        nil
    ];

    programs.vscode = {
        enable = true;
        
        package = pkgs-unstable.vscode;

        profiles.default.extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            mkhl.direnv
            pkief.material-icon-theme
            esbenp.prettier-vscode
            scala-lang.scala
            vue.volar
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "beardedtheme";
                publisher = "beardedbear";
                version = "10.1.0";
                sha256 = "sha256-7MkvLEadzgB7af01lYibEOqHn9bvzlpgMTEiiQBlEzA=";
            }
            {
                name = "QML";
                publisher = "bbenoist";
                version = "1.0.0";
                sha256 = "sha256-tphnVlD5LA6Au+WDrLZkAxnMJeTCd3UTyTN1Jelditk=";
            }
        ];

        profiles.default.userSettings = {
            "git.enableSmartCommit" = true;
            "git.confirmSync" = false;
            "git.blame.statusBarItem.template" = "\${subject} \${authorName} (\${authorDateAgo})";

            "explorer.confirmDelete" = false;
            "explorer.confirmDragAndDrop" = false;

            "editor.minimap.enabled" = false;
            "editor.bracketPairColorization.enabled" = false;

            "workbench.iconTheme" = "material-icon-theme";
            "workbench.colorTheme" = "Bearded Theme Monokai Black";

            "chat.agent.enabled" = false;
            "chat.commandCenter.enabled" = false;
            "chat.edits2.enabled" = false;
            "chat.extensionTools.enabled" = false;
            "chat.promptFiles" = false;
            "chat.sendElementsToChat.enabled" = false;
            "chat.useFileStorage" = false;
            "chat.mcp.access" = "none";
            "chat.disableAIFeatures" = true;

            "telemetry.feedback.enabled" = false;
            "telemetry.telemetryLevel" = "off";
        };
    };
}
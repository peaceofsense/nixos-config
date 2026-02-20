{ config, pkgs, ... }: {

    home.file.".config/Code/User/globalStorage/alefragnani.project-manager/projects.json".source = ./projects.json;
    home.file.".config/Code/User/globalStorage/alefragnani.project-manager/fau-evt.code-workspace".source = ./fau-evt.code-workspace;
    home.file.".config/Code/User/globalStorage/alefragnani.project-manager/m17.code-workspace".source = ./m17.code-workspace;
    home.file.".config/Code/User/globalStorage/alefragnani.project-manager/dotfiles.code-workspace".source = ./dotfiles.code-workspace;
    programs.vscode = {
        enable = false;
        profiles.default ={
            enableExtensionUpdateCheck = false;
            extensions = with pkgs.vscode-extensions; [
                alefragnani.project-manager
                bbenoist.nix
                catppuccin.catppuccin-vsc
                catppuccin.catppuccin-vsc-icons
            # cweijan.vscode-office
            # ericsia.pythonsnippets3
                
                jdinhlife.gruvbox
                johnpapa.vscode-peacock
                ms-python.debugpy
                ms-python.python
                ms-python.vscode-pylance
                ms-toolsai.datawrangler
                ms-toolsai.jupyter
                ms-toolsai.jupyter-keymap
                ms-toolsai.jupyter-renderers
                ms-toolsai.vscode-jupyter-cell-tags
                ms-toolsai.vscode-jupyter-slideshow
            # randomfractalsinc.geo-data-viewer
            # randomfractalsinc.vscode-data-preview
            ];
            userSettings = {
                "editor.tabSize" = 4;
                "editor.formatOnSave" = true;
                "files.autoSave" = "onWindowChange";
            };
        };
    };
}



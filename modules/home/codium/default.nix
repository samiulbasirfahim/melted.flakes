{ pkgs, ... }: {
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        userSettings = {
            "workbench.colorTheme": "One Dark";
            "workbench.productIconTheme": "material-product-icons";
            "window.zoomLevel": "0.3";
            "window.menuBarVisibility": "hidden";
            "editor.mouseWheelZoom": "false";
        };
        keybindings = {
            [
                {
                  key = "ctrl+c";
                  command = "editor.action.clipboardCopyAction";
                  when = "textInputFocus";
                }
            ]
        };
        extensions = with pkgs.vscode-extensions;[
            jnoortheen.nix-ide
            mskelton.one-dark-theme
            pkief.material-product-icons
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                # name = "min-theme";
                # publisher = "miguelsolorio";
                # version = "1.5.0";
                # sha256 = "DF/9OlWmjmnZNRBs2hk0qEWN38RcgacdVl9e75N8ZMY=";
            }
        ];
    };
}
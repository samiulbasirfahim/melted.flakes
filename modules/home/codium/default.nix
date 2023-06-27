{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    #     userSettings = {
    #       "workbench.colorTheme" = "One Dark";
    #       "workbench.productIconTheme" = "material-product-icons";
    #       "window.zoomLevel" = "0.3";
    #       "window.menuBarVisibility" = "toggle";
    #       "editor.mouseWheelZoom" = "false";
    #       "editor.minimap.enabled" = "false";
    #       "workbench.statusBar.visible" = "false";
    #     };
    #     keybindings = [
    #       {
    #         "key" = "ctrl+shift+i";
    #         "command" = "editor.action.formatDocument";
    #         "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
    #       }
    #     ];
    #     extensions = with pkgs.vscode-extensions;
    #       [
    #         jnoortheen.nix-ide
    #         mskelton.one-dark-theme
    #         pkief.material-product-icons
    #       ]
    #       ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #         # {
    #         # name = "min-theme";
    #         # publisher = "miguelsolorio";
    #         # version = "1.5.0";
    #         # sha256 = "DF/9OlWmjmnZNRBs2hk0qEWN38RcgacdVl9e75N8ZMY=";
    #         # }
    #       ];
  };
}

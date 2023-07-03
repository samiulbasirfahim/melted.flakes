{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.productIconTheme" = "material-product-icons";
      "editor.fontFamily" = "JetbrainsMono nerd font";
      "editor.fontSize" = 16;
      "editor.lineHeight" = 2;
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = 0.1;
      "workbench.statusBar.visible" = false;
      "editor.minimap.enabled" = false;
      "git.autofetch" = true;
      "terminal.integrated.fontFamily" = "JetbrainsMono nerd font";
      "terminal.integrated.fontSize" = 16;
      "workbench.startupEditor" = "none";
      "editor.mouseWheelZoom" = false;
      "workbench.iconTheme" = "catppuccin-mocha";
    };
    keybindings = [
      {
        "key" = "ctrl+shift+i";
        "command" = "editor.action.formatDocument";
        "when" = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
      }
    ];
    extensions = with pkgs.vscode-extensions; [
      kamadorueda.alejandra
      catppuccin.catppuccin-vsc
      bbenoist.nix
      pkief.material-product-icons
      catppuccin.catppuccin-vsc-icons
    ];
    #++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [];
  };
  programs.zsh.shellAliases = {
    code = "codium -ozone-platform-hint";
  };
  home.packages = with pkgs; [
    inputs.alejandra.defaultPackage.${system}
  ];
}

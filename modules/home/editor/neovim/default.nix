{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.packages = with pkgs; [
    rnix-lsp
    nil
    nodePackages_latest.typescript-language-server
    rust-analyzer
    lua-language-server
    python311Packages.jedi-language-server
    llvmPackages_15.clang-unwrapped
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.grammarly-languageserver
    nodePackages_latest.bash-language-server
    nodePackages_latest.yaml-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    gopls
    zls
    ripgrep
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

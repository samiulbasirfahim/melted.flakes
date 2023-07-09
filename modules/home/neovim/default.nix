{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.packages = with pkgs; [
    rnix-lsp
    ripgrep
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

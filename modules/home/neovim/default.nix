{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.packages = with pkgs; [
    rnix-lsp
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

{
  inputs,
  pkgs,
  ...
}: {
  imports =
    [inputs.nixvim.homeManagerModules.nixvim]
    ++ [(import ./telescope.nix)]
    ++ [(import ./lsp.nix)]
    ++ [(import ./nvimtree.nix)]
    ++ [(import ./options.nix)]
    ++ [(import ./colorscheme.nix)];
  programs.neovim = {
    defaultEditor = true;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    maps.normalVisualOp.";" = ":";
    clipboard.providers.wl-copy.enable = true;
  };
}

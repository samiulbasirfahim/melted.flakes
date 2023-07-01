{pkgs, ...}: {
  programs.nixvim.plugins.lsp = {
    lsp = {
      enable = true;
      servers = {
        rust-analyzer = {
          enable = true;
          package = pkgs.rust-analyzer;
        };
        rnix-lsp = {
          enable = true;
          package = pkgs.rnix-lsp;
        };
      };
    };
  };
}

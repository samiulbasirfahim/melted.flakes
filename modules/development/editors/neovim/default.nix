{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  environment.variables.EDITOR = "nvim";
  home-manager.users.xenoxanite = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
    home.packages = with pkgs; [
      # utilities
      ripgrep

      # language server
      # llvmPackages_16.clang-unwrapped
      ccls
      clang-tools
      nil
      lua-language-server
      nodePackages_latest.typescript-language-server

      # formatter
      stylua
      nixfmt
    ];
    home.sessionVariables = { EDITOR = "nvim"; };
  };
}
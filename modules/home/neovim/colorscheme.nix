{...}: {
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    transparentBackground = true;
    background = {
      dark = "mocha";
      light = "mocha";
    };
  };
}

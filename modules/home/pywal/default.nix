{
  imports = [(import ./rofi.nix)] ++ [(import ./alacritty.nix)];
  programs.pywal = {
    enable = true;
  };
}

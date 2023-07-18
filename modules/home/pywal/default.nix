{
  imports = [(import ./rofi.nix)];
  programs.pywal = {
    enable = true;
  };
}

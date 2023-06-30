{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    webcord
    neovim
    pavucontrol
    xfce.thunar
  ];
}

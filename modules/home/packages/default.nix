{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    webcord
    pavucontrol
    xfce.thunar
    pkgs.gnome3.gnome-tweaks
  ];
}

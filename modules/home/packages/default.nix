{pkgs, ...}: {
  home.packages = with pkgs; [
    webcord
    pavucontrol
    xfce.thunar

    # Multimedia
    mpv
    imv
  ];
}

{pkgs, ...}: {
  imports =
    [(import ./python.nix)]
    ++ [(import ./javascript.nix)];
  home.packages = with pkgs; [
    webcord
    pavucontrol
    xfce.thunar

    # utilites
    btop

    # Multimedia
    mpv
    imv
  ];
}

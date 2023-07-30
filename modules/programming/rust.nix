{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    rustc
    pkg-config
  ];
}

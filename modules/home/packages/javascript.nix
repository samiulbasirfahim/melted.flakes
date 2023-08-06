{pkgs, ...}: {
  home.packages = with pkgs; [
    electron
    nodejs
    yarn
    pm2
  ];
}

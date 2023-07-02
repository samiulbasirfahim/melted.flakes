{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    yarn
    pm2
  ];
}

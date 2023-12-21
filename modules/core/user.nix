{pkgs, ...}: {
  users.users.fahim = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };
}

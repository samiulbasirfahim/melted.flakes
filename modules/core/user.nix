{pkgs, ...}: {
  users.users.xenoxanite = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
  };
}

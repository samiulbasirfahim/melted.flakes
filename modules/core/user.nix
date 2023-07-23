{pkgs, ...}: {
  users.users.xenoxanite = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    packages = with pkgs; [
      firefox
      kitty
      pavucontrol
      git
      wget
      vscodium
    ];
    shell = pkgs.fish;
  };
}

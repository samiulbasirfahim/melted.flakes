{ pkgs, ... }: {
  users.users.xenoxanite = {
    isNormalUser = true;
    description = "xenoxanite";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
}

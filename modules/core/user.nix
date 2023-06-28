{pkgs, ...}: {
  users.users.xenoxanite = {
    isNormalUser = true;
    description = "Xenoxanite";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [kitty firefox neovim pavucontrol];
  };
}

{pkgs, ...}: {
  users.users.xenoxanite = {
    isNormalUser = true;
    description = "Xenoxanite";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [kitty firefox neovim pavucontrol];
  };
}

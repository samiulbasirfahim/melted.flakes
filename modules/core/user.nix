{pkgs, ...}: {
  users.users.xenoxanite = {
    isNormalUser = true;
    description = "Xenoxanite";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [firefox neovim pavucontrol];
  };
}

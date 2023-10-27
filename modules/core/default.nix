{
  inputs,
  nixpkgs,
  self,
  ...
}: {
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    system = "x86_64-linux";
    modules = [
      ./../../hosts/nixos/hardware-configuration.nix
      ./bootloader.nix
      ./hardware.nix
      ./home-manager.nix
      ./network.nix
      ./pipewire.nix
      ./programs.nix
      ./security.nix
      ./services.nix
      ./system.nix
      ./user.nix
      ./warp.nix
      ./gaming.nix
      ./../desktops/hyprland

      # wayland based programs for hyprland
      ./../programs/wayland/mako
      ./../programs/wayland/swaylock
      ./../programs/wayland/waybar
      ./../programs/wayland/wlogout
      ./../programs/wayland/foot
      ./../programs/wayland/rofi

      # Packages for programming
      # ./../development/languages/javascript.nix
      # ./../development/languages/python.nix
      # ./../development/languages/rust.nix
      ./../development/languages/c.nix

      # editors
      # ./../development/editors/vscode
      ./../development/editors/neovim

      # utility based programs
      ./../programs/utilities/git
      ./../programs/utilities/bat
      ./../programs/utilities/zsh
      ./../programs/utilities/neofetch
      ./../programs/utilities/starship
      ./../programs/utilities/btop
      ./../programs/utilities/kitty

      # theme based programs
      ./../programs/theme/pywal
      ./../programs/theme/gtk
    ];
  };
}

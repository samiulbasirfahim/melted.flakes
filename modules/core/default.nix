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
      ./../programs/fish
      ./../programs/pywal
      ./../desktops/hyprland

      # wayland based programs for hyprland
      ./../programs/wayland/mako
      ./../programs/wayland/swaylock
      ./../programs/wayland/waybar
      ./../programs/wayland/wlogout
      ./../programs/wayland/foot

      # Packages for programming
      ./../programming/javascript.nix
      ./../programming/python.nix
      ./../programming/rust.nix

      # editors
      ./../programs/editors/vscode
      ./../programs/editors/neovim

      # utility based programs
      ./../programs/utilities/git
      ./../programs/utilities/bat
      ./../programs/utilities/neofetch
    ];
  };
}

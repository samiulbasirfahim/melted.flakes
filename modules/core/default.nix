{
  inputs,
  nixpkgs,
  self,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in {
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    system = "x86_64-linux";
    modules =
      [(import ./../../hosts/nixos/hardware-configuration.nix)]
      ++ [./bootloader.nix]
      ++ [./hardware.nix]
      ++ [./home-manager.nix]
      ++ [./network.nix]
      ++ [./wayland.nix]
      # ++ [./virtualization.nix]
      ++ [./warp.nix]
      ++ [./security.nix]
      ++ [./programs.nix]
      ++ [./pipewire.nix]
      ++ [./services.nix]
      ++ [./programs.nix]
      ++ [./system.nix]
      ++ [./user.nix];
  };
}

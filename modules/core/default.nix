{
  inputs,
  nixpkgs,
  self,
  ...
}: {
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
      ++ [./warp.nix]
      ++ [./security.nix]
      ++ [./programs.nix]
      ++ [./pipewire.nix]
      ++ [./services.nix]
      ++ [./programs.nix]
      ++ [./system.nix]
      ++ [./user.nix]
      ++ [./xserver.nix];
  };
}

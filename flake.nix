{
  description = "Xenoxanite's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager.url = "github:nix-community/home-manager";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    hyprland-contrib.url = "github:hyprwm/contrib";
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    selfPkgs = import ./pkgs;
  in {
    overlays.default = selfPkgs.overlay;
    nixosConfigurations = import ./modules/core/default.nix {
      inherit self nixpkgs inputs;
    };
  };
}

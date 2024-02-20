{
  description = "My personal nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardened-firefox = {
      url = "github:arkenfox/user.js";
      flake = false;
    };
    picom = {
      url = "github:Arian8j2/picom-jonaburg-fix";
      flake = false;
    };
    hosts.url = "github:StevenBlack/hosts";
  };
  outputs = { nixpkgs, self, ... }@inputs:
    let
      selfPkgs = import ./pkgs;
      system = "x86_64-linux";
      user = "xenoxanite";
      inherit (nixpkgs) lib;
    in {
      packages = nixpkgs.legacyPackages.${system};
      overlays.default = selfPkgs.overlay;
      formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
      nixosConfigurations.oxygen = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/oxygen ];
        specialArgs = { inherit inputs self user; };
      };
    };
}

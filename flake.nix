{
  description = "My personal nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
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
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hosts.url = "github:StevenBlack/hosts";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hycov = {
      url = "github:DreamMaoMao/hycov";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypr-contrib.url = "github:hyprwm/contrib";
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

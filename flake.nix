{
  description = "Xenoxanite's nixos configuration";

inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , self
    , ...
    } @ inputs:
    let
      selfPkgs = import ./pkgs;
    in
    {
      overlays.default = selfPkgs.overlay;
      nixosConfigurations = import ./modules/core/default.nix {
        inherit self nixpkgs inputs;
      };
    };
}

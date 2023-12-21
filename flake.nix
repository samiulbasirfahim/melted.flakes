{
  description = "My very minimal nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager.url = "github:nix-community/home-manager";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    hyprland-contrib.url = "github:hyprwm/contrib";
    nur.url = "github:nix-community/NUR";
#   neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };
  outputs = { nixpkgs, self, ... }@inputs:
    let selfPkgs = import ./pkgs;
    in {
      overlays.default = selfPkgs.overlay;
      formatter.x86_64-linux = inputs.alejandra.defaultPackage.x86_64-linux;
      nixosConfigurations =
        import ./modules/core/default.nix { inherit self nixpkgs inputs; };
    };
}

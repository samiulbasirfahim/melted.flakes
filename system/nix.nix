{ self, inputs, ... }: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  imports = with inputs; [ hosts.nixosModule ];
  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnsupportedSystem = true;
      allowUnfree = true;
    };
    overlays = let
      myOverlay = self: super: {
        discord = super.discord.override { withVencord = true; };
      };
    in with inputs; [
      myOverlay
      self.overlays.default
      nur.overlay
      neovim-nightly-overlay.overlay
    ];
  };
}

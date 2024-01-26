{ self,  inputs, ... }: {
  nixpkgs = {
    overlays = let
      myOverlay = self: super: {
        discord = super.discord.override { withVencord = true; };

      };

    in [
     inputs.neovim-nightly-overlay.overlay
      self.overlays.default
      myOverlay
      inputs.nur.overlay
    ];
  };
  systemd.network.wait-online.enable = false;
  # services.tailscale.enable = true;
  # services.openssh.enable = true;
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  time.timeZone = "Asia/Dhaka";
  time.hardwareClockInLocalTime = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  system.stateVersion = "23.11";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

}

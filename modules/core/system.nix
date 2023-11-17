{ self, pkgs, lib, inputs, ... }: {
  nixpkgs = {
    overlays = let
      myOverlay = self: super:
        {
          # discord = super.discord.override {
          # withVencord = true;
          # };
        };
    in [ self.overlays.default myOverlay inputs.nur.overlay ];
  };
  systemd.network.wait-online.enable = false;
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
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  system.stateVersion = "23.05";
  #
  # i18n.inputMethod = {
  #   enabled = "fcitx5";
  #   fcitx5.addons = with pkgs; [
  #     fcitx5-mozc
  #     fcitx5-gtk
  #   ];
  # };

  environment.systemPackages = with pkgs; [ gcc13 ];

}

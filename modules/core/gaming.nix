{
  pkgs,
  nixpkgs,
  ...
}: {
  programs.gamescope.enable = true;
  programs.steam.enable = true;
  nixpkgs.overlays = [
    (
      _: prev: {
        steam = prev.steam.override {
          extraPkgs = pkgs:
            with pkgs; [
              keyutils
              libkrb5
              libpng
              libpulseaudio
              libvorbis
              stdenv.cc.cc.lib
              xorg.libXcursor
              xorg.libXi
              xorg.libXinerama
              xorg.libXScrnSaver
            ];
          extraProfile = "export GDK_SCALE=1";
        };
      }
    )
  ];
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };

      # Warning: GPU optimisations have the potential to damage hardware
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };

      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    osu-lazer
    xonotic
    steam-run-native
  ];
}

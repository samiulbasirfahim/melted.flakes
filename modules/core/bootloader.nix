{
  pkgs,
  lib,
  inputs,
  ...
}: {
  inputs = [inputs.darkmatter.nixosModule];
  boot = {
    loader = {
      systemd-boot.enable = lib.mkForce false;
      grub = {
        enable = lib.mkForce true;
        efiSupport = true;
        device = "nodev";
        theme = pkgs.stdenv.mkDerivation {
          pname = "distro-grub-themes";
          version = "3.1";
          src = pkgs.fetchFromGitHub {
            owner = "AdisonCavani";
            repo = "distro-grub-themes";
            rev = "v3.1";
            hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
          };
          installPhase = "cp -r customize/nixos $out";
        };
      };

      efi.canTouchEfiVariables = true;
    };
    initrd = {
      kernelModules = ["amdgpu"];
      systemd.enable = true;
    };
    kernelPackages = lib.mkDefault pkgs.linuxPackages_xanmod_stable;
  };

  systemd = {
    enableEmergencyMode = false;
    watchdog.runtimeTime = "15s";
    watchdog.rebootTime = "15s";
    network.wait-online.enable = false;
    extraConfig = ''
      DefaultTimeoutStartSec=10s
      DefaultTimeoutStopSec=10s
    '';
  };
}

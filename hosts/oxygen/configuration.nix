# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, inputs, ... }:

{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "oxygen"; # Define your hostname.
  networking.useDHCP = true;

  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";

  programs = { dconf.enable = true; };
  services = {
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      windowManager.dwm.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  users.users.xenoxanite = {
    isNormalUser = true;
    password = "rainy";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      eza
      git
      gh

      qutebrowser
      cloudflare-warp
      gcc
    ];
  };
  system.stateVersion = "23.11"; # Did you read the comment?

}

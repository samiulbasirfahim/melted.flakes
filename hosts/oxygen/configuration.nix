# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, inputs, user, ... }:

{

  networking = {
    stevenblack = {
      enable = true; # don't touch hosts file on a server
      block = [ "fakenews" "gambling" "porn" "social" ];
    };
  };
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines;
      [ # any engine you want, for example
        openbangla-keyboard
      ];
  };
  programs = {
    # zsh.loginShellInit = ''
    #   if [[ "$(tty)" == "/dev/tty1" ]] then
    #     Hyprland
    #   fi
    # '';
    # hyprland.enable = true;
    dconf.enable = true;
    zsh.enable = true;
  };
  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  users.users.${user} = {
    isNormalUser = true;
    password = "rainy";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ eza gcc ];
  };
  system.stateVersion = "23.11";
}

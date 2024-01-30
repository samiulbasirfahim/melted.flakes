{ config, pkgs, lib, ... }:
let
  hosts = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts";
    hash = "sha256-Ro2zClGV52eqRcr6muwVSHkAGhsSFr4p5zD8rfghnCM=";
  };

in {
  options.cloudflare-warp.enable = lib.mkEnableOption "Cloudflare Warp";
  config = {
    environment = {
      etc."hosts" = { source = lib.mkForce hosts; };
      systemPackages = with pkgs;
        (if config.cloudflare-warp.enable then [ cloudflare-warp ] else [ ]);
    };
    systemd = lib.mkIf config.cloudflare-warp.enable {
      services."warp-svc".wantedBy = [ "multi-user.target" ];
      user.services."warp-taskbar".wantedBy = [ "tray.target" ];
      packages = with pkgs; [ cloudflare-warp ];
    };
    networking = {
      hostName = "nixos";
      networkmanager.enable = true;
      nameservers = [ "1.1.1.1" ];
      firewall.enable = false;
    };
  };
}

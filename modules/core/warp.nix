{ pkgs, ... }: {
  systemd.packages = with pkgs; [ cloudflare-warp ];
  systemd.services."warp-svc".wantedBy = [ "multi-user.target" ];
  environment.systemPackages = with pkgs; [ cloudflare-warp ];
}

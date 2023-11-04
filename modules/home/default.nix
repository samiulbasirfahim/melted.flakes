{
  imports = [ ./discord ./firefox ./packages ./scripts ./spotify ];
  nixpkgs.config.packageOverrides = pkgs:
    {
      # qutebrowser = pkgs.qutebrowser.override { enableVulkan = true; };
    };
}

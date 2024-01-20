{
  imports = [ ./discord ./packages ./scripts ./spotify ];
  "nixpkgs".config.packageOverrides = pkgs:
    {
      # qutebrowser = pkgs.qutebrowser.override { enableVulkan = true; };
    };
  "home".sessionPath = [ "$HOME/bin" "$HOME/.local/bin" ];
}

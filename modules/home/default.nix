{
  imports = [ ./discord ./firefox ./packages ./scripts ./spotify ];
  nixpkgs.config.packageOverrides = pkgs:
    {
      # qutebrowser = pkgs.qutebrowser.override { enableVulkan = true; };
    };
  home.sessionPath =
    [ "$HOME/bin" "$HOME/.local/bin" "$HOME/.config/emacs/bin" ];
}

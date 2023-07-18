{
  programs.fish = {
    enable = true;
    loginShellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
    '';
    shellInit = ''
      set PATH $PATH ~/.cargo/bin
      set PATH $PATH ~/.local/bin
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/xenoxanite/Flakes/.#nixos";
      ncg = "nix-collect-garbage -d && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      ls = "exa -l --icons";
      cat = "bat -p";
      record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
    };
  };
}

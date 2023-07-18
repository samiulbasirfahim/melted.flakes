{pkgs, ...}: {
  programs.fish = {
    enable = true;
    loginShellInit = ''
      if [[ "$(tty)" == "/dev/tty1" ]]
      then
          exec Hyprland &
      fi'';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/xenoxanite/Flakes/.#nixos --impure";
      ncg = "nix-collect-garbage -d && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      ls = "exa -l --icons";
      cat = "bat -p";
      record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
    };
  };
}

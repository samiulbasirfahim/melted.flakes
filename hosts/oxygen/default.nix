{ inputs, self, pkgs, ... }: {
  imports =
    [ ../../home ./configuration.nix ./hardware-configuration.nix ../../system ]
    ++ [

    ];

  nixpkgs.overlays = [ self.overlays.default ];
}

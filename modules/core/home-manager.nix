{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.joypixels.acceptLicense = true;
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users.xenoxanite = {
      imports = [(import ./../home)];
      home = {
        username = "xenoxanite";
        homeDirectory = "/home/xenoxanite";
        stateVersion = "22.11";
      };
      programs.home-manager.enable = true;
    };
  };
}

{ inputs, ...}: {
    imports = [inputs.home-manager.nixosModules.home-manager];
    home-manager = {
        useUserPackage = true;
        useGlobalPackage = true;
        extraSpecialArgs = {inherit inputs;};
        user.xenoxanite = {
            imports = [(import ./../home/default.nix)]
            home = {
                username = xenoxanite;
                homeDirectory = "/home/xenoxanite/";
                stateVersion = "23.05";
            };
            programs.home-manager.enable = true;
        };
    };
};
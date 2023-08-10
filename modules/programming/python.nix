{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = with pkgs; [
      (python311.withPackages (ps:
        with ps; [
          requests
          datetime
        ]))
    ];
  };
}

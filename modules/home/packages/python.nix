{pkgs, ...}: {
  home.packages = with pkgs; [
    python311
    # (python311.withPackages (ps:
    # with ps; [
    # ]))
  ];
}

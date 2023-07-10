{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        pandas
        numpy
        requests
        tkinter
      ]))
  ];
}

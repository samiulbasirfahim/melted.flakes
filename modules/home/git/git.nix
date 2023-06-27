{ pkgs, ...}: {
    programs.git = {
        enable = true;
        userName = "xenoxanite";
        userEmail = "xenoxanite@gmail.com";
    };

    home.packages = with pkgs; [
        gh
    ];
}
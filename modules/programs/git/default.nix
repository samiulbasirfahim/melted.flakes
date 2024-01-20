{pkgs, ...}: let
  push = pkgs.writeShellScriptBin "push" ''
    git_directory=$PWD/.git
    if [[ -d $git_directory ]];then
      git add .
      read -p "Enter commit name: " commit_name
      git commit -m "$commit_name"
      git push
    else
      echo "Git wasn't initialized here."
    fi
  '';
in {
  home-manager.users.xenoxanite = {
    programs.git = {
      enable = true;
      userName = "xenoxanite";
      userEmail = "xenoxanite@gmail.com";
    };

    home.packages = with pkgs; [
      gh
      push
      lazygit
    ];
  };
}

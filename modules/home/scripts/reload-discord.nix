{pkgs, ...}: let
  reload-discord = pkgs.writeShellScriptBin "reload-discord" ''
    #!/bin/sh
    path="$HOME/.config/Vencord/settings/"
    config="$HOME/.config/Vencord/settings/"
    usrconfig="$HOME/.config/Vencord/settings/"

    # Try to use a user defined theme if it exists
    themefile=$usrconfig/pywal-discord-default.css
    if [ ! -f "$themefile" ]; then
      themefile=$config/pywal-discord.css
    fi

    newfile=$path/quickCss.css

    # Adapt metadata to theme
    sed "s/@name Pywal-Discord/@name Pywal-Discord-$theme/" "$config/meta.css" > /tmp/pywal-discord-meta

    cat /tmp/pywal-discord-meta "$HOME/.cache/wal/colors.css" "$themefile" > "$newfile"
    if [ ! -f "$newfile" ]
    then
        echo ⚠️ THEME WAS NOT CREATED ⚠️
        echo Try to change path with -p because $path doesn\'t exist, or add -d to create it
        exit 1
    fi

  '';
in {
  home.packages = [
    reload-discord
  ];
}

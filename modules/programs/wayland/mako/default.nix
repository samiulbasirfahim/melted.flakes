{pkgs, ...}: {
  home-manager.users.xenoxanite = {
    home.packages = [pkgs.libnotify pkgs.mako];
    xdg.configFile."mako/icons".source = ./icons;
    xdg.configFile."wal/templates/mako.conf".text = ''
      # GLOBAL CONFIGURATION OPTIONS
      max-history=100
      sort=-time

      # BINDING OPTIONS
      on-button-left=dismiss
      on-button-middle=none
      on-button-right=dismiss-all
      on-touch=dismiss
      on-notify=exec mpv /usr/share/sounds/freedesktop/stereo/message.oga

      # STYLE OPTIONS
      font=JetbrainsMono nerd font 10
      width=300
      height=100
      margin=18,16
      padding=20
      border-size=3
      border-radius=4
      icons=1
      max-icon-size=48
      icon-location=left
      markup=1
      actions=1
      history=1
      text-alignment=left
      default-timeout=5000
      ignore-timeout=0
      max-visible=5
      layer=overlay
      anchor=top-right

      background-color={color0}
      text-color={color7}
      border-color={color1}
      progress-color=over {color8}

      [urgency=low]
      border-color={color4}
      default-timeout=2000

      [urgency=normal]
      border-color={color1}
      default-timeout=5000

      [urgency=high]
      border-color={color3}
      text-color=#f38ba8
      default-timeout=0

      [category=mpd]
      border-color=#f9e2af
      default-timeout=2000
      group-by=category
    '';
  };
}

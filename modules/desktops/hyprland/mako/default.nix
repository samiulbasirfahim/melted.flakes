{ pkgs, ... }: {
  home-manager.users.xenoxanite = {
    home.packages = [ pkgs.libnotify pkgs.mako ];
    xdg.configFile."mako/icons".source = ./icons;
    xdg.configFile."mako/config.conf".text = ''
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
      font=ComicShannsMono nerd font 10
      width=300
      height=100
      padding=20
      border-size=2
      border-radius=0
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

      background-color=#101419
      text-color=#b6beca
      border-color=#70a5eb
      progress-color=over #22262e

      [urgency=high]
      border-color=#e05f65
    '';
  };
}

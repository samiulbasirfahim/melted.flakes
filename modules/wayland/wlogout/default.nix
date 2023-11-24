{ ... }:
let colors = import ./../../theme/colors.nix { };
in {
  xdg.configFile."wlogout/icons".source = ./assets;
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "lock";
        keybind = "l";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Log out";
        keybind = "e";
      }
    ];
    style = with colors; ''
      window {
          font-family: ${font};
          font-size: 18px;
          color: #${blue};
          background-color: rgba(0, 0, 0, 0.5);
      }
      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 50%;
          border: none;
          background-color: rgba(0, 0, 0, 0);
          margin: 5px;
          border-radius: 0px;
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }
      button:hover {
          background-color: #${background};
          opacity: 0.5;
      }
      button:focus {
          background-color: #${background};
          border: 3px solid #${green};
          border-radius: 0px;
          color: #${blue};
      }
      /** ********** Icons ********** **/
      #lock {
          background-image: image(url("icons/lock.png"), url("/usr/share/wlogout/icons/lock.png"));
      }

      #logout {
          background-image: image(url("icons/logout.png"), url("/usr/share/wlogout/icons/logout.png"));
      }

      #suspend {
          background-image: image(url("icons/suspend.png"), url("/usr/share/wlogout/icons/suspend.png"));
      }

      #hibernate {
          background-image: image(url("icons/hibernate.png"), url("/usr/share/wlogout/icons/hibernate.png"));
      }

      #shutdown {
          background-image: image(url("icons/shutdown.png"), url("/usr/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
          background-image: image(url("icons/reboot.png"), url("/usr/share/wlogout/icons/reboot.png"));
      }
    '';
  };
}

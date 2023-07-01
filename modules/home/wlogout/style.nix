{...}: {
  programs.wlogout.style = ''
      window {
        font-family: JetBrainsMono Nerd Font;
        font-size: 14pt;
        color: #CED7F4; /* text */
        background-color: rgba(46, 52, 64, 0.5);
    }
    button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 50%;
        border: none;
        background-color: rgba(30, 30, 46, 0);
        margin: 5px;
        transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
    }
    button:hover {
        background-color: rgba(29, 29, 44, 0.5);
    }
    button:focus {
        background-color: #1e1e2e;
        color:#E2C0C0;
    }
    #lock {
        background-image: image(url("./assets/lock.png"));
    }

    #logout {
        background-image: image(url("./assets/logout.png"));
    }

    #suspend {
        background-image: image(url("./assets/sleep.png"));
    }


    #shutdown {
        background-image: image(url("./assets/power.png"));
    }

    #reboot {
        background-image: image(url("./assets/restart.png"));
    }

  '';
}

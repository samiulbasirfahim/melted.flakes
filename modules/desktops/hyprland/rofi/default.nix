{ pkgs, ... }: {
  imports = [ (import ./theme.nix) ];
  home-manager.users.xenoxanite = {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
    xdg.configFile."rofi/config.rasi".text = ''
      configuration{
          modi: "run,drun,window";
          lines: 5;
          font: " ComicShannsMono Nerd Font 12";
          show-icons: true;
          icon-theme: "Papirus";
          terminal: "kitty";
          drun-display-format: "{icon} {name}";
          location: 0;
          disable-history: false;
          hide-scrollbar: true;
          sidebar-mode: true;
          display-drun: "   Apps ";
          display-run: "   Run ";
          display-window: " 﩯  Window";
      }

      @theme "themes/dark-decay"

      element-text, element-icon , mode-switcher {
          background-color: inherit;
          text-color:       inherit;
      }

      window {
          height: 400px;
          width: 550px;
          border: 2px;
          border-color: @border-col;
          background-color: @bg-col;
          padding: 10px;
      }

      mainbox {
          background-color: @bg-col;
      }

      inputbar {
          children: [prompt,entry];
          background-color: @bg-col;
          border-radius: 5px;
          padding: 2px;
      }

      prompt {
          background-color: @blue;
          padding: 6px;
          text-color: @bg-col;
          border-radius: 3px;
          margin: 20px 0px 0px 20px;
      }

      textbox-prompt-colon {
          expand: false;
          str: ":";
      }

      entry {
          padding: 6px;
          margin: 20px 0px 0px 10px;
          text-color: @fg-col;
          background-color: @bg-col;
      }

      listview {
          border: 0px 0px 0px;
          margin: 10px 5px 5px 10px;
          background-color: @bg-col;
      }

      element {
          padding: 5px;
          background-color: @bg-col;
          text-color: @fg-col  ;
      }

      element-icon {
          size: 25px;
      }

      element selected {
          background-color:  @selected-col ;
          text-color: @fg-col2  ;
          border-radius: 10px;
      }

      mode-switcher {
          spacing: 0;
        }

      button {
          padding: 10px;
          background-color: @bg-col-light;
          text-color: @grey;
          vertical-align: 0.5; 
          horizontal-align: 0.5;
      }

      button selected {
        background-color: @bg-col;
        text-color: @blue;
      }
    '';
  };
}

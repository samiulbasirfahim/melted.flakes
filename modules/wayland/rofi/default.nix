{ pkgs, ... }:
let ui = import ./../../theme/ui.nix { };
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  xdg.configFile."rofi/config.rasi".text = with ui.colors; ''
    configuration {
    	modi:				"drun";
    	font:				"${ui.nerd-font} 12";
    	show-icons:                     true;
    	icon-theme: 			"Reversal-dark";
    	display-drun: 			"";
    	drun-display-format:            "{name}";
    	sidebar-mode: 			false;
    }

    @theme "/dev/null"

    * {
    	bg:				#${background};
    	fg:				#${foreground};
      fg-sel:   #${blue};
    	accent:				#${green};
    	button:				#${brightblack};

    	background-color:		@bg;
    	text-color:			@fg;
    }

    window {
    	width:			    	37%;
    	padding: 			5px;
      border: ${toString ui.border-size}px;
      border-color: @accent;
    }

    prompt {
    	background-color:		@button;
    	enabled:			true;
    	padding:			0.5% 32px 0% -0.5%;
    	font:				"Product Sans 10";
    }

    entry {
        	placeholder:			"Search";
    	background-color:               @button;
        	placeholder-color:              @fg;
        	expand:                         true;
        	padding:                        0.15% 0% 0% 0%;
    }

    inputbar {
    	children:			[ prompt, entry ];
        	background-color:               @button;
        	expand:                         false;
        	border-radius:                  ${toString ui.border-radius}px;
        	margin:                         0%;
        	padding:                        10px;
    }

    listview {
        	columns:                        4;
        	lines:	                        3;
        	cycle:                          false;
        	dynamic:                        true;
        	layout:                         vertical;
    }

    mainbox {
        	children:                       [ inputbar, listview ];
        	spacing:                       	2%;
        	padding:                        2% 1% 2% 1%;
    }

    element {
        	orientation:                    vertical;
        	padding:                        2% 0% 2% 0%;
    }

    element-icon {
        	size:                           48px;
        	horizontal-align:	 	0.5;
    }

    element-text {
        	expand:                         true;
        	horizontal-align:               0.5;
        	vertical-align:                 0.5;
        	margin:                         0.5% 0.5% -0.5% 0.5%;
    }

    element-text, element-icon {
    	background-color:		inherit;
    	text-color:			inherit;
    }

    element selected {
        	background-color:               @button;
        	border-radius:                  ${toString ui.border-radius}px;
        	text-color:                  @fg-sel;
    }
  '';
  xdg.configFile."rofi/config-2.rasi".text = with ui.colors; ''
    configuration {
      display-drun: "  :";
      display-window: "Windows: ";
      drun-display-format: "{name}";
      modi: "window,run,drun";
      font: "${ui.nerd-font} 12";
    }

    @theme "/dev/null"

    * {
      background-color: @bg;
      margin: 0;
      padding: 0;
      spacing: 0;
    }

    window {
      width: 30%;
      padding: 12;

      border: 2;
      border-color: @lgreen;
      border-radius:  ${toString ui.border-radius}px;
    }

    element {
      padding: 8;
      text-color: @fg;
      border-radius:  ${toString ui.border-radius}px;
    }

    element selected {
      text-color: #${ui.border-color};
      background: #${brightblack}; 
    }

    element-text {
      background-color: #00000000;
      text-color: inherit;
      vertical-align: 0.5;
    }


    entry {
      background-color: @bg;
      padding: 12;
      text-color: @fg;

      margin-bottom: 50;
    }

    prompt {
      background-color: @bg;
      padding: 12;
      text-color: @fg;

      margin-bottom: 50;
    }

    inputbar {
      children: [prompt, entry];
    }

    listview {
      background-color: @bg;
      columns: 1;
      lines: 8;
    }
  '';
}

{pkgs, ...}: let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';
  launch-wlogout = pkgs.writeShellScriptBin "launch-wlogout" ''
    wlogout --layout $HOME/.config/wlogout/layout --css $HOME/.config/wlogout/style.css --buttons-per-row 4 \
                  --column-spacing 50 \
                  --row-spacing 50 \
                  --margin-top 250 \
                  --margin-bottom 250 \
                  --margin-left 150 \
                  --margin-right 150
  '';
in {
  imports = [(import ./wallpaper-picker.nix)] ++ [(import ./random-wall.nix)] ++ [(import ./reload.nix)] ++ [(import ./reload-discord.nix)];
  home.file.".config/cava/config1".text = "
[general]
; mode = normal
; framerate = 60
; autosens = 1
; overshoot = 20
; sensitivity = 100
bars = 12
; bar_width = 2
; bar_spacing = 1
; bar_height = 32
; bar_width = 20
; bar_spacing = 5
; lower_cutoff_freq = 50
; higher_cutoff_freq = 10000
sleep_timer = 10


[input]
; method = pulse
; source = auto

; method = alsa
; source = hw:Loopback,1

; method = fifo
; source = /tmp/mpd.fifo
; sample_rate = 44100
; sample_bits = 16

; method = shmem
; source = /squeezelite-AA:BB:CC:DD:EE:FF

; method = portaudio
; source = auto


[output]
method = raw
; channels = stereo
; mono_option = average
; reverse = 0
; raw_target = /dev/stdout
data_format = ascii
; bit_format = 16bit
ascii_max_range = 7
; bar_delimiter = 59
; frame_delimiter = 10
; sdl_width = 1000
; sdl_height = 500
; sdl_x = -1
; sdl_y= -1
; xaxis = none
; alacritty_sync = 1

[color]
; background = default
; foreground = default
; background = '#111111'
; foreground = '#33cccc'
; gradient = 0
; gradient_count = 8
; gradient_color_1 = '#59cc33'
; gradient_color_2 = '#80cc33'
; gradient_color_3 = '#a6cc33'
; gradient_color_4 = '#cccc33'
; gradient_color_5 = '#cca633'
; gradient_color_6 = '#cc8033'
; gradient_color_7 = '#cc5933'
; gradient_color_8 = '#cc3333'



[smoothing]
; integral = 77
; monstercat = 0
; waves = 0
; gravity = 100
; ignore = 0
; noise_reduction = 0.77


[eq]
; 1 = 1 # bass
; 2 = 1
; 3 = 1 # midtone
; 4 = 1
; 5 = 1 # treble

";
  home.packages = [cava-internal pkgs.cava launch-wlogout];
}

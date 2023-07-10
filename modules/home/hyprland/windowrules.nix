{
  xdg.configFile."hypr/windowrules.conf".text = "
# windowrule -------------------------------------
# wlogout
windowrule = float, wlogout
windowrule = noanim, wlogout

# rofi
windowrule = float,rofi
windowrule = noanim,rofi
# mpv
windowrule = float,mpv
windowrule = move 510 290,mpv
windowrule = size 900 500,mpv
windowrule = idleinhibit focus,mpv
windowrulev2 = idleinhibit focus, class:^(mpv)$
# imv
windowrule = float,imv
windowrule = move 510 290,imv
windowrule = size 900 500,imv
# firefox
windowrule = float,title:^(Firefox — Sharing Indicator)$
windowrule = move 0 0,title:^(Firefox — Sharing Indicator)$
windowrulev2 = float, title:^(Picture-in-Picture)$
windowrulev2 = opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$
windowrulev2 = pin, title:^(Picture-in-Picture)$
windowrulev2 = idleinhibit fullscreen, class:^(firefox)$
# pavucontrol
windowrule = size 700 450, pavucontrol
windowrule = move 40 55%, pavucontrol
# utilities
windowrule = float,title:^(Transmission)$
windowrule = float,title:^(Volume Control)$
  ";
}
